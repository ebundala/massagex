part of 'create_review_bloc.dart';

abstract class CreateReviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateReviewStarted extends CreateReviewEvent {
  @override
  List<Object?> get props => [];
}

class CreateReviewExcuted extends CreateReviewEvent {
  final List<AttachmentCreateWithoutReviewsInput>? attachments;
  CreateReviewExcuted({this.attachments});
  @override
  List<Object?> get props => [attachments];
}

class CreateReviewIsLoading extends CreateReviewEvent {
  final UserResponse data;
  CreateReviewIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateReviewIsOptimistic extends CreateReviewEvent {
  final UserResponse data;
  CreateReviewIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateReviewIsConcrete extends CreateReviewEvent {
  final UserResponse data;
  CreateReviewIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateReviewErrored extends CreateReviewEvent {
  final UserResponse data;
  final String message;
  CreateReviewErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewFailed extends CreateReviewEvent {
  final UserResponse data;
  final String message;
  CreateReviewFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateReviewReseted extends CreateReviewEvent {
  @override
  List<Object?> get props => [];
}

class CreateReviewRefreshed extends CreateReviewEvent {
  final CreateReviewState data;
  CreateReviewRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateReviewRetried extends CreateReviewEvent {
  @override
  List<Object?> get props => [];
}
