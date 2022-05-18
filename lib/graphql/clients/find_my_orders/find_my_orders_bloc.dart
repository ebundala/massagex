import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'find_my_orders_ast.dart' show document;

part "find_my_orders_extensions.dart";
part "find_my_orders_events.dart";
part "find_my_orders_states.dart";

enum FindMyOrdersBlocHookStage { before, after }

class FindMyOrdersBloc extends Bloc<FindMyOrdersEvent, FindMyOrdersState> {
  final GraphQLClient client;
  final Stream<FindMyOrdersState> Function(FindMyOrdersBloc context,
      FindMyOrdersEvent event, FindMyOrdersBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindMyOrdersBloc({required this.client, this.hook})
      : super(FindMyOrdersInitial()) {
    on<FindMyOrdersEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindMyOrdersState?> mapEventToState(FindMyOrdersEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindMyOrdersBlocHookStage.before);
    //   }
    //  else
    if (event is FindMyOrdersStarted) {
      return FindMyOrdersInitial();
    } else if (event is FindMyOrdersExcuted) {
      //start main excution
      return await findMyOrders(event);
    } else if (event is FindMyOrdersIsLoading) {
      // emit loading state
      {
        return FindMyOrdersInProgress(data: event.data);
      }
    } else if (event is FindMyOrdersIsOptimistic) {
      // emit optimistic result state
      return FindMyOrdersOptimistic(data: event.data);
    } else if (event is FindMyOrdersIsConcrete) {
      // emit completed result
      return FindMyOrdersSuccess(data: event.data);
    } else if (event is FindMyOrdersRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindMyOrdersFailed) {
      // emit failure state
      return FindMyOrdersFailure(data: event.data, message: event.message);
    } else if (event is FindMyOrdersErrored) {
      //emit error case
      return FindMyOrdersError(data: event.data, message: event.message);
    } else if (event is FindMyOrdersRetried) {
      findMyOrdersRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindMyOrdersBlocHookStage.after);
    // }
    return null;
  }

  void findMyOrdersRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findMyOrdersRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindMyOrdersState?> findMyOrders(FindMyOrdersExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findMyOrders();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindMyOrdersReseted());
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
              add(FindMyOrdersErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindMyOrdersFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindMyOrdersIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindMyOrdersIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindMyOrdersIsConcrete(data: data));
            } else {
              add(FindMyOrdersErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindMyOrdersError(data: state.data!, message: e.toString());
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
    return (state is FindMyOrdersInitial) || (state is FindMyOrdersError)
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
