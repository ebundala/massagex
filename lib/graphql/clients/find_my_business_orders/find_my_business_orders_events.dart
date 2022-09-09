part of 'find_my_business_orders_bloc.dart';

abstract class FindMyBusinessOrdersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessOrdersStarted extends FindMyBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessOrdersExcuted extends FindMyBusinessOrdersEvent {
  final String uid;
  final OrderWhereInput? where;
  final List<OrderOrderByInput>? orderBy;
  final int? take;
  final int? skip;
  FindMyBusinessOrdersExcuted(
      {required this.uid, this.where, this.orderBy, this.take, this.skip});
  @override
  List<Object?> get props => [uid, where, orderBy, take, skip];
}

class FindMyBusinessOrdersIsLoading extends FindMyBusinessOrdersEvent {
  final UserResponse data;
  FindMyBusinessOrdersIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessOrdersIsOptimistic extends FindMyBusinessOrdersEvent {
  final UserResponse data;
  FindMyBusinessOrdersIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessOrdersIsConcrete extends FindMyBusinessOrdersEvent {
  final UserResponse data;
  FindMyBusinessOrdersIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessOrdersErrored extends FindMyBusinessOrdersEvent {
  final UserResponse data;
  final String message;
  FindMyBusinessOrdersErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersFailed extends FindMyBusinessOrdersEvent {
  final UserResponse data;
  final String message;
  FindMyBusinessOrdersFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersReseted extends FindMyBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessOrdersRefreshed extends FindMyBusinessOrdersEvent {
  final FindMyBusinessOrdersState data;
  FindMyBusinessOrdersRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessOrdersRetried extends FindMyBusinessOrdersEvent {
  @override
  List<Object?> get props => [];
}
