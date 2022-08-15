import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/string_field_update_operations_input.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/enum_business_status_field_update_operations_input.dart';
import 'package:models/location_update_without_businesses_input.dart';
import 'package:models/enum_business_mode_field_update_operations_input.dart';
import 'package:models/attachment_update_one_without_businesses_input.dart';
import 'package:models/attachment_create_without_business_input.dart';
import 'package:models/attachment_where_unique_input.dart';
import 'package:models/user_response.dart';
import 'update_my_business_profile_ast.dart' show document;

part "update_my_business_profile_extensions.dart";
part "update_my_business_profile_events.dart";
part "update_my_business_profile_states.dart";

enum UpdateMyBusinessProfileBlocHookStage { before, after }

class UpdateMyBusinessProfileBloc
    extends Bloc<UpdateMyBusinessProfileEvent, UpdateMyBusinessProfileState> {
  final GraphQLClient client;
  final Stream<UpdateMyBusinessProfileState> Function(
      UpdateMyBusinessProfileBloc context,
      UpdateMyBusinessProfileEvent event,
      UpdateMyBusinessProfileBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateMyBusinessProfileBloc({required this.client, this.hook})
      : super(UpdateMyBusinessProfileInitial()) {
    on<UpdateMyBusinessProfileEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateMyBusinessProfileState?> mapEventToState(
      UpdateMyBusinessProfileEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateMyBusinessProfileBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateMyBusinessProfileStarted) {
      return UpdateMyBusinessProfileInitial();
    } else if (event is UpdateMyBusinessProfileExcuted) {
      //start main excution
      return await updateMyBusinessProfile(event);
    } else if (event is UpdateMyBusinessProfileIsLoading) {
      // emit loading state
      {
        return UpdateMyBusinessProfileInProgress(data: event.data);
      }
    } else if (event is UpdateMyBusinessProfileIsOptimistic) {
      // emit optimistic result state
      return UpdateMyBusinessProfileOptimistic(data: event.data);
    } else if (event is UpdateMyBusinessProfileIsConcrete) {
      // emit completed result
      return UpdateMyBusinessProfileSuccess(data: event.data);
    } else if (event is UpdateMyBusinessProfileRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateMyBusinessProfileFailed) {
      // emit failure state
      return UpdateMyBusinessProfileFailure(
          data: event.data, message: event.message);
    } else if (event is UpdateMyBusinessProfileErrored) {
      //emit error case
      return UpdateMyBusinessProfileError(
          data: event.data, message: event.message);
    } else if (event is UpdateMyBusinessProfileRetried) {
      updateMyBusinessProfileRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateMyBusinessProfileBlocHookStage.after);
    // }
    return null;
  }

  void updateMyBusinessProfileRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateMyBusinessProfileRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateMyBusinessProfileState?> updateMyBusinessProfile(
      UpdateMyBusinessProfileExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.updateMyBusinessProfile(
            id: event.id,
            about: event.about,
            businessName: event.businessName,
            metadata: event.metadata,
            status: event.status,
            location: event.location,
            mode: event.mode,
            cover: event.cover,
            gallery: event.gallery,
            deletedAttachments: event.deletedAttachments);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateMyBusinessProfileReseted());
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
              add(UpdateMyBusinessProfileErrored(
                  data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateMyBusinessProfileFailed(
                  data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateMyBusinessProfileIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateMyBusinessProfileIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateMyBusinessProfileIsConcrete(data: data));
            } else {
              add(UpdateMyBusinessProfileErrored(
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
        return UpdateMyBusinessProfileError(
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
    return (state is UpdateMyBusinessProfileInitial) ||
            (state is UpdateMyBusinessProfileError)
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
