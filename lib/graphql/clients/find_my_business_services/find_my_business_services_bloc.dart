import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/service_where_input.dart';
import 'package:models/user_response.dart';
import 'find_my_business_services_ast.dart' show document;

part "find_my_business_services_extensions.dart";
part "find_my_business_services_events.dart";
part "find_my_business_services_states.dart";

enum FindMyBusinessServicesBlocHookStage { before, after }

class FindMyBusinessServicesBloc
    extends Bloc<FindMyBusinessServicesEvent, FindMyBusinessServicesState> {
  final GraphQLClient client;
  final Stream<FindMyBusinessServicesState> Function(
      FindMyBusinessServicesBloc context,
      FindMyBusinessServicesEvent event,
      FindMyBusinessServicesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindMyBusinessServicesBloc({required this.client, this.hook})
      : super(FindMyBusinessServicesInitial()) {
    on<FindMyBusinessServicesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindMyBusinessServicesState?> mapEventToState(
      FindMyBusinessServicesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindMyBusinessServicesBlocHookStage.before);
    //   }
    //  else
    if (event is FindMyBusinessServicesStarted) {
      return FindMyBusinessServicesInitial();
    } else if (event is FindMyBusinessServicesExcuted) {
      //start main excution
      return await findMyBusinessServices(event);
    } else if (event is FindMyBusinessServicesIsLoading) {
      // emit loading state
      {
        return FindMyBusinessServicesInProgress(data: event.data);
      }
    } else if (event is FindMyBusinessServicesIsOptimistic) {
      // emit optimistic result state
      return FindMyBusinessServicesOptimistic(data: event.data);
    } else if (event is FindMyBusinessServicesIsConcrete) {
      // emit completed result
      return FindMyBusinessServicesSuccess(data: event.data);
    } else if (event is FindMyBusinessServicesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindMyBusinessServicesFailed) {
      // emit failure state
      return FindMyBusinessServicesFailure(
          data: event.data, message: event.message);
    } else if (event is FindMyBusinessServicesErrored) {
      //emit error case
      return FindMyBusinessServicesError(
          data: event.data, message: event.message);
    } else if (event is FindMyBusinessServicesRetried) {
      findMyBusinessServicesRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindMyBusinessServicesBlocHookStage.after);
    // }
    return null;
  }

  void findMyBusinessServicesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findMyBusinessServicesRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindMyBusinessServicesState?> findMyBusinessServices(
      FindMyBusinessServicesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findMyBusinessServices(
            uid: event.uid,
            where: event.where,
            skip: event.skip,
            take: event.take);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindMyBusinessServicesReseted());
          Map<String, dynamic> errors = {};
          //collect errors/exceptions
          if (result.hasException) {
            errors['status'] = false;
            var message = 'Error';
            if (result.exception?.linkException != null) {
              //link exception means complete failure possibly throw here
              final exception = result.exception?.linkException;
              if (exception is RequestFormatException) {
                message = "Request format error";
              } else if (exception is ResponseFormatException) {
                message = "Response format error";
              } else if (exception is ContextReadException) {
                message = "Context read error";
              } else if (exception is ContextWriteException) {
                message = "Context write error";
              } else if (exception is ServerException) {
                message = exception.parsedResponse?.errors?.isNotEmpty == true
                    ? exception.parsedResponse!.errors!.map((e) {
                        return e.message;
                      }).join('\n')
                    : "Network error";
              }
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              // failure but migth have data available
              message = result.exception!.graphqlErrors.map((e) {
                return e.message;
              }).join('\n');
            }
            errors['message'] = message;
          }
          // convert result to data type expected by listeners
          var data = UserResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = UserResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = UserResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindMyBusinessServicesErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindMyBusinessServicesFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindMyBusinessServicesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindMyBusinessServicesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindMyBusinessServicesIsConcrete(data: data));
            } else {
              add(FindMyBusinessServicesErrored(
                  data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindMyBusinessServicesError(
            data: state.data!, message: e.toString());
      }
    }
    return null;
  }

  closeResultWrapper() async {
    // if (resultWrapper != null) {
    if (resultWrapper?.isObservable == true &&
        resultWrapper?.observableQuery != null) {
      await resultWrapper!.observableQuery!.close();
    }
    if (resultWrapper?.isStream == true &&
        resultWrapper?.stream != null &&
        resultWrapper?.subscription != null) {
      await resultWrapper!.subscription!.cancel();
    }
    // }
  }

  UserResponse get getData {
    return (state is FindMyBusinessServicesInitial) ||
            (state is FindMyBusinessServicesError)
        ? null
        : (state as dynamic)?.data;
  }

  Map<String, dynamic> loadFromCache() {
    var queryRequest = resultWrapper?.observableQuery?.options.asRequest;
    if (queryRequest != null) {
      final data = client.readQuery(queryRequest);
      if (data != null) {
        var data1 = getDataFromField(
            resultWrapper!.info.fieldName,
            QueryResult(
                data: data,
                source: QueryResultSource.cache,
                options: resultWrapper!.observableQuery!.options));
        return data1 ?? {};
      }
    }
    return {};
  }

  @override
  Future<void> close() async {
    await closeResultWrapper();
    return super.close();
  }
}
