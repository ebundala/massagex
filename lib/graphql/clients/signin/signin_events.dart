part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SigninStarted extends SigninEvent {
  @override
  List<Object?> get props => [];
}

class SigninExcuted extends SigninEvent {
  final AuthInput credentials;
  SigninExcuted({required this.credentials});
  @override
  List<Object?> get props => [credentials];
}

class SigninIsLoading extends SigninEvent {
  final AuthResult data;
  SigninIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class SigninIsOptimistic extends SigninEvent {
  final AuthResult data;
  SigninIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class SigninIsConcrete extends SigninEvent {
  final AuthResult data;
  SigninIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class SigninErrored extends SigninEvent {
  final AuthResult data;
  final String message;
  SigninErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninFailed extends SigninEvent {
  final AuthResult data;
  final String message;
  SigninFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SigninReseted extends SigninEvent {
  @override
  List<Object?> get props => [];
}

class SigninRefreshed extends SigninEvent {
  final SigninState data;
  SigninRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class SigninRetried extends SigninEvent {
  @override
  List<Object?> get props => [];
}
