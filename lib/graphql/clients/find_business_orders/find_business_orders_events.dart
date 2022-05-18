part of 'find_business_orders_bloc.dart';

abstract class FindBusinessOrdersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindBusinessOrdersStarted extends FindBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessOrdersExcuted extends FindBusinessOrdersEvent {
  FindBusinessOrdersExcuted();
  @override
  List<Object?> get props => [];
}

class FindBusinessOrdersIsLoading extends FindBusinessOrdersEvent {
  final UserResponse data;
  FindBusinessOrdersIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessOrdersIsOptimistic extends FindBusinessOrdersEvent {
  final UserResponse data;
  FindBusinessOrdersIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessOrdersIsConcrete extends FindBusinessOrdersEvent {
  final UserResponse data;
  FindBusinessOrdersIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessOrdersErrored extends FindBusinessOrdersEvent {
  final UserResponse data;
  final String message;
  FindBusinessOrdersErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersFailed extends FindBusinessOrdersEvent {
  final UserResponse data;
  final String message;
  FindBusinessOrdersFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersReseted extends FindBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessOrdersRefreshed extends FindBusinessOrdersEvent {
  final FindBusinessOrdersState data;
  FindBusinessOrdersRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessOrdersRetried extends FindBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}
