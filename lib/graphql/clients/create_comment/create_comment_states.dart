part of 'create_comment_bloc.dart';

abstract class CreateCommentState extends Equatable {
  final UserResponse? data;
  final String? message;
  CreateCommentState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentInitial extends CreateCommentState {
  @override
  List<Object?> get props => [];
}

class CreateCommentSuccess extends CreateCommentState {
  final UserResponse data;
  final String? message;
  CreateCommentSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentFailure extends CreateCommentState {
  final UserResponse data;
  final String? message;
  CreateCommentFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentInProgress extends CreateCommentState {
  final UserResponse data;
  final String? message;
  CreateCommentInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentOptimistic extends CreateCommentState {
  final UserResponse data;
  final String? message;
  CreateCommentOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentError extends CreateCommentState {
  final UserResponse data;
  final String? message;
  CreateCommentError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentAttachmentsPathValidationError extends CreateCommentState {
  final List<AttachmentCreateWithoutCommentInput>? $attachments;
  final UserResponse? data;
  final String? message;
  CreateCommentAttachmentsPathValidationError(this.message, this.data,
      {this.$attachments});
  @override
  List<Object?> get props => [$attachments, message, data];
}
