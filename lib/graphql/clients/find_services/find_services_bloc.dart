import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/service_where_input.dart';
import 'package:models/business_response.dart';
import 'find_services_ast.dart' show document;

part "find_services_extensions.dart";
part "find_services_events.dart";
part "find_services_states.dart";

enum FindServicesBlocHookStage { before, after }

class FindServicesBloc extends Bloc<FindServicesEvent, FindServicesState> {
  final GraphQLClient client;
  final Stream<FindServicesState> Function(FindServicesBloc context,
      FindServicesEvent event, FindServicesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindServicesBloc({required this.client, this.hook})
      : super(FindServicesInitial()) {
    on<FindServicesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindServicesState?> mapEventToState(FindServicesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindServicesBlocHookStage.before);
    //   }
    //  else
    if (event is FindServicesStarted) {
      return FindServicesInitial();
    } else if (event is FindServicesExcuted) {
      //start main excution
      return await findServices(event);
    } else if (event is FindServicesIsLoading) {
      // emit loading state
      {
        return FindServicesInProgress(data: event.data);
      }
    } else if (event is FindServicesIsOptimistic) {
      // emit optimistic result state
      return FindServicesOptimistic(data: event.data);
    } else if (event is FindServicesIsConcrete) {
      // emit completed result
      return FindServicesSuccess(data: event.data);
    } else if (event is FindServicesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindServicesFailed) {
      // emit failure state
      return FindServicesFailure(data: event.data, message: event.message);
    } else if (event is FindServicesErrored) {
      //emit error case
      return FindServicesError(data: event.data, message: event.message);
    } else if (event is FindServicesRetried) {
      findServicesRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindServicesBlocHookStage.after);
    // }
    return null;
  }

  void findServicesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findServicesRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindServicesState?> findServices(FindServicesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findServices(
            businessId: event.businessId,
            where: event.where,
            take: event.take,
            skip: event.skip);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindServicesReseted());
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
          var data = BusinessResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = BusinessResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = BusinessResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindServicesErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindServicesFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindServicesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindServicesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindServicesIsConcrete(data: data));
            } else {
              add(FindServicesErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindServicesError(data: state.data!, message: e.toString());
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

  BusinessResponse get getData {
    return (state is FindServicesInitial) || (state is FindServicesError)
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
