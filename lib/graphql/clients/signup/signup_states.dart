part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  final AuthResult? data;
  final String? message;
  SignupState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {
  final AuthResult data;
  final String? message;
  SignupSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupFailure extends SignupState {
  final AuthResult data;
  final String? message;
  SignupFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupInProgress extends SignupState {
  final AuthResult data;
  final String? message;
  SignupInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupOptimistic extends SignupState {
  final AuthResult data;
  final String? message;
  SignupOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupError extends SignupState {
  final AuthResult data;
  final String? message;
  SignupError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupCredentialsEmailValidationError extends SignupState {
  final SignupInput $credentials;
  final AuthResult? data;
  final String? message;
  SignupCredentialsEmailValidationError(this.message, this.data,
      {required this.$credentials});
  @override
  List<Object?> get props => [$credentials, message, data];
}

class SignupCredentialsPasswordValidationError extends SignupState {
  final SignupInput $credentials;
  final AuthResult? data;
  final String? message;
  SignupCredentialsPasswordValidationError(this.message, this.data,
      {required this.$credentials});
  @override
  List<Object?> get props => [$credentials, message, data];
}

class SignupCredentialsDisplayNameValidationError extends SignupState {
  final SignupInput $credentials;
  final AuthResult? data;
  final String? message;
  SignupCredentialsDisplayNameValidationError(this.message, this.data,
      {required this.$credentials});
  @override
  List<Object?> get props => [$credentials, message, data];
}
