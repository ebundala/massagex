import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/string_field_update_operations_input.dart';
import 'package:models/attachment_update_one_without_services_input.dart';
import 'package:models/user_response.dart';
import 'update_service_ast.dart' show document;

part "update_service_extensions.dart";
part "update_service_events.dart";
part "update_service_states.dart";

enum UpdateServiceBlocHookStage { before, after }

class UpdateServiceBloc extends Bloc<UpdateServiceEvent, UpdateServiceState> {
  final GraphQLClient client;
  final Stream<UpdateServiceState> Function(UpdateServiceBloc context,
      UpdateServiceEvent event, UpdateServiceBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateServiceBloc({required this.client, this.hook})
      : super(UpdateServiceInitial()) {
    on<UpdateServiceEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateServiceState?> mapEventToState(UpdateServiceEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateServiceBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateServiceStarted) {
      return UpdateServiceInitial();
    } else if (event is UpdateServiceExcuted) {
      //start main excution
      return await updateService(event);
    } else if (event is UpdateServiceIsLoading) {
      // emit loading state
      {
        return UpdateServiceInProgress(data: event.data);
      }
    } else if (event is UpdateServiceIsOptimistic) {
      // emit optimistic result state
      return UpdateServiceOptimistic(data: event.data);
    } else if (event is UpdateServiceIsConcrete) {
      // emit completed result
      return UpdateServiceSuccess(data: event.data);
    } else if (event is UpdateServiceRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateServiceFailed) {
      // emit failure state
      return UpdateServiceFailure(data: event.data, message: event.message);
    } else if (event is UpdateServiceErrored) {
      //emit error case
      return UpdateServiceError(data: event.data, message: event.message);
    } else if (event is UpdateServiceRetried) {
      updateServiceRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateServiceBlocHookStage.after);
    // }
    return null;
  }

  void updateServiceRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateServiceRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateServiceState?> updateService(UpdateServiceExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.updateService(
            uid: event.uid,
            name: event.name,
            serviceId: event.serviceId,
            metadata: event.metadata,
            price: event.price,
            currency: event.currency,
            description: event.description,
            image: event.image);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateServiceReseted());
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
              add(UpdateServiceErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateServiceFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateServiceIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateServiceIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateServiceIsConcrete(data: data));
            } else {
              add(UpdateServiceErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return UpdateServiceError(data: state.data!, message: e.toString());
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
    return (state is UpdateServiceInitial) || (state is UpdateServiceError)
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
