import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/payment_method_list_response.dart';
import 'find_payment_methods_ast.dart' show document;

part "find_payment_methods_extensions.dart";
part "find_payment_methods_events.dart";
part "find_payment_methods_states.dart";

enum FindPaymentMethodsBlocHookStage { before, after }

class FindPaymentMethodsBloc
    extends Bloc<FindPaymentMethodsEvent, FindPaymentMethodsState> {
  final GraphQLClient client;
  final Stream<FindPaymentMethodsState> Function(
      FindPaymentMethodsBloc context,
      FindPaymentMethodsEvent event,
      FindPaymentMethodsBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindPaymentMethodsBloc({required this.client, this.hook})
      : super(FindPaymentMethodsInitial()) {
    on<FindPaymentMethodsEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindPaymentMethodsState?> mapEventToState(
      FindPaymentMethodsEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindPaymentMethodsBlocHookStage.before);
    //   }
    //  else
    if (event is FindPaymentMethodsStarted) {
      return FindPaymentMethodsInitial();
    } else if (event is FindPaymentMethodsExcuted) {
      //start main excution
      return await findPaymentMethods(event);
    } else if (event is FindPaymentMethodsIsLoading) {
      // emit loading state
      if (!(state is FindPaymentMethodsLoadMoreInProgress)) {
        return FindPaymentMethodsInProgress(data: event.data);
      }
    } else if (event is FindPaymentMethodsIsOptimistic) {
      // emit optimistic result state
      return FindPaymentMethodsOptimistic(data: event.data);
    } else if (event is FindPaymentMethodsIsConcrete) {
      // emit completed result
      return FindPaymentMethodsSuccess(data: event.data);
    } else if (event is FindPaymentMethodsRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindPaymentMethodsFailed) {
      // emit failure state
      return FindPaymentMethodsFailure(
          data: event.data, message: event.message);
    } else if (event is FindPaymentMethodsErrored) {
      //emit error case
      return FindPaymentMethodsError(data: event.data, message: event.message);
    } else if (event is FindPaymentMethodsRetried) {
      findPaymentMethodsRetry();
    } else if (event is FindPaymentMethodsMoreLoaded) {
      return FindPaymentMethodsLoadMoreInProgress(data: getData);
      findPaymentMethodsLoadMore(event);
    } else if (event is FindPaymentMethodsStreamEnded) {
      return FindPaymentMethodsAllDataLoaded(data: getData);
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindPaymentMethodsBlocHookStage.after);
    // }
    return null;
  }

  void findPaymentMethodsRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findPaymentMethodsRetry(resultWrapper!.observableQuery!);
    }
  }

  void findPaymentMethodsLoadMore(FindPaymentMethodsMoreLoaded event) {
    if (resultWrapper?.observableQuery != null) {
      client.findPaymentMethodsLoadMore(
        resultWrapper!.observableQuery!,
      );
    }
  }

  Future<FindPaymentMethodsState?> findPaymentMethods(
      FindPaymentMethodsExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findPaymentMethods();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindPaymentMethodsReseted());
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
          var data = PaymentMethodListResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = PaymentMethodListResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = PaymentMethodListResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindPaymentMethodsErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindPaymentMethodsFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindPaymentMethodsIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindPaymentMethodsIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindPaymentMethodsIsConcrete(data: data));
            } else {
              add(FindPaymentMethodsErrored(
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
        return FindPaymentMethodsError(
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

  PaymentMethodListResponse get getData {
    return (state is FindPaymentMethodsInitial) ||
            (state is FindPaymentMethodsError)
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
