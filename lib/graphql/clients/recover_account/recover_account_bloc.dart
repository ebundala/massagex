import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/auth_result.dart';
import 'recover_account_ast.dart' show document;

part "recover_account_extensions.dart";
part "recover_account_events.dart";
part "recover_account_states.dart";

enum RecoverAccountBlocHookStage { before, after }

class RecoverAccountBloc
    extends Bloc<RecoverAccountEvent, RecoverAccountState> {
  final GraphQLClient client;
  final Stream<RecoverAccountState> Function(RecoverAccountBloc context,
      RecoverAccountEvent event, RecoverAccountBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  RecoverAccountBloc({required this.client, this.hook})
      : super(RecoverAccountInitial()) {
    on<RecoverAccountEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<RecoverAccountState?> mapEventToState(
      RecoverAccountEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, RecoverAccountBlocHookStage.before);
    //   }
    //  else
    if (event is RecoverAccountStarted) {
      return RecoverAccountInitial();
    } else if (event is RecoverAccountExcuted) {
      //start main excution
      return await recoverAccount(event);
    } else if (event is RecoverAccountIsLoading) {
      // emit loading state
      {
        return RecoverAccountInProgress(data: event.data);
      }
    } else if (event is RecoverAccountIsOptimistic) {
      // emit optimistic result state
      return RecoverAccountOptimistic(data: event.data);
    } else if (event is RecoverAccountIsConcrete) {
      // emit completed result
      return RecoverAccountSuccess(data: event.data);
    } else if (event is RecoverAccountRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is RecoverAccountFailed) {
      // emit failure state
      return RecoverAccountFailure(data: event.data, message: event.message);
    } else if (event is RecoverAccountErrored) {
      //emit error case
      return RecoverAccountError(data: event.data, message: event.message);
    } else if (event is RecoverAccountRetried) {
      recoverAccountRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, RecoverAccountBlocHookStage.after);
    // }
    return null;
  }

  void recoverAccountRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.recoverAccountRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<RecoverAccountState?> recoverAccount(
      RecoverAccountExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.recoverAccount(email: event.email);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(RecoverAccountReseted());
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
              add(RecoverAccountErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(RecoverAccountFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(RecoverAccountIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(RecoverAccountIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(RecoverAccountIsConcrete(data: data));
            } else {
              add(RecoverAccountErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return RecoverAccountError(data: state.data!, message: e.toString());
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
    return (state is RecoverAccountInitial) || (state is RecoverAccountError)
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
