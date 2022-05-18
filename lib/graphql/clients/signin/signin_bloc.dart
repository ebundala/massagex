import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/auth_input.dart';
import 'package:models/auth_result.dart';
import 'signin_ast.dart' show document;

part "signin_extensions.dart";
part "signin_events.dart";
part "signin_states.dart";

enum SigninBlocHookStage { before, after }

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final GraphQLClient client;
  final Stream<SigninState> Function(
      SigninBloc context, SigninEvent event, SigninBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  SigninBloc({required this.client, this.hook}) : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<SigninState?> mapEventToState(SigninEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, SigninBlocHookStage.before);
    //   }
    //  else
    if (event is SigninStarted) {
      return SigninInitial();
    } else if (event is SigninExcuted) {
      //start main excution
      return await signin(event);
    } else if (event is SigninIsLoading) {
      // emit loading state
      {
        return SigninInProgress(data: event.data);
      }
    } else if (event is SigninIsOptimistic) {
      // emit optimistic result state
      return SigninOptimistic(data: event.data);
    } else if (event is SigninIsConcrete) {
      // emit completed result
      return SigninSuccess(data: event.data);
    } else if (event is SigninRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is SigninFailed) {
      // emit failure state
      return SigninFailure(data: event.data, message: event.message);
    } else if (event is SigninErrored) {
      //emit error case
      return SigninError(data: event.data, message: event.message);
    } else if (event is SigninRetried) {
      signinRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, SigninBlocHookStage.after);
    // }
    return null;
  }

  void signinRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.signinRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<SigninState?> signin(SigninExcuted event) async {
    //validate all required fields of required args and emit relevant events
    if (event.credentials.email.isEmpty == true) {
      return SigninCredentialsEmailValidationError('email is required', getData,
          $credentials: event.credentials);
    } else if (event.credentials.password.isEmpty == true) {
      return SigninCredentialsPasswordValidationError(
          'password is required', getData,
          $credentials: event.credentials);
    } else {
      try {
        await closeResultWrapper();
        resultWrapper = await client.signin(credentials: event.credentials);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(SigninReseted());
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
              add(SigninErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(SigninFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(SigninIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(SigninIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(SigninIsConcrete(data: data));
            } else {
              add(SigninErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return SigninError(data: state.data!, message: e.toString());
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
    return (state is SigninInitial) || (state is SigninError)
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
