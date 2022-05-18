part of 'update_comment_bloc.dart';

abstract class UpdateCommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateCommentStarted extends UpdateCommentEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCommentExcuted extends UpdateCommentEvent {
  final List<AttachmentCreateWithoutCommentInput>? attachments;
  UpdateCommentExcuted({this.attachments});
  @override
  List<Object?> get props => [attachments];
}

class UpdateCommentIsLoading extends UpdateCommentEvent {
  final UserResponse data;
  UpdateCommentIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateCommentIsOptimistic extends UpdateCommentEvent {
  final UserResponse data;
  UpdateCommentIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateCommentIsConcrete extends UpdateCommentEvent {
  final UserResponse data;
  UpdateCommentIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateCommentErrored extends UpdateCommentEvent {
  final UserResponse data;
  final String message;
  UpdateCommentErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentFailed extends UpdateCommentEvent {
  final UserResponse data;
  final String message;
  UpdateCommentFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateCommentReseted extends UpdateCommentEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCommentRefreshed extends UpdateCommentEvent {
  final UpdateCommentState data;
  UpdateCommentRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateCommentRetried extends UpdateCommentEvent {
  @override
  List<Object?> get props => [];
}
