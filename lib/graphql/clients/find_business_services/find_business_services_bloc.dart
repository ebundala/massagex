import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'find_business_services_ast.dart' show document;

part "find_business_services_extensions.dart";
part "find_business_services_events.dart";
part "find_business_services_states.dart";

enum FindBusinessServicesBlocHookStage { before, after }

class FindBusinessServicesBloc
    extends Bloc<FindBusinessServicesEvent, FindBusinessServicesState> {
  final GraphQLClient client;
  final Stream<FindBusinessServicesState> Function(
      FindBusinessServicesBloc context,
      FindBusinessServicesEvent event,
      FindBusinessServicesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindBusinessServicesBloc({required this.client, this.hook})
      : super(FindBusinessServicesInitial()) {
    on<FindBusinessServicesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindBusinessServicesState?> mapEventToState(
      FindBusinessServicesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindBusinessServicesBlocHookStage.before);
    //   }
    //  else
    if (event is FindBusinessServicesStarted) {
      return FindBusinessServicesInitial();
    } else if (event is FindBusinessServicesExcuted) {
      //start main excution
      return await findBusinessServices(event);
    } else if (event is FindBusinessServicesIsLoading) {
      // emit loading state
      {
        return FindBusinessServicesInProgress(data: event.data);
      }
    } else if (event is FindBusinessServicesIsOptimistic) {
      // emit optimistic result state
      return FindBusinessServicesOptimistic(data: event.data);
    } else if (event is FindBusinessServicesIsConcrete) {
      // emit completed result
      return FindBusinessServicesSuccess(data: event.data);
    } else if (event is FindBusinessServicesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindBusinessServicesFailed) {
      // emit failure state
      return FindBusinessServicesFailure(
          data: event.data, message: event.message);
    } else if (event is FindBusinessServicesErrored) {
      //emit error case
      return FindBusinessServicesError(
          data: event.data, message: event.message);
    } else if (event is FindBusinessServicesRetried) {
      findBusinessServicesRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindBusinessServicesBlocHookStage.after);
    // }
    return null;
  }

  void findBusinessServicesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findBusinessServicesRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindBusinessServicesState?> findBusinessServices(
      FindBusinessServicesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findBusinessServices();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindBusinessServicesReseted());
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
              add(FindBusinessServicesErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindBusinessServicesFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindBusinessServicesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindBusinessServicesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindBusinessServicesIsConcrete(data: data));
            } else {
              add(FindBusinessServicesErrored(
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
        return FindBusinessServicesError(
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
    return (state is FindBusinessServicesInitial) ||
            (state is FindBusinessServicesError)
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
