import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/attachment_create_without_reviews_input.dart';
import 'package:models/user_response.dart';
import 'update_review_ast.dart' show document;

part "update_review_extensions.dart";
part "update_review_events.dart";
part "update_review_states.dart";

enum UpdateReviewBlocHookStage { before, after }

class UpdateReviewBloc extends Bloc<UpdateReviewEvent, UpdateReviewState> {
  final GraphQLClient client;
  final Stream<UpdateReviewState> Function(UpdateReviewBloc context,
      UpdateReviewEvent event, UpdateReviewBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateReviewBloc({required this.client, this.hook})
      : super(UpdateReviewInitial()) {
    on<UpdateReviewEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateReviewState?> mapEventToState(UpdateReviewEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateReviewBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateReviewStarted) {
      return UpdateReviewInitial();
    } else if (event is UpdateReviewExcuted) {
      //start main excution
      return await updateReview(event);
    } else if (event is UpdateReviewIsLoading) {
      // emit loading state
      {
        return UpdateReviewInProgress(data: event.data);
      }
    } else if (event is UpdateReviewIsOptimistic) {
      // emit optimistic result state
      return UpdateReviewOptimistic(data: event.data);
    } else if (event is UpdateReviewIsConcrete) {
      // emit completed result
      return UpdateReviewSuccess(data: event.data);
    } else if (event is UpdateReviewRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateReviewFailed) {
      // emit failure state
      return UpdateReviewFailure(data: event.data, message: event.message);
    } else if (event is UpdateReviewErrored) {
      //emit error case
      return UpdateReviewError(data: event.data, message: event.message);
    } else if (event is UpdateReviewRetried) {
      updateReviewRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateReviewBlocHookStage.after);
    // }
    return null;
  }

  void updateReviewRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateReviewRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateReviewState?> updateReview(UpdateReviewExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper =
            await client.updateReview(attachments: event.attachments);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateReviewReseted());
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
              add(UpdateReviewErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateReviewFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateReviewIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateReviewIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateReviewIsConcrete(data: data));
            } else {
              add(UpdateReviewErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return UpdateReviewError(data: state.data!, message: e.toString());
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
    return (state is UpdateReviewInitial) || (state is UpdateReviewError)
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
