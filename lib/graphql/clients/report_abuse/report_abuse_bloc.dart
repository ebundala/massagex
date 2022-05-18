import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/user_response.dart';
import 'report_abuse_ast.dart' show document;

part "report_abuse_extensions.dart";
part "report_abuse_events.dart";
part "report_abuse_states.dart";

enum ReportAbuseBlocHookStage { before, after }

class ReportAbuseBloc extends Bloc<ReportAbuseEvent, ReportAbuseState> {
  final GraphQLClient client;
  final Stream<ReportAbuseState> Function(ReportAbuseBloc context,
      ReportAbuseEvent event, ReportAbuseBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  ReportAbuseBloc({required this.client, this.hook})
      : super(ReportAbuseInitial()) {
    on<ReportAbuseEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<ReportAbuseState?> mapEventToState(ReportAbuseEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, ReportAbuseBlocHookStage.before);
    //   }
    //  else
    if (event is ReportAbuseStarted) {
      return ReportAbuseInitial();
    } else if (event is ReportAbuseExcuted) {
      //start main excution
      return await reportAbuse(event);
    } else if (event is ReportAbuseIsLoading) {
      // emit loading state
      {
        return ReportAbuseInProgress(data: event.data);
      }
    } else if (event is ReportAbuseIsOptimistic) {
      // emit optimistic result state
      return ReportAbuseOptimistic(data: event.data);
    } else if (event is ReportAbuseIsConcrete) {
      // emit completed result
      return ReportAbuseSuccess(data: event.data);
    } else if (event is ReportAbuseRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is ReportAbuseFailed) {
      // emit failure state
      return ReportAbuseFailure(data: event.data, message: event.message);
    } else if (event is ReportAbuseErrored) {
      //emit error case
      return ReportAbuseError(data: event.data, message: event.message);
    } else if (event is ReportAbuseRetried) {
      reportAbuseRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, ReportAbuseBlocHookStage.after);
    // }
    return null;
  }

  void reportAbuseRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.reportAbuseRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<ReportAbuseState?> reportAbuse(ReportAbuseExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.reportAbuse();
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(ReportAbuseReseted());
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
              add(ReportAbuseErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(ReportAbuseFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(ReportAbuseIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(ReportAbuseIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(ReportAbuseIsConcrete(data: data));
            } else {
              add(ReportAbuseErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return ReportAbuseError(data: state.data!, message: e.toString());
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
    return (state is ReportAbuseInitial) || (state is ReportAbuseError)
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
