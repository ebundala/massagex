import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/sign_out_result.dart';
import 'signout_ast.dart' show document;

part "signout_extensions.dart";
part "signout_events.dart";
part "signout_states.dart";

enum SignoutBlocHookStage { before, after }

class SignoutBloc extends Bloc<SignoutEvent, SignoutState> {
  final GraphQLClient client;
  final Stream<SignoutState> Function(
          SignoutBloc context, SignoutEvent event, SignoutBlocHookStage stage)?
      hook;
  OperationResult? resultWrapper;
  SignoutBloc({required this.client, this.hook}) : super(SignoutInitial()) {
    on<SignoutEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<SignoutState?> mapEventToState(SignoutEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, SignoutBlocHookStage.before);
    //   }
    //  else
    if (event is SignoutStarted) {
      return SignoutInitial();
    } else if (event is SignoutExcuted) {
      //start main excution
      return await signout(event);
    } else if (event is SignoutIsLoading) {
      // emit loading state
      {
        return SignoutInProgress(data: event.data);
      }
    } else if (event is SignoutIsOptimistic) {
      // emit optimistic result state
      return SignoutOptimistic(data: event.data);
    } else if (event is SignoutIsConcrete) {
      // emit completed result
      return SignoutSuccess(data: event.data);
    } else if (event is SignoutRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is SignoutFailed) {
      // emit failure state
      return SignoutFailure(data: event.data, message: event.message);
    } else if (event is SignoutErrored) {
      //emit error case
      return SignoutError(data: event.data, message: event.message);
    } else if (event is SignoutRetried) {
      signoutRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, SignoutBlocHookStage.after);
    // }
    return null;
  }

  void signoutRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.signoutRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<SignoutState?> signout(SignoutExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.signout();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(SignoutReseted());
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
          var data = SignOutResult();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = SignOutResult.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = SignOutResult.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(SignoutErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(SignoutFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(SignoutIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(SignoutIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(SignoutIsConcrete(data: data));
            } else {
              add(SignoutErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return SignoutError(data: state.data!, message: e.toString());
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

  SignOutResult get getData {
    return (state is SignoutInitial) || (state is SignoutError)
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
