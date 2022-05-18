import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'find_business_orders_ast.dart' show document;

part "find_business_orders_extensions.dart";
part "find_business_orders_events.dart";
part "find_business_orders_states.dart";

enum FindBusinessOrdersBlocHookStage { before, after }

class FindBusinessOrdersBloc
    extends Bloc<FindBusinessOrdersEvent, FindBusinessOrdersState> {
  final GraphQLClient client;
  final Stream<FindBusinessOrdersState> Function(
      FindBusinessOrdersBloc context,
      FindBusinessOrdersEvent event,
      FindBusinessOrdersBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindBusinessOrdersBloc({required this.client, this.hook})
      : super(FindBusinessOrdersInitial()) {
    on<FindBusinessOrdersEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindBusinessOrdersState?> mapEventToState(
      FindBusinessOrdersEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindBusinessOrdersBlocHookStage.before);
    //   }
    //  else
    if (event is FindBusinessOrdersStarted) {
      return FindBusinessOrdersInitial();
    } else if (event is FindBusinessOrdersExcuted) {
      //start main excution
      return await findBusinessOrders(event);
    } else if (event is FindBusinessOrdersIsLoading) {
      // emit loading state
      {
        return FindBusinessOrdersInProgress(data: event.data);
      }
    } else if (event is FindBusinessOrdersIsOptimistic) {
      // emit optimistic result state
      return FindBusinessOrdersOptimistic(data: event.data);
    } else if (event is FindBusinessOrdersIsConcrete) {
      // emit completed result
      return FindBusinessOrdersSuccess(data: event.data);
    } else if (event is FindBusinessOrdersRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindBusinessOrdersFailed) {
      // emit failure state
      return FindBusinessOrdersFailure(
          data: event.data, message: event.message);
    } else if (event is FindBusinessOrdersErrored) {
      //emit error case
      return FindBusinessOrdersError(data: event.data, message: event.message);
    } else if (event is FindBusinessOrdersRetried) {
      findBusinessOrdersRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindBusinessOrdersBlocHookStage.after);
    // }
    return null;
  }

  void findBusinessOrdersRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findBusinessOrdersRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindBusinessOrdersState?> findBusinessOrders(
      FindBusinessOrdersExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findBusinessOrders();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindBusinessOrdersReseted());
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
              add(FindBusinessOrdersErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindBusinessOrdersFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindBusinessOrdersIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindBusinessOrdersIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindBusinessOrdersIsConcrete(data: data));
            } else {
              add(FindBusinessOrdersErrored(
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
        return FindBusinessOrdersError(
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
    return (state is FindBusinessOrdersInitial) ||
            (state is FindBusinessOrdersError)
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
