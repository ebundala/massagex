part of 'update_my_profile_bloc.dart';

abstract class UpdateMyProfileState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateMyProfileState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileInitial extends UpdateMyProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateMyProfileSuccess extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileFailure extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileInProgress extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileOptimistic extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileError extends UpdateMyProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyProfileError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileLocationUpdateValidationError
    extends UpdateMyProfileState {
  final String $id;
  final NullableStringFieldUpdateOperationsInput? $displayName;
  final NullableStringFieldUpdateOperationsInput? $phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? $dateOfBirth;
  final EnumGenderFieldUpdateOperationsInput? $gender;
  final JSONObject? $metadata;
  final LocationUpsertWithoutUsersInput? $location;
  final AttachmentUpdateOneWithoutUsersInput? $avator;
  final BusinessUpsertWithoutOwnerInput? $businessProfile;
  final UserResponse? data;
  final String? message;
  UpdateMyProfileLocationUpdateValidationError(this.message, this.data,
      {required this.$id,
      this.$displayName,
      this.$phoneNumber,
      this.$dateOfBirth,
      this.$gender,
      this.$metadata,
      this.$location,
      this.$avator,
      this.$businessProfile});
  @override
  List<Object?> get props => [
        $id,
        $displayName,
        $phoneNumber,
        $dateOfBirth,
        $gender,
        $metadata,
        $location,
        $avator,
        $businessProfile,
        message,
        data
      ];
}

class UpdateMyProfileLocationCreateValidationError
    extends UpdateMyProfileState {
  final String $id;
  final NullableStringFieldUpdateOperationsInput? $displayName;
  final NullableStringFieldUpdateOperationsInput? $phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? $dateOfBirth;
  final EnumGenderFieldUpdateOperationsInput? $gender;
  final JSONObject? $metadata;
  final LocationUpsertWithoutUsersInput? $location;
  final AttachmentUpdateOneWithoutUsersInput? $avator;
  final BusinessUpsertWithoutOwnerInput? $businessProfile;
  final UserResponse? data;
  final String? message;
  UpdateMyProfileLocationCreateValidationError(this.message, this.data,
      {required this.$id,
      this.$displayName,
      this.$phoneNumber,
      this.$dateOfBirth,
      this.$gender,
      this.$metadata,
      this.$location,
      this.$avator,
      this.$businessProfile});
  @override
  List<Object?> get props => [
        $id,
        $displayName,
        $phoneNumber,
        $dateOfBirth,
        $gender,
        $metadata,
        $location,
        $avator,
        $businessProfile,
        message,
        data
      ];
}

class UpdateMyProfileBusinessProfileUpdateValidationError
    extends UpdateMyProfileState {
  final String $id;
  final NullableStringFieldUpdateOperationsInput? $displayName;
  final NullableStringFieldUpdateOperationsInput? $phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? $dateOfBirth;
  final EnumGenderFieldUpdateOperationsInput? $gender;
  final JSONObject? $metadata;
  final LocationUpsertWithoutUsersInput? $location;
  final AttachmentUpdateOneWithoutUsersInput? $avator;
  final BusinessUpsertWithoutOwnerInput? $businessProfile;
  final UserResponse? data;
  final String? message;
  UpdateMyProfileBusinessProfileUpdateValidationError(this.message, this.data,
      {required this.$id,
      this.$displayName,
      this.$phoneNumber,
      this.$dateOfBirth,
      this.$gender,
      this.$metadata,
      this.$location,
      this.$avator,
      this.$businessProfile});
  @override
  List<Object?> get props => [
        $id,
        $displayName,
        $phoneNumber,
        $dateOfBirth,
        $gender,
        $metadata,
        $location,
        $avator,
        $businessProfile,
        message,
        data
      ];
}

class UpdateMyProfileBusinessProfileCreateValidationError
    extends UpdateMyProfileState {
  final String $id;
  final NullableStringFieldUpdateOperationsInput? $displayName;
  final NullableStringFieldUpdateOperationsInput? $phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? $dateOfBirth;
  final EnumGenderFieldUpdateOperationsInput? $gender;
  final JSONObject? $metadata;
  final LocationUpsertWithoutUsersInput? $location;
  final AttachmentUpdateOneWithoutUsersInput? $avator;
  final BusinessUpsertWithoutOwnerInput? $businessProfile;
  final UserResponse? data;
  final String? message;
  UpdateMyProfileBusinessProfileCreateValidationError(this.message, this.data,
      {required this.$id,
      this.$displayName,
      this.$phoneNumber,
      this.$dateOfBirth,
      this.$gender,
      this.$metadata,
      this.$location,
      this.$avator,
      this.$businessProfile});
  @override
  List<Object?> get props => [
        $id,
        $displayName,
        $phoneNumber,
        $dateOfBirth,
        $gender,
        $metadata,
        $location,
        $avator,
        $businessProfile,
        message,
        data
      ];
}
