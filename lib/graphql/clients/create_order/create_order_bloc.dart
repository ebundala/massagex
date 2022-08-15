import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/order_create_without_owner_input.dart';
import 'package:models/user_response.dart';
import 'create_order_ast.dart' show document;

part "create_order_extensions.dart";
part "create_order_events.dart";
part "create_order_states.dart";

enum CreateOrderBlocHookStage { before, after }

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final GraphQLClient client;
  final Stream<CreateOrderState> Function(CreateOrderBloc context,
      CreateOrderEvent event, CreateOrderBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  CreateOrderBloc({required this.client, this.hook})
      : super(CreateOrderInitial()) {
    on<CreateOrderEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<CreateOrderState?> mapEventToState(CreateOrderEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, CreateOrderBlocHookStage.before);
    //   }
    //  else
    if (event is CreateOrderStarted) {
      return CreateOrderInitial();
    } else if (event is CreateOrderExcuted) {
      //start main excution
      return await createOrder(event);
    } else if (event is CreateOrderIsLoading) {
      // emit loading state
      {
        return CreateOrderInProgress(data: event.data);
      }
    } else if (event is CreateOrderIsOptimistic) {
      // emit optimistic result state
      return CreateOrderOptimistic(data: event.data);
    } else if (event is CreateOrderIsConcrete) {
      // emit completed result
      return CreateOrderSuccess(data: event.data);
    } else if (event is CreateOrderRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is CreateOrderFailed) {
      // emit failure state
      return CreateOrderFailure(data: event.data, message: event.message);
    } else if (event is CreateOrderErrored) {
      //emit error case
      return CreateOrderError(data: event.data, message: event.message);
    } else if (event is CreateOrderRetried) {
      createOrderRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, CreateOrderBlocHookStage.after);
    // }
    return null;
  }

  void createOrderRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.createOrderRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<CreateOrderState?> createOrder(CreateOrderExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.createOrder(
            uid: event.uid, count: event.count, orders: event.orders);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(CreateOrderReseted());
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
              add(CreateOrderErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(CreateOrderFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(CreateOrderIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(CreateOrderIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(CreateOrderIsConcrete(data: data));
            } else {
              add(CreateOrderErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return CreateOrderError(data: state.data!, message: e.toString());
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
    return (state is CreateOrderInitial) || (state is CreateOrderError)
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
