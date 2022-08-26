import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/order_update_with_where_unique_without_business_input.dart';
import 'package:models/user_response.dart';
import 'update_my_business_order_ast.dart' show document;

part "update_my_business_order_extensions.dart";
part "update_my_business_order_events.dart";
part "update_my_business_order_states.dart";

enum UpdateMyBusinessOrderBlocHookStage { before, after }

class UpdateMyBusinessOrderBloc
    extends Bloc<UpdateMyBusinessOrderEvent, UpdateMyBusinessOrderState> {
  final GraphQLClient client;
  final Stream<UpdateMyBusinessOrderState> Function(
      UpdateMyBusinessOrderBloc context,
      UpdateMyBusinessOrderEvent event,
      UpdateMyBusinessOrderBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateMyBusinessOrderBloc({required this.client, this.hook})
      : super(UpdateMyBusinessOrderInitial()) {
    on<UpdateMyBusinessOrderEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateMyBusinessOrderState?> mapEventToState(
      UpdateMyBusinessOrderEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateMyBusinessOrderBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateMyBusinessOrderStarted) {
      return UpdateMyBusinessOrderInitial();
    } else if (event is UpdateMyBusinessOrderExcuted) {
      //start main excution
      return await updateMyBusinessOrder(event);
    } else if (event is UpdateMyBusinessOrderIsLoading) {
      // emit loading state
      {
        return UpdateMyBusinessOrderInProgress(data: event.data);
      }
    } else if (event is UpdateMyBusinessOrderIsOptimistic) {
      // emit optimistic result state
      return UpdateMyBusinessOrderOptimistic(data: event.data);
    } else if (event is UpdateMyBusinessOrderIsConcrete) {
      // emit completed result
      return UpdateMyBusinessOrderSuccess(data: event.data);
    } else if (event is UpdateMyBusinessOrderRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateMyBusinessOrderFailed) {
      // emit failure state
      return UpdateMyBusinessOrderFailure(
          data: event.data, message: event.message);
    } else if (event is UpdateMyBusinessOrderErrored) {
      //emit error case
      return UpdateMyBusinessOrderError(
          data: event.data, message: event.message);
    } else if (event is UpdateMyBusinessOrderRetried) {
      updateMyBusinessOrderRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateMyBusinessOrderBlocHookStage.after);
    // }
    return null;
  }

  void updateMyBusinessOrderRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateMyBusinessOrderRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateMyBusinessOrderState?> updateMyBusinessOrder(
      UpdateMyBusinessOrderExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.updateMyBusinessOrder(
            uid: event.uid, count: event.count, orders: event.orders);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateMyBusinessOrderReseted());
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
              add(UpdateMyBusinessOrderErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateMyBusinessOrderFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateMyBusinessOrderIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateMyBusinessOrderIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateMyBusinessOrderIsConcrete(data: data));
            } else {
              add(UpdateMyBusinessOrderErrored(
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
        return UpdateMyBusinessOrderError(
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
    return (state is UpdateMyBusinessOrderInitial) ||
            (state is UpdateMyBusinessOrderError)
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
