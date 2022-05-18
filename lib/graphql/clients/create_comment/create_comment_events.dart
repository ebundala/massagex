part of 'create_comment_bloc.dart';

abstract class CreateCommentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateCommentStarted extends CreateCommentEvent {
  @override
  List<Object?> get props => [];
}

class CreateCommentExcuted extends CreateCommentEvent {
  final List<AttachmentCreateWithoutCommentInput>? attachments;
  CreateCommentExcuted({this.attachments});
  @override
  List<Object?> get props => [attachments];
}

class CreateCommentIsLoading extends CreateCommentEvent {
  final UserResponse data;
  CreateCommentIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateCommentIsOptimistic extends CreateCommentEvent {
  final UserResponse data;
  CreateCommentIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateCommentIsConcrete extends CreateCommentEvent {
  final UserResponse data;
  CreateCommentIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateCommentErrored extends CreateCommentEvent {
  final UserResponse data;
  final String message;
  CreateCommentErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentFailed extends CreateCommentEvent {
  final UserResponse data;
  final String message;
  CreateCommentFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateCommentReseted extends CreateCommentEvent {
  @override
  List<Object?> get props => [];
}

class CreateCommentRefreshed extends CreateCommentEvent {
  final CreateCommentState data;
  CreateCommentRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateCommentRetried extends CreateCommentEvent {
  @override
  List<Object?> get props => [];
}
