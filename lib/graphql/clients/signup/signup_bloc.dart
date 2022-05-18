import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/signup_input.dart';
import 'package:models/auth_result.dart';
import 'signup_ast.dart' show document;

part "signup_extensions.dart";
part "signup_events.dart";
part "signup_states.dart";

enum SignupBlocHookStage { before, after }

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final GraphQLClient client;
  final Stream<SignupState> Function(
      SignupBloc context, SignupEvent event, SignupBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  SignupBloc({required this.client, this.hook}) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<SignupState?> mapEventToState(SignupEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, SignupBlocHookStage.before);
    //   }
    //  else
    if (event is SignupStarted) {
      return SignupInitial();
    } else if (event is SignupExcuted) {
      //start main excution
      return await signup(event);
    } else if (event is SignupIsLoading) {
      // emit loading state
      {
        return SignupInProgress(data: event.data);
      }
    } else if (event is SignupIsOptimistic) {
      // emit optimistic result state
      return SignupOptimistic(data: event.data);
    } else if (event is SignupIsConcrete) {
      // emit completed result
      return SignupSuccess(data: event.data);
    } else if (event is SignupRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is SignupFailed) {
      // emit failure state
      return SignupFailure(data: event.data, message: event.message);
    } else if (event is SignupErrored) {
      //emit error case
      return SignupError(data: event.data, message: event.message);
    } else if (event is SignupRetried) {
      signupRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, SignupBlocHookStage.after);
    // }
    return null;
  }

  void signupRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.signupRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<SignupState?> signup(SignupExcuted event) async {
    //validate all required fields of required args and emit relevant events
    if (event.credentials.password.isEmpty == true) {
      return SignupCredentialsPasswordValidationError(
          'password is required', getData,
          $credentials: event.credentials);
    } else if (event.credentials.displayName.isEmpty == true) {
      return SignupCredentialsDisplayNameValidationError(
          'displayName is required', getData,
          $credentials: event.credentials);
    } else {
      try {
        await closeResultWrapper();
        resultWrapper = await client.signup(credentials: event.credentials);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(SignupReseted());
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
          var data = AuthResult();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = AuthResult.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = AuthResult.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(SignupErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(SignupFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(SignupIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(SignupIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(SignupIsConcrete(data: data));
            } else {
              add(SignupErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return SignupError(data: state.data!, message: e.toString());
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

  AuthResult get getData {
    return (state is SignupInitial) || (state is SignupError)
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
