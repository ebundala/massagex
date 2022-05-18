import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/register_device_input.dart';
import 'package:models/device_response.dart';
import 'register_device_ast.dart' show document;

part "register_device_extensions.dart";
part "register_device_events.dart";
part "register_device_states.dart";

enum RegisterDeviceBlocHookStage { before, after }

class RegisterDeviceBloc
    extends Bloc<RegisterDeviceEvent, RegisterDeviceState> {
  final GraphQLClient client;
  final Stream<RegisterDeviceState> Function(RegisterDeviceBloc context,
      RegisterDeviceEvent event, RegisterDeviceBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  RegisterDeviceBloc({required this.client, this.hook})
      : super(RegisterDeviceInitial()) {
    on<RegisterDeviceEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<RegisterDeviceState?> mapEventToState(
      RegisterDeviceEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, RegisterDeviceBlocHookStage.before);
    //   }
    //  else
    if (event is RegisterDeviceStarted) {
      return RegisterDeviceInitial();
    } else if (event is RegisterDeviceExcuted) {
      //start main excution
      return await registerDevice(event);
    } else if (event is RegisterDeviceIsLoading) {
      // emit loading state
      {
        return RegisterDeviceInProgress(data: event.data);
      }
    } else if (event is RegisterDeviceIsOptimistic) {
      // emit optimistic result state
      return RegisterDeviceOptimistic(data: event.data);
    } else if (event is RegisterDeviceIsConcrete) {
      // emit completed result
      return RegisterDeviceSuccess(data: event.data);
    } else if (event is RegisterDeviceRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is RegisterDeviceFailed) {
      // emit failure state
      return RegisterDeviceFailure(data: event.data, message: event.message);
    } else if (event is RegisterDeviceErrored) {
      //emit error case
      return RegisterDeviceError(data: event.data, message: event.message);
    } else if (event is RegisterDeviceRetried) {
      registerDeviceRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, RegisterDeviceBlocHookStage.after);
    // }
    return null;
  }

  void registerDeviceRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.registerDeviceRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<RegisterDeviceState?> registerDevice(
      RegisterDeviceExcuted event) async {
    //validate all required fields of required args and emit relevant events
    if (event.device.id.isEmpty == true) {
      return RegisterDeviceDeviceIdValidationError('id is required', getData,
          $device: event.device);
    } else {
      try {
        await closeResultWrapper();
        resultWrapper = await client.registerDevice(device: event.device);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(RegisterDeviceReseted());
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
          var data = DeviceResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = DeviceResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = DeviceResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(RegisterDeviceErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(RegisterDeviceFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(RegisterDeviceIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(RegisterDeviceIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(RegisterDeviceIsConcrete(data: data));
            } else {
              add(RegisterDeviceErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return RegisterDeviceError(data: state.data!, message: e.toString());
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

  DeviceResponse get getData {
    return (state is RegisterDeviceInitial) || (state is RegisterDeviceError)
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
