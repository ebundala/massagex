import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/reverse_geocode_response.dart';
import 'reverse_geocode_ast.dart' show document;

part "reverse_geocode_extensions.dart";
part "reverse_geocode_events.dart";
part "reverse_geocode_states.dart";

enum ReverseGeocodeBlocHookStage { before, after }

class ReverseGeocodeBloc
    extends Bloc<ReverseGeocodeEvent, ReverseGeocodeState> {
  final GraphQLClient client;
  final Stream<ReverseGeocodeState> Function(ReverseGeocodeBloc context,
      ReverseGeocodeEvent event, ReverseGeocodeBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  ReverseGeocodeBloc({required this.client, this.hook})
      : super(ReverseGeocodeInitial()) {
    on<ReverseGeocodeEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<ReverseGeocodeState?> mapEventToState(
      ReverseGeocodeEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, ReverseGeocodeBlocHookStage.before);
    //   }
    //  else
    if (event is ReverseGeocodeStarted) {
      return ReverseGeocodeInitial();
    } else if (event is ReverseGeocodeExcuted) {
      //start main excution
      return await reverseGeocode(event);
    } else if (event is ReverseGeocodeIsLoading) {
      // emit loading state
      {
        return ReverseGeocodeInProgress(data: event.data);
      }
    } else if (event is ReverseGeocodeIsOptimistic) {
      // emit optimistic result state
      return ReverseGeocodeOptimistic(data: event.data);
    } else if (event is ReverseGeocodeIsConcrete) {
      // emit completed result
      return ReverseGeocodeSuccess(data: event.data);
    } else if (event is ReverseGeocodeRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is ReverseGeocodeFailed) {
      // emit failure state
      return ReverseGeocodeFailure(data: event.data, message: event.message);
    } else if (event is ReverseGeocodeErrored) {
      //emit error case
      return ReverseGeocodeError(data: event.data, message: event.message);
    } else if (event is ReverseGeocodeRetried) {
      reverseGeocodeRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, ReverseGeocodeBlocHookStage.after);
    // }
    return null;
  }

  void reverseGeocodeRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.reverseGeocodeRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<ReverseGeocodeState?> reverseGeocode(
      ReverseGeocodeExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.reverseGeocode(
            latitude: event.latitude, longitude: event.longitude);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(ReverseGeocodeReseted());
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
          var data = ReverseGeocodeResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = ReverseGeocodeResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = ReverseGeocodeResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(ReverseGeocodeErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(ReverseGeocodeFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(ReverseGeocodeIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(ReverseGeocodeIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(ReverseGeocodeIsConcrete(data: data));
            } else {
              add(ReverseGeocodeErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return ReverseGeocodeError(data: state.data!, message: e.toString());
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

  ReverseGeocodeResponse get getData {
    return (state is ReverseGeocodeInitial) || (state is ReverseGeocodeError)
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
