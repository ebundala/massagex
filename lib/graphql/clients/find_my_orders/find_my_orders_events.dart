part of 'find_my_orders_bloc.dart';

abstract class FindMyOrdersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindMyOrdersStarted extends FindMyOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindMyOrdersExcuted extends FindMyOrdersEvent {
  final String uid;
  final OrderWhereInput? where;
  final int? skip;
  final int? take;
  FindMyOrdersExcuted({required this.uid, this.where, this.skip, this.take});
  @override
  List<Object?> get props => [uid, where, skip, take];
}

class FindMyOrdersIsLoading extends FindMyOrdersEvent {
  final UserResponse data;
  FindMyOrdersIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyOrdersIsOptimistic extends FindMyOrdersEvent {
  final UserResponse data;
  FindMyOrdersIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyOrdersIsConcrete extends FindMyOrdersEvent {
  final UserResponse data;
  FindMyOrdersIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyOrdersErrored extends FindMyOrdersEvent {
  final UserResponse data;
  final String message;
  FindMyOrdersErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersFailed extends FindMyOrdersEvent {
  final UserResponse data;
  final String message;
  FindMyOrdersFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersReseted extends FindMyOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindMyOrdersRefreshed extends FindMyOrdersEvent {
  final FindMyOrdersState data;
  FindMyOrdersRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyOrdersRetried extends FindMyOrdersEvent {
  @override
  List<Object?> get props => [];
}
