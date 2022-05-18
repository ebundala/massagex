import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/attachment_create_without_reviews_input.dart';
import 'package:models/user_response.dart';
import 'create_review_ast.dart' show document;

part "create_review_extensions.dart";
part "create_review_events.dart";
part "create_review_states.dart";

enum CreateReviewBlocHookStage { before, after }

class CreateReviewBloc extends Bloc<CreateReviewEvent, CreateReviewState> {
  final GraphQLClient client;
  final Stream<CreateReviewState> Function(CreateReviewBloc context,
      CreateReviewEvent event, CreateReviewBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  CreateReviewBloc({required this.client, this.hook})
      : super(CreateReviewInitial()) {
    on<CreateReviewEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<CreateReviewState?> mapEventToState(CreateReviewEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, CreateReviewBlocHookStage.before);
    //   }
    //  else
    if (event is CreateReviewStarted) {
      return CreateReviewInitial();
    } else if (event is CreateReviewExcuted) {
      //start main excution
      return await createReview(event);
    } else if (event is CreateReviewIsLoading) {
      // emit loading state
      {
        return CreateReviewInProgress(data: event.data);
      }
    } else if (event is CreateReviewIsOptimistic) {
      // emit optimistic result state
      return CreateReviewOptimistic(data: event.data);
    } else if (event is CreateReviewIsConcrete) {
      // emit completed result
      return CreateReviewSuccess(data: event.data);
    } else if (event is CreateReviewRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is CreateReviewFailed) {
      // emit failure state
      return CreateReviewFailure(data: event.data, message: event.message);
    } else if (event is CreateReviewErrored) {
      //emit error case
      return CreateReviewError(data: event.data, message: event.message);
    } else if (event is CreateReviewRetried) {
      createReviewRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, CreateReviewBlocHookStage.after);
    // }
    return null;
  }

  void createReviewRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.createReviewRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<CreateReviewState?> createReview(CreateReviewExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper =
            await client.createReview(attachments: event.attachments);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(CreateReviewReseted());
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
              add(CreateReviewErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(CreateReviewFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(CreateReviewIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(CreateReviewIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(CreateReviewIsConcrete(data: data));
            } else {
              add(CreateReviewErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return CreateReviewError(data: state.data!, message: e.toString());
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
    return (state is CreateReviewInitial) || (state is CreateReviewError)
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
