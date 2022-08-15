import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/order_where_input.dart';
import 'package:models/user_response.dart';
import 'find_my_business_orders_ast.dart' show document;

part "find_my_business_orders_extensions.dart";
part "find_my_business_orders_events.dart";
part "find_my_business_orders_states.dart";

enum FindMyBusinessOrdersBlocHookStage { before, after }

class FindMyBusinessOrdersBloc
    extends Bloc<FindMyBusinessOrdersEvent, FindMyBusinessOrdersState> {
  final GraphQLClient client;
  final Stream<FindMyBusinessOrdersState> Function(
      FindMyBusinessOrdersBloc context,
      FindMyBusinessOrdersEvent event,
      FindMyBusinessOrdersBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindMyBusinessOrdersBloc({required this.client, this.hook})
      : super(FindMyBusinessOrdersInitial()) {
    on<FindMyBusinessOrdersEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindMyBusinessOrdersState?> mapEventToState(
      FindMyBusinessOrdersEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindMyBusinessOrdersBlocHookStage.before);
    //   }
    //  else
    if (event is FindMyBusinessOrdersStarted) {
      return FindMyBusinessOrdersInitial();
    } else if (event is FindMyBusinessOrdersExcuted) {
      //start main excution
      return await findMyBusinessOrders(event);
    } else if (event is FindMyBusinessOrdersIsLoading) {
      // emit loading state
      {
        return FindMyBusinessOrdersInProgress(data: event.data);
      }
    } else if (event is FindMyBusinessOrdersIsOptimistic) {
      // emit optimistic result state
      return FindMyBusinessOrdersOptimistic(data: event.data);
    } else if (event is FindMyBusinessOrdersIsConcrete) {
      // emit completed result
      return FindMyBusinessOrdersSuccess(data: event.data);
    } else if (event is FindMyBusinessOrdersRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindMyBusinessOrdersFailed) {
      // emit failure state
      return FindMyBusinessOrdersFailure(
          data: event.data, message: event.message);
    } else if (event is FindMyBusinessOrdersErrored) {
      //emit error case
      return FindMyBusinessOrdersError(
          data: event.data, message: event.message);
    } else if (event is FindMyBusinessOrdersRetried) {
      findMyBusinessOrdersRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindMyBusinessOrdersBlocHookStage.after);
    // }
    return null;
  }

  void findMyBusinessOrdersRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findMyBusinessOrdersRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindMyBusinessOrdersState?> findMyBusinessOrders(
      FindMyBusinessOrdersExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findMyBusinessOrders(
            uid: event.uid,
            where: event.where,
            take: event.take,
            skip: event.skip);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindMyBusinessOrdersReseted());
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
              add(FindMyBusinessOrdersErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindMyBusinessOrdersFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindMyBusinessOrdersIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindMyBusinessOrdersIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindMyBusinessOrdersIsConcrete(data: data));
            } else {
              add(FindMyBusinessOrdersErrored(
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
        return FindMyBusinessOrdersError(
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
    return (state is FindMyBusinessOrdersInitial) ||
            (state is FindMyBusinessOrdersError)
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
