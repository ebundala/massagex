part of 'update_my_profile_bloc.dart';

abstract class UpdateMyProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateMyProfileStarted extends UpdateMyProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyProfileExcuted extends UpdateMyProfileEvent {
  final String id;
  final StringFieldUpdateOperationsInput? displayName;
  final NullableStringFieldUpdateOperationsInput? phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? dateOfBirth;
  final EnumGenderFieldUpdateOperationsInput? gender;
  final JSONObject? metadata;
  final LocationUpdateWithoutUsersInput? location;
  final AttachmentUpdateOneWithoutUsersInput? avator;
  UpdateMyProfileExcuted(
      {required this.id,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.metadata,
      this.location,
      this.avator});
  @override
  List<Object?> get props => [
        id,
        displayName,
        phoneNumber,
        dateOfBirth,
        gender,
        metadata,
        location,
        avator
      ];
}

class UpdateMyProfileIsLoading extends UpdateMyProfileEvent {
  final UserResponse data;
  UpdateMyProfileIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyProfileIsOptimistic extends UpdateMyProfileEvent {
  final UserResponse data;
  UpdateMyProfileIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyProfileIsConcrete extends UpdateMyProfileEvent {
  final UserResponse data;
  UpdateMyProfileIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyProfileErrored extends UpdateMyProfileEvent {
  final UserResponse data;
  final String message;
  UpdateMyProfileErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileFailed extends UpdateMyProfileEvent {
  final UserResponse data;
  final String message;
  UpdateMyProfileFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyProfileReseted extends UpdateMyProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyProfileRefreshed extends UpdateMyProfileEvent {
  final UpdateMyProfileState data;
  UpdateMyProfileRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyProfileRetried extends UpdateMyProfileEvent {
  @override
  List<Object?> get props => [];
}
