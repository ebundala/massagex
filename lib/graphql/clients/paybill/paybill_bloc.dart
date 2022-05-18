import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/paybill_request.dart';
import 'package:models/paybill_response.dart';
import 'paybill_ast.dart' show document;

part "paybill_extensions.dart";
part "paybill_events.dart";
part "paybill_states.dart";

enum PaybillBlocHookStage { before, after }

class PaybillBloc extends Bloc<PaybillEvent, PaybillState> {
  final GraphQLClient client;
  final Stream<PaybillState> Function(
          PaybillBloc context, PaybillEvent event, PaybillBlocHookStage stage)?
      hook;
  OperationResult? resultWrapper;
  PaybillBloc({required this.client, this.hook}) : super(PaybillInitial()) {
    on<PaybillEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<PaybillState?> mapEventToState(PaybillEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, PaybillBlocHookStage.before);
    //   }
    //  else
    if (event is PaybillStarted) {
      return PaybillInitial();
    } else if (event is PaybillExcuted) {
      //start main excution
      return await paybill(event);
    } else if (event is PaybillIsLoading) {
      // emit loading state
      {
        return PaybillInProgress(data: event.data);
      }
    } else if (event is PaybillIsOptimistic) {
      // emit optimistic result state
      return PaybillOptimistic(data: event.data);
    } else if (event is PaybillIsConcrete) {
      // emit completed result
      return PaybillSuccess(data: event.data);
    } else if (event is PaybillRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is PaybillFailed) {
      // emit failure state
      return PaybillFailure(data: event.data, message: event.message);
    } else if (event is PaybillErrored) {
      //emit error case
      return PaybillError(data: event.data, message: event.message);
    } else if (event is PaybillRetried) {
      paybillRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, PaybillBlocHookStage.after);
    // }
    return null;
  }

  void paybillRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.paybillRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<PaybillState?> paybill(PaybillExcuted event) async {
    //validate all required fields of required args and emit relevant events
    if (event.data.orderId.isEmpty == true) {
      return PaybillDataOrderIdValidationError('orderId is required', getData,
          $data: event.data);
    } else {
      try {
        await closeResultWrapper();
        resultWrapper = await client.paybill(data: event.data);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(PaybillReseted());
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
          var data = PaybillResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = PaybillResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = PaybillResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(PaybillErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(PaybillFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(PaybillIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(PaybillIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(PaybillIsConcrete(data: data));
            } else {
              add(PaybillErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return PaybillError(data: state.data!, message: e.toString());
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

  PaybillResponse get getData {
    return (state is PaybillInitial) || (state is PaybillError)
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
