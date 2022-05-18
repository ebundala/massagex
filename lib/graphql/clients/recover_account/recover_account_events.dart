part of 'recover_account_bloc.dart';

abstract class RecoverAccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecoverAccountStarted extends RecoverAccountEvent {
  @override
  List<Object?> get props => [];
}

class RecoverAccountExcuted extends RecoverAccountEvent {
  final String email;
  RecoverAccountExcuted({required this.email});
  @override
  List<Object?> get props => [email];
}

class RecoverAccountIsLoading extends RecoverAccountEvent {
  final AuthResult data;
  RecoverAccountIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class RecoverAccountIsOptimistic extends RecoverAccountEvent {
  final AuthResult data;
  RecoverAccountIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class RecoverAccountIsConcrete extends RecoverAccountEvent {
  final AuthResult data;
  RecoverAccountIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class RecoverAccountErrored extends RecoverAccountEvent {
  final AuthResult data;
  final String message;
  RecoverAccountErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountFailed extends RecoverAccountEvent {
  final AuthResult data;
  final String message;
  RecoverAccountFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RecoverAccountReseted extends RecoverAccountEvent {
  @override
  List<Object?> get props => [];
}

class RecoverAccountRefreshed extends RecoverAccountEvent {
  final RecoverAccountState data;
  RecoverAccountRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class RecoverAccountRetried extends RecoverAccountEvent {
  @override
  List<Object?> get props => [];
}
