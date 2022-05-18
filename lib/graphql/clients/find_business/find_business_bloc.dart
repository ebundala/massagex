import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/business_response.dart';
import 'find_business_ast.dart' show document;

part "find_business_extensions.dart";
part "find_business_events.dart";
part "find_business_states.dart";

enum FindBusinessBlocHookStage { before, after }

class FindBusinessBloc extends Bloc<FindBusinessEvent, FindBusinessState> {
  final GraphQLClient client;
  final Stream<FindBusinessState> Function(FindBusinessBloc context,
      FindBusinessEvent event, FindBusinessBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  FindBusinessBloc({required this.client, this.hook})
      : super(FindBusinessInitial()) {
    on<FindBusinessEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<FindBusinessState?> mapEventToState(FindBusinessEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, FindBusinessBlocHookStage.before);
    //   }
    //  else
    if (event is FindBusinessStarted) {
      return FindBusinessInitial();
    } else if (event is FindBusinessExcuted) {
      //start main excution
      return await findBusiness(event);
    } else if (event is FindBusinessIsLoading) {
      // emit loading state
      {
        return FindBusinessInProgress(data: event.data);
      }
    } else if (event is FindBusinessIsOptimistic) {
      // emit optimistic result state
      return FindBusinessOptimistic(data: event.data);
    } else if (event is FindBusinessIsConcrete) {
      // emit completed result
      return FindBusinessSuccess(data: event.data);
    } else if (event is FindBusinessRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is FindBusinessFailed) {
      // emit failure state
      return FindBusinessFailure(data: event.data, message: event.message);
    } else if (event is FindBusinessErrored) {
      //emit error case
      return FindBusinessError(data: event.data, message: event.message);
    } else if (event is FindBusinessRetried) {
      findBusinessRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, FindBusinessBlocHookStage.after);
    // }
    return null;
  }

  void findBusinessRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.findBusinessRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<FindBusinessState?> findBusiness(FindBusinessExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.findBusiness();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(FindBusinessReseted());
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
          var data = BusinessResponse();
          if (result.data != null) {
            //add errors encountered to result
            result.data!.addAll(errors);
            data = BusinessResponse.fromJson(result.data!);
          } else if (errors.isNotEmpty) {
            var cachedData = loadFromCache()..addAll(errors);
            data = BusinessResponse.fromJson(cachedData);
          }
          if (result.hasException) {
            if (result.exception?.linkException != null) {
              //emit error event
              add(FindBusinessErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(FindBusinessFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(FindBusinessIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(FindBusinessIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(FindBusinessIsConcrete(data: data));
            } else {
              add(FindBusinessErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return FindBusinessError(data: state.data!, message: e.toString());
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

  BusinessResponse get getData {
    return (state is FindBusinessInitial) || (state is FindBusinessError)
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
