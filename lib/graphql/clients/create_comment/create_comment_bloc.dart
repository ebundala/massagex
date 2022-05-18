import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/attachment_create_without_comment_input.dart';
import 'package:models/user_response.dart';
import 'create_comment_ast.dart' show document;

part "create_comment_extensions.dart";
part "create_comment_events.dart";
part "create_comment_states.dart";

enum CreateCommentBlocHookStage { before, after }

class CreateCommentBloc extends Bloc<CreateCommentEvent, CreateCommentState> {
  final GraphQLClient client;
  final Stream<CreateCommentState> Function(CreateCommentBloc context,
      CreateCommentEvent event, CreateCommentBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  CreateCommentBloc({required this.client, this.hook})
      : super(CreateCommentInitial()) {
    on<CreateCommentEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<CreateCommentState?> mapEventToState(CreateCommentEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, CreateCommentBlocHookStage.before);
    //   }
    //  else
    if (event is CreateCommentStarted) {
      return CreateCommentInitial();
    } else if (event is CreateCommentExcuted) {
      //start main excution
      return await createComment(event);
    } else if (event is CreateCommentIsLoading) {
      // emit loading state
      {
        return CreateCommentInProgress(data: event.data);
      }
    } else if (event is CreateCommentIsOptimistic) {
      // emit optimistic result state
      return CreateCommentOptimistic(data: event.data);
    } else if (event is CreateCommentIsConcrete) {
      // emit completed result
      return CreateCommentSuccess(data: event.data);
    } else if (event is CreateCommentRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is CreateCommentFailed) {
      // emit failure state
      return CreateCommentFailure(data: event.data, message: event.message);
    } else if (event is CreateCommentErrored) {
      //emit error case
      return CreateCommentError(data: event.data, message: event.message);
    } else if (event is CreateCommentRetried) {
      createCommentRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, CreateCommentBlocHookStage.after);
    // }
    return null;
  }

  void createCommentRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.createCommentRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<CreateCommentState?> createComment(CreateCommentExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper =
            await client.createComment(attachments: event.attachments);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(CreateCommentReseted());
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
              add(CreateCommentErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(CreateCommentFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(CreateCommentIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(CreateCommentIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(CreateCommentIsConcrete(data: data));
            } else {
              add(CreateCommentErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return CreateCommentError(data: state.data!, message: e.toString());
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
    return (state is CreateCommentInitial) || (state is CreateCommentError)
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
