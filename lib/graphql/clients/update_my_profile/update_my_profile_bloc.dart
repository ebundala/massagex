import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
import 'package:bloc/bloc.dart';
import 'package:massagex/graphql/common/common_client_helpers.dart';
import 'package:models/string_field_update_operations_input.dart';
import 'package:models/nullable_string_field_update_operations_input.dart';
import 'package:models/nullable_date_time_field_update_operations_input.dart';
import 'package:models/enum_gender_field_update_operations_input.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/location_update_without_users_input.dart';
import 'package:models/attachment_update_one_without_users_input.dart';
import 'package:models/user_response.dart';
import 'update_my_profile_ast.dart' show document;

part "update_my_profile_extensions.dart";
part "update_my_profile_events.dart";
part "update_my_profile_states.dart";

enum UpdateMyProfileBlocHookStage { before, after }

class UpdateMyProfileBloc
    extends Bloc<UpdateMyProfileEvent, UpdateMyProfileState> {
  final GraphQLClient client;
  final Stream<UpdateMyProfileState> Function(UpdateMyProfileBloc context,
      UpdateMyProfileEvent event, UpdateMyProfileBlocHookStage stage)? hook;
  OperationResult? resultWrapper;
  UpdateMyProfileBloc({required this.client, this.hook})
      : super(UpdateMyProfileInitial()) {
    on<UpdateMyProfileEvent>((event, emit) async {
      final st = await mapEventToState(event);
      if (st != null) {
        emit(st);
      }
    });
  }

  Future<UpdateMyProfileState?> mapEventToState(
      UpdateMyProfileEvent event) async {
    //   if (hook != null) {
    //     return hook(this, event, UpdateMyProfileBlocHookStage.before);
    //   }
    //  else
    if (event is UpdateMyProfileStarted) {
      return UpdateMyProfileInitial();
    } else if (event is UpdateMyProfileExcuted) {
      //start main excution
      return await updateMyProfile(event);
    } else if (event is UpdateMyProfileIsLoading) {
      // emit loading state
      {
        return UpdateMyProfileInProgress(data: event.data);
      }
    } else if (event is UpdateMyProfileIsOptimistic) {
      // emit optimistic result state
      return UpdateMyProfileOptimistic(data: event.data);
    } else if (event is UpdateMyProfileIsConcrete) {
      // emit completed result
      return UpdateMyProfileSuccess(data: event.data);
    } else if (event is UpdateMyProfileRefreshed) {
      //emit dataset changed
      return event.data;
    } else if (event is UpdateMyProfileFailed) {
      // emit failure state
      return UpdateMyProfileFailure(data: event.data, message: event.message);
    } else if (event is UpdateMyProfileErrored) {
      //emit error case
      return UpdateMyProfileError(data: event.data, message: event.message);
    } else if (event is UpdateMyProfileRetried) {
      updateMyProfileRetry();
    }

    // else
    // if (hook != null) {
    //   return hook(this, event, UpdateMyProfileBlocHookStage.after);
    // }
    return null;
  }

  void updateMyProfileRetry() {
    if (resultWrapper?.observableQuery != null) {
      client.updateMyProfileRetry(resultWrapper!.observableQuery!);
    }
  }

  Future<UpdateMyProfileState?> updateMyProfile(
      UpdateMyProfileExcuted event) async {
    //validate all required fields of required args and emit relevant events

    {
      try {
        await closeResultWrapper();
        resultWrapper = await client.updateMyProfile(
            id: event.id,
            displayName: event.displayName,
            phoneNumber: event.phoneNumber,
            dateOfBirth: event.dateOfBirth,
            gender: event.gender,
            metadata: event.metadata,
            location: event.location,
            avator: event.avator);
        //listen for changes
        resultWrapper!.subscription = resultWrapper!.stream?.listen((result) {
          //reset events before starting to emit new ones
          add(UpdateMyProfileReseted());
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
              add(UpdateMyProfileErrored(data: data, message: data.message!));
            } else if (result.exception?.graphqlErrors.isNotEmpty == true) {
              //emit failure event
              add(UpdateMyProfileFailed(data: data, message: data.message!));
            }
          } else if (result.isLoading) {
            //emit loading event
            add(UpdateMyProfileIsLoading(data: data));
          } else if (result.isOptimistic) {
            //emit optimistic event
            add(UpdateMyProfileIsOptimistic(data: data));
          } else if (result.isConcrete) {
            //emit completed event
            if (data.status == true) {
              add(UpdateMyProfileIsConcrete(data: data));
            } else {
              add(UpdateMyProfileErrored(data: data, message: data.message!));
            }
          }
        });
        //excute observable query;
        if (resultWrapper!.isObservable) {
          resultWrapper!.observableQuery!.fetchResults();
        }
      } catch (e) {
        //emit complete failure state;
        return UpdateMyProfileError(data: state.data!, message: e.toString());
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
    return (state is UpdateMyProfileInitial) || (state is UpdateMyProfileError)
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
