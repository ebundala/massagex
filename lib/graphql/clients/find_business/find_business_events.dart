part of 'find_business_bloc.dart';

abstract class FindBusinessEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindBusinessStarted extends FindBusinessEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessExcuted extends FindBusinessEvent {
  FindBusinessExcuted();
  @override
  List<Object?> get props => [];
}

class FindBusinessIsLoading extends FindBusinessEvent {
  final BusinessResponse data;
  FindBusinessIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessIsOptimistic extends FindBusinessEvent {
  final BusinessResponse data;
  FindBusinessIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessIsConcrete extends FindBusinessEvent {
  final BusinessResponse data;
  FindBusinessIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessErrored extends FindBusinessEvent {
  final BusinessResponse data;
  final String message;
  FindBusinessErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessFailed extends FindBusinessEvent {
  final BusinessResponse data;
  final String message;
  FindBusinessFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessReseted extends FindBusinessEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessRefreshed extends FindBusinessEvent {
  final FindBusinessState data;
  FindBusinessRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessRetried extends FindBusinessEvent {
  @override
  List<Object?> get props => [];
}
