import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'add_to_favorites_ast.dart' show document;

part "add_to_favorites_extensions.dart";
part "add_to_favorites_events.dart";
part "add_to_favorites_states.dart";

enum AddToFavoritesBlocHookStage { before, after }

class AddToFavoritesBloc
    extends Bloc<AddToFavoritesEvent, AddToFavoritesState> {
  final GraphQLClient client;
  final Stream<AddToFavoritesState> Function(AddToFavoritesBloc context,
      AddToFavoritesEvent event, AddToFavoritesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  AddToFavoritesBloc({required this.client, this.hook})
      : super(AddToFavoritesInitial()) {
    on<AddToFavoritesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<AddToFavoritesState?> mapEventToState(
      AddToFavoritesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, AddToFavoritesBlocHookStage.before);
    //   }
    //  else
    if (event is AddToFavoritesStarted) {
      return AddToFavoritesInitial();
    } else if (event is AddToFavoritesExcuted) {
      //start main excution
      return await addToFavorites(event);
    } else if (event is AddToFavoritesIsLoading) {
      // emit loading state
      {
        return AddToFavoritesInProgress(data: event.data);
      }
    } else if (event is AddToFavoritesIsOptimistic) {
      // emit optimistic result state
      return AddToFavoritesOptimistic(data: event.data);
    } else if (event is AddToFavoritesIsConcrete) {
      // emit completed result
      return AddToFavoritesSuccess(data: event.data);
    } else if (event is AddToFavoritesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is AddToFavoritesFailed) {
      // emit failure state
      return AddToFavoritesFailure(data: event.data, message: event.message);
    } else if (event is AddToFavoritesErrored) {
      //emit error case
      return AddToFavoritesError(data: event.data, message: event.message);
    } else if (event is AddToFavoritesRetried) {
      addToFavoritesRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, AddToFavoritesBlocHookStage.after);
    // }
    return null;
  }

  void addToFavoritesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.addToFavoritesRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<AddToFavoritesState?> addToFavorites(
      AddToFavoritesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.addToFavorites();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(AddToFavoritesReseted());
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
              add(AddToFavoritesErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(AddToFavoritesFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(AddToFavoritesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(AddToFavoritesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(AddToFavoritesIsConcrete(data: data));
            } else {
              add(AddToFavoritesErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return AddToFavoritesError(data: state.data!, message: e.toString());
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
    return (state is AddToFavoritesInitial) || (state is AddToFavoritesError)
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
