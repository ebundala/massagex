import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/location_response.dart';
import 'location_feed_ast.dart' show document;

part "location_feed_extensions.dart";
part "location_feed_events.dart";
part "location_feed_states.dart";

enum LocationFeedBlocHookStage { before, after }

class LocationFeedBloc extends Bloc<LocationFeedEvent, LocationFeedState> {
  final GraphQLClient client;
  final Stream<LocationFeedState> Function(LocationFeedBloc context,
      LocationFeedEvent event, LocationFeedBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  LocationFeedBloc({required this.client, this.hook})
      : super(LocationFeedInitial()) {
    on<LocationFeedEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<LocationFeedState?> mapEventToState(LocationFeedEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, LocationFeedBlocHookStage.before);
    //   }
    //  else
    if (event is LocationFeedStarted) {
      return LocationFeedInitial();
    } else if (event is LocationFeedExcuted) {
      //start main excution
      return await locationFeed(event);
    } else if (event is LocationFeedIsLoading) {
      // emit loading state
      {
        return LocationFeedInProgress(data: event.data);
      }
    } else if (event is LocationFeedIsOptimistic) {
      // emit optimistic result state
      return LocationFeedOptimistic(data: event.data);
    } else if (event is LocationFeedIsConcrete) {
      // emit completed result
      return LocationFeedSuccess(data: event.data);
    } else if (event is LocationFeedRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is LocationFeedFailed) {
      // emit failure state
      return LocationFeedFailure(data: event.data, message: event.message);
    } else if (event is LocationFeedErrored) {
      //emit error case
      return LocationFeedError(data: event.data, message: event.message);
    } else if (event is LocationFeedRetried) {
      locationFeedRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, LocationFeedBlocHookStage.after);
    // }
    return null;
  }

  void locationFeedRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.locationFeedRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<LocationFeedState?> locationFeed(LocationFeedExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.locationFeed(orderId: event.orderId);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(LocationFeedReseted());
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
          var data = LocationResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = LocationResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = LocationResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(LocationFeedErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(LocationFeedFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(LocationFeedIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(LocationFeedIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(LocationFeedIsConcrete(data: data));
            } else {
              add(LocationFeedErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return LocationFeedError(data: state.data!, message: e.toString());
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

  LocationResponse get getData {
    return (state is LocationFeedInitial) || (state is LocationFeedError)
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
