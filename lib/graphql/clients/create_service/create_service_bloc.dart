import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/attachment_create_nested_one_without_services_input.dart';
import 'package:models/user_response.dart';
import 'create_service_ast.dart' show document;

part "create_service_extensions.dart";
part "create_service_events.dart";
part "create_service_states.dart";

enum CreateServiceBlocHookStage { before, after }

class CreateServiceBloc extends Bloc<CreateServiceEvent, CreateServiceState> {
  final GraphQLClient client;
  final Stream<CreateServiceState> Function(CreateServiceBloc context,
      CreateServiceEvent event, CreateServiceBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  CreateServiceBloc({required this.client, this.hook})
      : super(CreateServiceInitial()) {
    on<CreateServiceEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<CreateServiceState?> mapEventToState(CreateServiceEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, CreateServiceBlocHookStage.before);
    //   }
    //  else
    if (event is CreateServiceStarted) {
      return CreateServiceInitial();
    } else if (event is CreateServiceExcuted) {
      //start main excution
      return await createService(event);
    } else if (event is CreateServiceIsLoading) {
      // emit loading state
      {
        return CreateServiceInProgress(data: event.data);
      }
    } else if (event is CreateServiceIsOptimistic) {
      // emit optimistic result state
      return CreateServiceOptimistic(data: event.data);
    } else if (event is CreateServiceIsConcrete) {
      // emit completed result
      return CreateServiceSuccess(data: event.data);
    } else if (event is CreateServiceRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is CreateServiceFailed) {
      // emit failure state
      return CreateServiceFailure(data: event.data, message: event.message);
    } else if (event is CreateServiceErrored) {
      //emit error case
      return CreateServiceError(data: event.data, message: event.message);
    } else if (event is CreateServiceRetried) {
      createServiceRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, CreateServiceBlocHookStage.after);
    // }
    return null;
  }

  void createServiceRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.createServiceRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<CreateServiceState?> createService(CreateServiceExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.createService(
            uid: event.uid,
            name: event.name,
            price: event.price,
            metadata: event.metadata,
            currency: event.currency,
            description: event.description,
            image: event.image);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(CreateServiceReseted());
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
              add(CreateServiceErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(CreateServiceFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(CreateServiceIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(CreateServiceIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(CreateServiceIsConcrete(data: data));
            } else {
              add(CreateServiceErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return CreateServiceError(data: state.data!, message: e.toString());
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
    return (state is CreateServiceInitial) || (state is CreateServiceError)
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
