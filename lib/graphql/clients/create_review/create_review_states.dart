part of 'create_review_bloc.dart';

abstract class CreateReviewState extends Equatable {
  final UserResponse? data;
  final String? message;
  CreateReviewState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewInitial extends CreateReviewState {
  @override
  List<Object?> get props => [];
}

class CreateReviewSuccess extends CreateReviewState {
  final UserResponse data;
  final String? message;
  CreateReviewSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewFailure extends CreateReviewState {
  final UserResponse data;
  final String? message;
  CreateReviewFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewInProgress extends CreateReviewState {
  final UserResponse data;
  final String? message;
  CreateReviewInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewOptimistic extends CreateReviewState {
  final UserResponse data;
  final String? message;
  CreateReviewOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewError extends CreateReviewState {
  final UserResponse data;
  final String? message;
  CreateReviewError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewAttachmentsPathValidationError extends CreateReviewState {
  final List<AttachmentCreateWithoutReviewsInput>? $attachments;
  final UserResponse? data;
  final String? message;
  CreateReviewAttachmentsPathValidationError(this.message, this.data,
      {this.$attachments});
  @override
  List<Object?> get props => [$attachments, message, data];
}
