part of 'update_review_bloc.dart';

abstract class UpdateReviewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateReviewStarted extends UpdateReviewEvent {
  @override
  List<Object?> get props => [];
}

class UpdateReviewExcuted extends UpdateReviewEvent {
  final List<AttachmentCreateWithoutReviewsInput>? attachments;
  UpdateReviewExcuted({this.attachments});
  @override
  List<Object?> get props => [attachments];
}

class UpdateReviewIsLoading extends UpdateReviewEvent {
  final UserResponse data;
  UpdateReviewIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateReviewIsOptimistic extends UpdateReviewEvent {
  final UserResponse data;
  UpdateReviewIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateReviewIsConcrete extends UpdateReviewEvent {
  final UserResponse data;
  UpdateReviewIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateReviewErrored extends UpdateReviewEvent {
  final UserResponse data;
  final String message;
  UpdateReviewErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewFailed extends UpdateReviewEvent {
  final UserResponse data;
  final String message;
  UpdateReviewFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateReviewReseted extends UpdateReviewEvent {
  @override
  List<Object?> get props => [];
}

class UpdateReviewRefreshed extends UpdateReviewEvent {
  final UpdateReviewState data;
  UpdateReviewRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateReviewRetried extends UpdateReviewEvent {
  @override
  List<Object?> get props => [];
}
