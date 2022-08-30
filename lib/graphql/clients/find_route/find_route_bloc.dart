import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/lat_lng_input.dart';
import 'package:models/route_response.dart';
import 'find_route_ast.dart' show document;

part "find_route_extensions.dart";
part "find_route_events.dart";
part "find_route_states.dart";

enum FindRouteBlocHookStage { before, after }

class FindRouteBloc extends Bloc<FindRouteEvent, FindRouteState> {
  final GraphQLClient client;
  final Stream<FindRouteState> Function(FindRouteBloc context,
      FindRouteEvent event, FindRouteBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindRouteBloc({required this.client, this.hook}) : super(FindRouteInitial()) {
    on<FindRouteEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindRouteState?> mapEventToState(FindRouteEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindRouteBlocHookStage.before);
    //   }
    //  else
    if (event is FindRouteStarted) {
      return FindRouteInitial();
    } else if (event is FindRouteExcuted) {
      //start main excution
      return await findRoute(event);
    } else if (event is FindRouteIsLoading) {
      // emit loading state
      {
        return FindRouteInProgress(data: event.data);
      }
    } else if (event is FindRouteIsOptimistic) {
      // emit optimistic result state
      return FindRouteOptimistic(data: event.data);
    } else if (event is FindRouteIsConcrete) {
      // emit completed result
      return FindRouteSuccess(data: event.data);
    } else if (event is FindRouteRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindRouteFailed) {
      // emit failure state
      return FindRouteFailure(data: event.data, message: event.message);
    } else if (event is FindRouteErrored) {
      //emit error case
      return FindRouteError(data: event.data, message: event.message);
    } else if (event is FindRouteRetried) {
      findRouteRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindRouteBlocHookStage.after);
    // }
    return null;
  }

  void findRouteRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findRouteRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindRouteState?> findRoute(FindRouteExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findRoute(
            origin: event.origin, destination: event.destination);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindRouteReseted());
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
          var data = RouteResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = RouteResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = RouteResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindRouteErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindRouteFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindRouteIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindRouteIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindRouteIsConcrete(data: data));
            } else {
              add(FindRouteErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindRouteError(data: state.data!, message: e.toString());
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

  RouteResponse get getData {
    return (state is FindRouteInitial) || (state is FindRouteError)
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
