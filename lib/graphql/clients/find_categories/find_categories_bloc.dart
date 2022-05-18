import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/category_list_response.dart';
import 'find_categories_ast.dart' show document;

part "find_categories_extensions.dart";
part "find_categories_events.dart";
part "find_categories_states.dart";

enum FindCategoriesBlocHookStage { before, after }

class FindCategoriesBloc
    extends Bloc<FindCategoriesEvent, FindCategoriesState> {
  final GraphQLClient client;
  final Stream<FindCategoriesState> Function(FindCategoriesBloc context,
      FindCategoriesEvent event, FindCategoriesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindCategoriesBloc({required this.client, this.hook})
      : super(FindCategoriesInitial()) {
    on<FindCategoriesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindCategoriesState?> mapEventToState(
      FindCategoriesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindCategoriesBlocHookStage.before);
    //   }
    //  else
    if (event is FindCategoriesStarted) {
      return FindCategoriesInitial();
    } else if (event is FindCategoriesExcuted) {
      //start main excution
      return await findCategories(event);
    } else if (event is FindCategoriesIsLoading) {
      // emit loading state
      if (!(state is FindCategoriesLoadMoreInProgress)) {
        return FindCategoriesInProgress(data: event.data);
      }
    } else if (event is FindCategoriesIsOptimistic) {
      // emit optimistic result state
      return FindCategoriesOptimistic(data: event.data);
    } else if (event is FindCategoriesIsConcrete) {
      // emit completed result
      return FindCategoriesSuccess(data: event.data);
    } else if (event is FindCategoriesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindCategoriesFailed) {
      // emit failure state
      return FindCategoriesFailure(data: event.data, message: event.message);
    } else if (event is FindCategoriesErrored) {
      //emit error case
      return FindCategoriesError(data: event.data, message: event.message);
    } else if (event is FindCategoriesRetried) {
      findCategoriesRetry();
    } else if (event is FindCategoriesMoreLoaded) {
      return FindCategoriesLoadMoreInProgress(data: getData);
      findCategoriesLoadMore(event);
    } else if (event is FindCategoriesStreamEnded) {
      return FindCategoriesAllDataLoaded(data: getData);
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindCategoriesBlocHookStage.after);
    // }
    return null;
  }

  void findCategoriesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findCategoriesRetry(resultWrapper!.observableQuery!);
    }
  }

  void findCategoriesLoadMore(FindCategoriesMoreLoaded event) {
    if (resultWrapper?.observableQuery != null) {
      client.findCategoriesLoadMore(
        resultWrapper!.observableQuery!,
      );
    }
  }

  Future<FindCategoriesState?> findCategories(
      FindCategoriesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findCategories();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindCategoriesReseted());
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
          var data = CategoryListResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = CategoryListResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = CategoryListResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindCategoriesErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindCategoriesFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindCategoriesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindCategoriesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindCategoriesIsConcrete(data: data));
            } else {
              add(FindCategoriesErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindCategoriesError(data: state.data!, message: e.toString());
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

  CategoryListResponse get getData {
    return (state is FindCategoriesInitial) || (state is FindCategoriesError)
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
