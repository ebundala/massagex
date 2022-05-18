part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignupStarted extends SignupEvent {
  @override
  List<Object?> get props => [];
}

class SignupExcuted extends SignupEvent {
  final SignupInput credentials;
  SignupExcuted({required this.credentials});
  @override
  List<Object?> get props => [credentials];
}

class SignupIsLoading extends SignupEvent {
  final AuthResult data;
  SignupIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignupIsOptimistic extends SignupEvent {
  final AuthResult data;
  SignupIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignupIsConcrete extends SignupEvent {
  final AuthResult data;
  SignupIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignupErrored extends SignupEvent {
  final AuthResult data;
  final String message;
  SignupErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupFailed extends SignupEvent {
  final AuthResult data;
  final String message;
  SignupFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignupReseted extends SignupEvent {
  @override
  List<Object?> get props => [];
}

class SignupRefreshed extends SignupEvent {
  final SignupState data;
  SignupRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignupRetried extends SignupEvent {
  @override
  List<Object?> get props => [];
}
