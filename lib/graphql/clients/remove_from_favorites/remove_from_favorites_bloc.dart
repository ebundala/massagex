import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'remove_from_favorites_ast.dart' show document;

part "remove_from_favorites_extensions.dart";
part "remove_from_favorites_events.dart";
part "remove_from_favorites_states.dart";

enum RemoveFromFavoritesBlocHookStage { before, after }

class RemoveFromFavoritesBloc
    extends Bloc<RemoveFromFavoritesEvent, RemoveFromFavoritesState> {
  final GraphQLClient client;
  final Stream<RemoveFromFavoritesState> Function(
      RemoveFromFavoritesBloc context,
      RemoveFromFavoritesEvent event,
      RemoveFromFavoritesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  RemoveFromFavoritesBloc({required this.client, this.hook})
      : super(RemoveFromFavoritesInitial()) {
    on<RemoveFromFavoritesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<RemoveFromFavoritesState?> mapEventToState(
      RemoveFromFavoritesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, RemoveFromFavoritesBlocHookStage.before);
    //   }
    //  else
    if (event is RemoveFromFavoritesStarted) {
      return RemoveFromFavoritesInitial();
    } else if (event is RemoveFromFavoritesExcuted) {
      //start main excution
      return await removeFromFavorites(event);
    } else if (event is RemoveFromFavoritesIsLoading) {
      // emit loading state
      {
        return RemoveFromFavoritesInProgress(data: event.data);
      }
    } else if (event is RemoveFromFavoritesIsOptimistic) {
      // emit optimistic result state
      return RemoveFromFavoritesOptimistic(data: event.data);
    } else if (event is RemoveFromFavoritesIsConcrete) {
      // emit completed result
      return RemoveFromFavoritesSuccess(data: event.data);
    } else if (event is RemoveFromFavoritesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is RemoveFromFavoritesFailed) {
      // emit failure state
      return RemoveFromFavoritesFailure(
          data: event.data, message: event.message);
    } else if (event is RemoveFromFavoritesErrored) {
      //emit error case
      return RemoveFromFavoritesError(data: event.data, message: event.message);
    } else if (event is RemoveFromFavoritesRetried) {
      removeFromFavoritesRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, RemoveFromFavoritesBlocHookStage.after);
    // }
    return null;
  }

  void removeFromFavoritesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.removeFromFavoritesRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<RemoveFromFavoritesState?> removeFromFavorites(
      RemoveFromFavoritesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.removeFromFavorites();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(RemoveFromFavoritesReseted());
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
              add(RemoveFromFavoritesErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(RemoveFromFavoritesFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(RemoveFromFavoritesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(RemoveFromFavoritesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(RemoveFromFavoritesIsConcrete(data: data));
            } else {
              add(RemoveFromFavoritesErrored(
                  data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return RemoveFromFavoritesError(
            data: state.data!, message: e.toString());
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
    return (state is RemoveFromFavoritesInitial) ||
            (state is RemoveFromFavoritesError)
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
