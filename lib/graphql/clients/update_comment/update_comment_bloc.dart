import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/attachment_create_without_comment_input.dart';
import 'package:models/user_response.dart';
import 'update_comment_ast.dart' show document;

part "update_comment_extensions.dart";
part "update_comment_events.dart";
part "update_comment_states.dart";

enum UpdateCommentBlocHookStage { before, after }

class UpdateCommentBloc extends Bloc<UpdateCommentEvent, UpdateCommentState> {
  final GraphQLClient client;
  final Stream<UpdateCommentState> Function(UpdateCommentBloc context,
      UpdateCommentEvent event, UpdateCommentBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateCommentBloc({required this.client, this.hook})
      : super(UpdateCommentInitial()) {
    on<UpdateCommentEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateCommentState?> mapEventToState(UpdateCommentEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateCommentBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateCommentStarted) {
      return UpdateCommentInitial();
    } else if (event is UpdateCommentExcuted) {
      //start main excution
      return await updateComment(event);
    } else if (event is UpdateCommentIsLoading) {
      // emit loading state
      {
        return UpdateCommentInProgress(data: event.data);
      }
    } else if (event is UpdateCommentIsOptimistic) {
      // emit optimistic result state
      return UpdateCommentOptimistic(data: event.data);
    } else if (event is UpdateCommentIsConcrete) {
      // emit completed result
      return UpdateCommentSuccess(data: event.data);
    } else if (event is UpdateCommentRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateCommentFailed) {
      // emit failure state
      return UpdateCommentFailure(data: event.data, message: event.message);
    } else if (event is UpdateCommentErrored) {
      //emit error case
      return UpdateCommentError(data: event.data, message: event.message);
    } else if (event is UpdateCommentRetried) {
      updateCommentRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateCommentBlocHookStage.after);
    // }
    return null;
  }

  void updateCommentRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateCommentRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateCommentState?> updateComment(UpdateCommentExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper =
            await client.updateComment(attachments: event.attachments);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateCommentReseted());
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
              add(UpdateCommentErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateCommentFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateCommentIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateCommentIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateCommentIsConcrete(data: data));
            } else {
              add(UpdateCommentErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return UpdateCommentError(data: state.data!, message: e.toString());
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
    return (state is UpdateCommentInitial) || (state is UpdateCommentError)
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
