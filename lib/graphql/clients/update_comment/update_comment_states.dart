part of 'update_comment_bloc.dart';

abstract class UpdateCommentState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateCommentState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentInitial extends UpdateCommentState {
  @override
  List<Object?> get props => [];
}

class UpdateCommentSuccess extends UpdateCommentState {
  final UserResponse data;
  final String? message;
  UpdateCommentSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentFailure extends UpdateCommentState {
  final UserResponse data;
  final String? message;
  UpdateCommentFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentInProgress extends UpdateCommentState {
  final UserResponse data;
  final String? message;
  UpdateCommentInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentOptimistic extends UpdateCommentState {
  final UserResponse data;
  final String? message;
  UpdateCommentOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentError extends UpdateCommentState {
  final UserResponse data;
  final String? message;
  UpdateCommentError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentAttachmentsPathValidationError extends UpdateCommentState {
  final List<AttachmentCreateWithoutCommentInput>? $attachments;
  final UserResponse? data;
  final String? message;
  UpdateCommentAttachmentsPathValidationError(this.message, this.data,
      {this.$attachments});
  @override
  List<Object?> get props => [$attachments, message, data];
}
