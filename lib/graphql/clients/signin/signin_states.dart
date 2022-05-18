part of 'signin_bloc.dart';

abstract class SigninState extends Equatable {
  final AuthResult? data;
  final String? message;
  SigninState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninInitial extends SigninState {
  @override
  List<Object?> get props => [];
}

class SigninSuccess extends SigninState {
  final AuthResult data;
  final String? message;
  SigninSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninFailure extends SigninState {
  final AuthResult data;
  final String? message;
  SigninFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninInProgress extends SigninState {
  final AuthResult data;
  final String? message;
  SigninInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninOptimistic extends SigninState {
  final AuthResult data;
  final String? message;
  SigninOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninError extends SigninState {
  final AuthResult data;
  final String? message;
  SigninError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninCredentialsEmailValidationError extends SigninState {
  final AuthInput $credentials;
  final AuthResult? data;
  final String? message;
  SigninCredentialsEmailValidationError(this.message, this.data,
      {required this.$credentials});
  @override
  List<Object?> get props => [$credentials, message, data];
}

class SigninCredentialsPasswordValidationError extends SigninState {
  final AuthInput $credentials;
  final AuthResult? data;
  final String? message;
  SigninCredentialsPasswordValidationError(this.message, this.data,
      {required this.$credentials});
  @override
  List<Object?> get props => [$credentials, message, data];
}
