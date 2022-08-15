part of 'create_order_bloc.dart';

abstract class CreateOrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateOrderStarted extends CreateOrderEvent {
  @override
  List<Object?> get props => [];
}

class CreateOrderExcuted extends CreateOrderEvent {
  final String uid;
  final int count;
  final List<OrderCreateWithoutOwnerInput> orders;
  CreateOrderExcuted(
      {required this.uid, required this.count, required this.orders});
  @override
  List<Object?> get props => [uid, count, orders];
}

class CreateOrderIsLoading extends CreateOrderEvent {
  final UserResponse data;
  CreateOrderIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateOrderIsOptimistic extends CreateOrderEvent {
  final UserResponse data;
  CreateOrderIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateOrderIsConcrete extends CreateOrderEvent {
  final UserResponse data;
  CreateOrderIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateOrderErrored extends CreateOrderEvent {
  final UserResponse data;
  final String message;
  CreateOrderErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderFailed extends CreateOrderEvent {
  final UserResponse data;
  final String message;
  CreateOrderFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderReseted extends CreateOrderEvent {
  @override
  List<Object?> get props => [];
}

class CreateOrderRefreshed extends CreateOrderEvent {
  final CreateOrderState data;
  CreateOrderRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateOrderRetried extends CreateOrderEvent {
  @override
  List<Object?> get props => [];
}
