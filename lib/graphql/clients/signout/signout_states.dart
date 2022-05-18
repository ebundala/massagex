part of 'signout_bloc.dart';

abstract class SignoutState extends Equatable {
  final SignOutResult? data;
  final String? message;
  SignoutState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutInitial extends SignoutState {
  @override
  List<Object?> get props => [];
}

class SignoutSuccess extends SignoutState {
  final SignOutResult data;
  final String? message;
  SignoutSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutFailure extends SignoutState {
  final SignOutResult data;
  final String? message;
  SignoutFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutInProgress extends SignoutState {
  final SignOutResult data;
  final String? message;
  SignoutInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutOptimistic extends SignoutState {
  final SignOutResult data;
  final String? message;
  SignoutOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutError extends SignoutState {
  final SignOutResult data;
  final String? message;
  SignoutError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
