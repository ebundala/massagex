part of 'update_my_business_profile_bloc.dart';

abstract class UpdateMyBusinessProfileState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessProfileState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileInitial extends UpdateMyBusinessProfileState {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessProfileSuccess extends UpdateMyBusinessProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessProfileSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileFailure extends UpdateMyBusinessProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessProfileFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileInProgress extends UpdateMyBusinessProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessProfileInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileOptimistic extends UpdateMyBusinessProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessProfileOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileError extends UpdateMyBusinessProfileState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessProfileError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileCoverPathValidationError
    extends UpdateMyBusinessProfileState {
  final String $id;
  final StringFieldUpdateOperationsInput? $about;
  final StringFieldUpdateOperationsInput? $businessName;
  final JSONObject? $metadata;
  final EnumBusinessStatusFieldUpdateOperationsInput? $status;
  final LocationUpdateWithoutBusinessesInput? $location;
  final EnumBusinessModeFieldUpdateOperationsInput? $mode;
  final AttachmentCreateWithoutBusinessesInput? $cover;
  final List<AttachmentCreateWithoutBusinessInput>? $gallery;
  final List<AttachmentWhereUniqueInput>? $deletedAttachments;
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessProfileCoverPathValidationError(this.message, this.data,
      {required this.$id,
      this.$about,
      this.$businessName,
      this.$metadata,
      this.$status,
      this.$location,
      this.$mode,
      this.$cover,
      this.$gallery,
      this.$deletedAttachments});
  @override
  List<Object?> get props => [
        $id,
        $about,
        $businessName,
        $metadata,
        $status,
        $location,
        $mode,
        $cover,
        $gallery,
        $deletedAttachments,
        message,
        data
      ];
}

class UpdateMyBusinessProfileGalleryPathValidationError
    extends UpdateMyBusinessProfileState {
  final String $id;
  final StringFieldUpdateOperationsInput? $about;
  final StringFieldUpdateOperationsInput? $businessName;
  final JSONObject? $metadata;
  final EnumBusinessStatusFieldUpdateOperationsInput? $status;
  final LocationUpdateWithoutBusinessesInput? $location;
  final EnumBusinessModeFieldUpdateOperationsInput? $mode;
  final AttachmentCreateWithoutBusinessesInput? $cover;
  final List<AttachmentCreateWithoutBusinessInput>? $gallery;
  final List<AttachmentWhereUniqueInput>? $deletedAttachments;
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessProfileGalleryPathValidationError(this.message, this.data,
      {required this.$id,
      this.$about,
      this.$businessName,
      this.$metadata,
      this.$status,
      this.$location,
      this.$mode,
      this.$cover,
      this.$gallery,
      this.$deletedAttachments});
  @override
  List<Object?> get props => [
        $id,
        $about,
        $businessName,
        $metadata,
        $status,
        $location,
        $mode,
        $cover,
        $gallery,
        $deletedAttachments,
        message,
        data
      ];
}
