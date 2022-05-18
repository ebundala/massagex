import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'update_order_ast.dart' show document;

part "update_order_extensions.dart";
part "update_order_events.dart";
part "update_order_states.dart";

enum UpdateOrderBlocHookStage { before, after }

class UpdateOrderBloc extends Bloc<UpdateOrderEvent, UpdateOrderState> {
  final GraphQLClient client;
  final Stream<UpdateOrderState> Function(UpdateOrderBloc context,
      UpdateOrderEvent event, UpdateOrderBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateOrderBloc({required this.client, this.hook})
      : super(UpdateOrderInitial()) {
    on<UpdateOrderEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateOrderState?> mapEventToState(UpdateOrderEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateOrderBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateOrderStarted) {
      return UpdateOrderInitial();
    } else if (event is UpdateOrderExcuted) {
      //start main excution
      return await updateOrder(event);
    } else if (event is UpdateOrderIsLoading) {
      // emit loading state
      {
        return UpdateOrderInProgress(data: event.data);
      }
    } else if (event is UpdateOrderIsOptimistic) {
      // emit optimistic result state
      return UpdateOrderOptimistic(data: event.data);
    } else if (event is UpdateOrderIsConcrete) {
      // emit completed result
      return UpdateOrderSuccess(data: event.data);
    } else if (event is UpdateOrderRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateOrderFailed) {
      // emit failure state
      return UpdateOrderFailure(data: event.data, message: event.message);
    } else if (event is UpdateOrderErrored) {
      //emit error case
      return UpdateOrderError(data: event.data, message: event.message);
    } else if (event is UpdateOrderRetried) {
      updateOrderRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateOrderBlocHookStage.after);
    // }
    return null;
  }

  void updateOrderRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateOrderRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateOrderState?> updateOrder(UpdateOrderExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.updateOrder();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateOrderReseted());
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
              add(UpdateOrderErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateOrderFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateOrderIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateOrderIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateOrderIsConcrete(data: data));
            } else {
              add(UpdateOrderErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return UpdateOrderError(data: state.data!, message: e.toString());
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
    return (state is UpdateOrderInitial) || (state is UpdateOrderError)
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
