import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/business_list_response.dart';
import 'find_many_businesses_ast.dart' show document;

part "find_many_businesses_extensions.dart";
part "find_many_businesses_events.dart";
part "find_many_businesses_states.dart";

enum FindManyBusinessesBlocHookStage { before, after }

class FindManyBusinessesBloc
    extends Bloc<FindManyBusinessesEvent, FindManyBusinessesState> {
  final GraphQLClient client;
  final Stream<FindManyBusinessesState> Function(
      FindManyBusinessesBloc context,
      FindManyBusinessesEvent event,
      FindManyBusinessesBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindManyBusinessesBloc({required this.client, this.hook})
      : super(FindManyBusinessesInitial()) {
    on<FindManyBusinessesEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindManyBusinessesState?> mapEventToState(
      FindManyBusinessesEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindManyBusinessesBlocHookStage.before);
    //   }
    //  else
    if (event is FindManyBusinessesStarted) {
      return FindManyBusinessesInitial();
    } else if (event is FindManyBusinessesExcuted) {
      //start main excution
      return await findManyBusinesses(event);
    } else if (event is FindManyBusinessesIsLoading) {
      // emit loading state
      if (!(state is FindManyBusinessesLoadMoreInProgress)) {
        return FindManyBusinessesInProgress(data: event.data);
      }
    } else if (event is FindManyBusinessesIsOptimistic) {
      // emit optimistic result state
      return FindManyBusinessesOptimistic(data: event.data);
    } else if (event is FindManyBusinessesIsConcrete) {
      // emit completed result
      return FindManyBusinessesSuccess(data: event.data);
    } else if (event is FindManyBusinessesRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindManyBusinessesFailed) {
      // emit failure state
      return FindManyBusinessesFailure(
          data: event.data, message: event.message);
    } else if (event is FindManyBusinessesErrored) {
      //emit error case
      return FindManyBusinessesError(data: event.data, message: event.message);
    } else if (event is FindManyBusinessesRetried) {
      findManyBusinessesRetry();
    } else if (event is FindManyBusinessesMoreLoaded) {
      return FindManyBusinessesLoadMoreInProgress(data: getData);
      findManyBusinessesLoadMore(event);
    } else if (event is FindManyBusinessesStreamEnded) {
      return FindManyBusinessesAllDataLoaded(data: getData);
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindManyBusinessesBlocHookStage.after);
    // }
    return null;
  }

  void findManyBusinessesRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findManyBusinessesRetry(resultWrapper!.observableQuery!);
    }
  }

  void findManyBusinessesLoadMore(FindManyBusinessesMoreLoaded event) {
    if (resultWrapper?.observableQuery != null) {
      client.findManyBusinessesLoadMore(
        resultWrapper!.observableQuery!,
      );
    }
  }

  Future<FindManyBusinessesState?> findManyBusinesses(
      FindManyBusinessesExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findManyBusinesses();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindManyBusinessesReseted());
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
          var data = BusinessListResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = BusinessListResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = BusinessListResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindManyBusinessesErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindManyBusinessesFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindManyBusinessesIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindManyBusinessesIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindManyBusinessesIsConcrete(data: data));
            } else {
              add(FindManyBusinessesErrored(
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
        return FindManyBusinessesError(
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

  BusinessListResponse get getData {
    return (state is FindManyBusinessesInitial) ||
            (state is FindManyBusinessesError)
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
