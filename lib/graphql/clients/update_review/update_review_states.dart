part of 'update_review_bloc.dart';

abstract class UpdateReviewState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateReviewState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewInitial extends UpdateReviewState {
  @override
  List<Object?> get props => [];
}

class UpdateReviewSuccess extends UpdateReviewState {
  final UserResponse data;
  final String? message;
  UpdateReviewSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewFailure extends UpdateReviewState {
  final UserResponse data;
  final String? message;
  UpdateReviewFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewInProgress extends UpdateReviewState {
  final UserResponse data;
  final String? message;
  UpdateReviewInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewOptimistic extends UpdateReviewState {
  final UserResponse data;
  final String? message;
  UpdateReviewOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewError extends UpdateReviewState {
  final UserResponse data;
  final String? message;
  UpdateReviewError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewAttachmentsPathValidationError extends UpdateReviewState {
  final List<AttachmentCreateWithoutReviewsInput>? $attachments;
  final UserResponse? data;
  final String? message;
  UpdateReviewAttachmentsPathValidationError(this.message, this.data,
      {this.$attachments});
  @override
  List<Object?> get props => [$attachments, message, data];
}
