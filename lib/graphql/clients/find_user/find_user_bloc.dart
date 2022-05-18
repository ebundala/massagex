import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'find_user_ast.dart' show document;

part "find_user_extensions.dart";
part "find_user_events.dart";
part "find_user_states.dart";

enum FindUserBlocHookStage { before, after }

class FindUserBloc extends Bloc<FindUserEvent, FindUserState> {
  final GraphQLClient client;
  final Stream<FindUserState> Function(FindUserBloc context,
      FindUserEvent event, FindUserBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindUserBloc({required this.client, this.hook}) : super(FindUserInitial()) {
    on<FindUserEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindUserState?> mapEventToState(FindUserEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindUserBlocHookStage.before);
    //   }
    //  else
    if (event is FindUserStarted) {
      return FindUserInitial();
    } else if (event is FindUserExcuted) {
      //start main excution
      return await findUser(event);
    } else if (event is FindUserIsLoading) {
      // emit loading state
      {
        return FindUserInProgress(data: event.data);
      }
    } else if (event is FindUserIsOptimistic) {
      // emit optimistic result state
      return FindUserOptimistic(data: event.data);
    } else if (event is FindUserIsConcrete) {
      // emit completed result
      return FindUserSuccess(data: event.data);
    } else if (event is FindUserRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindUserFailed) {
      // emit failure state
      return FindUserFailure(data: event.data, message: event.message);
    } else if (event is FindUserErrored) {
      //emit error case
      return FindUserError(data: event.data, message: event.message);
    } else if (event is FindUserRetried) {
      findUserRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindUserBlocHookStage.after);
    // }
    return null;
  }

  void findUserRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findUserRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindUserState?> findUser(FindUserExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findUser(id: event.id);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindUserReseted());
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
              add(FindUserErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindUserFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindUserIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindUserIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindUserIsConcrete(data: data));
            } else {
              add(FindUserErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindUserError(data: state.data!, message: e.toString());
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
    return (state is FindUserInitial) || (state is FindUserError)
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
