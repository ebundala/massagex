part of 'update_my_business_profile_bloc.dart';

abstract class UpdateMyBusinessProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessProfileStarted extends UpdateMyBusinessProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessProfileExcuted extends UpdateMyBusinessProfileEvent {
  final String id;
  final StringFieldUpdateOperationsInput? about;
  final StringFieldUpdateOperationsInput? businessName;
  final JSONObject? metadata;
  final LocationUpdateWithoutBusinessesInput? location;
  final EnumBusinessModeFieldUpdateOperationsInput? mode;
  final AttachmentCreateWithoutBusinessesInput? cover;
  final List<AttachmentCreateWithoutBusinessInput>? gallery;
  final List<AttachmentWhereUniqueInput>? deletedAttachments;
  UpdateMyBusinessProfileExcuted(
      {required this.id,
      this.about,
      this.businessName,
      this.metadata,
      this.location,
      this.mode,
      this.cover,
      this.gallery,
      this.deletedAttachments});
  @override
  List<Object?> get props => [
        id,
        about,
        businessName,
        metadata,
        location,
        mode,
        cover,
        gallery,
        deletedAttachments
      ];
}

class UpdateMyBusinessProfileIsLoading extends UpdateMyBusinessProfileEvent {
  final UserResponse data;
  UpdateMyBusinessProfileIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessProfileIsOptimistic extends UpdateMyBusinessProfileEvent {
  final UserResponse data;
  UpdateMyBusinessProfileIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessProfileIsConcrete extends UpdateMyBusinessProfileEvent {
  final UserResponse data;
  UpdateMyBusinessProfileIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessProfileErrored extends UpdateMyBusinessProfileEvent {
  final UserResponse data;
  final String message;
  UpdateMyBusinessProfileErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileFailed extends UpdateMyBusinessProfileEvent {
  final UserResponse data;
  final String message;
  UpdateMyBusinessProfileFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessProfileReseted extends UpdateMyBusinessProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessProfileRefreshed extends UpdateMyBusinessProfileEvent {
  final UpdateMyBusinessProfileState data;
  UpdateMyBusinessProfileRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessProfileRetried extends UpdateMyBusinessProfileEvent {
  @override
  List<Object?> get props => [];
}
