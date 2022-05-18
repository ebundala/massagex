part of 'find_user_bloc.dart';

abstract class FindUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindUserStarted extends FindUserEvent {
  @override
  List<Object?> get props => [];
}

class FindUserExcuted extends FindUserEvent {
  final String id;
  FindUserExcuted({required this.id});
  @override
  List<Object?> get props => [id];
}

class FindUserIsLoading extends FindUserEvent {
  final UserResponse data;
  FindUserIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindUserIsOptimistic extends FindUserEvent {
  final UserResponse data;
  FindUserIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindUserIsConcrete extends FindUserEvent {
  final UserResponse data;
  FindUserIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindUserErrored extends FindUserEvent {
  final UserResponse data;
  final String message;
  FindUserErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserFailed extends FindUserEvent {
  final UserResponse data;
  final String message;
  FindUserFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserReseted extends FindUserEvent {
  @override
  List<Object?> get props => [];
}

class FindUserRefreshed extends FindUserEvent {
  final FindUserState data;
  FindUserRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindUserRetried extends FindUserEvent {
  @override
  List<Object?> get props => [];
}
