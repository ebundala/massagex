part of 'find_user_bloc.dart';

abstract class FindUserState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindUserState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserInitial extends FindUserState {
  @override
  List<Object?> get props => [];
}

class FindUserSuccess extends FindUserState {
  final UserResponse data;
  final String? message;
  FindUserSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserFailure extends FindUserState {
  final UserResponse data;
  final String? message;
  FindUserFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserInProgress extends FindUserState {
  final UserResponse data;
  final String? message;
  FindUserInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserOptimistic extends FindUserState {
  final UserResponse data;
  final String? message;
  FindUserOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindUserError extends FindUserState {
  final UserResponse data;
  final String? message;
  FindUserError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
