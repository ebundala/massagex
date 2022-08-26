part of 'update_my_business_order_bloc.dart';

abstract class UpdateMyBusinessOrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessOrderStarted extends UpdateMyBusinessOrderEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessOrderExcuted extends UpdateMyBusinessOrderEvent {
  final String uid;
  final int? count;
  final List<OrderUpdateWithWhereUniqueWithoutBusinessInput> orders;
  UpdateMyBusinessOrderExcuted(
      {required this.uid, this.count, required this.orders});
  @override
  List<Object?> get props => [uid, count, orders];
}

class UpdateMyBusinessOrderIsLoading extends UpdateMyBusinessOrderEvent {
  final UserResponse data;
  UpdateMyBusinessOrderIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessOrderIsOptimistic extends UpdateMyBusinessOrderEvent {
  final UserResponse data;
  UpdateMyBusinessOrderIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessOrderIsConcrete extends UpdateMyBusinessOrderEvent {
  final UserResponse data;
  UpdateMyBusinessOrderIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessOrderErrored extends UpdateMyBusinessOrderEvent {
  final UserResponse data;
  final String message;
  UpdateMyBusinessOrderErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderFailed extends UpdateMyBusinessOrderEvent {
  final UserResponse data;
  final String message;
  UpdateMyBusinessOrderFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderReseted extends UpdateMyBusinessOrderEvent {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessOrderRefreshed extends UpdateMyBusinessOrderEvent {
  final UpdateMyBusinessOrderState data;
  UpdateMyBusinessOrderRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateMyBusinessOrderRetried extends UpdateMyBusinessOrderEvent {
  @override
  List<Object?> get props => [];
}
