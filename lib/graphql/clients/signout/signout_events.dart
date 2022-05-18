part of 'signout_bloc.dart';

abstract class SignoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignoutStarted extends SignoutEvent {
  @override
  List<Object?> get props => [];
}

class SignoutExcuted extends SignoutEvent {
  SignoutExcuted();
  @override
  List<Object?> get props => [];
}

class SignoutIsLoading extends SignoutEvent {
  final SignOutResult data;
  SignoutIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignoutIsOptimistic extends SignoutEvent {
  final SignOutResult data;
  SignoutIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignoutIsConcrete extends SignoutEvent {
  final SignOutResult data;
  SignoutIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignoutErrored extends SignoutEvent {
  final SignOutResult data;
  final String message;
  SignoutErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutFailed extends SignoutEvent {
  final SignOutResult data;
  final String message;
  SignoutFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class SignoutReseted extends SignoutEvent {
  @override
  List<Object?> get props => [];
}

class SignoutRefreshed extends SignoutEvent {
  final SignoutState data;
  SignoutRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class SignoutRetried extends SignoutEvent {
  @override
  List<Object?> get props => [];
}
