part of 'update_order_bloc.dart';

abstract class UpdateOrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateOrderStarted extends UpdateOrderEvent {
  @override
  List<Object?> get props => [];
}

class UpdateOrderExcuted extends UpdateOrderEvent {
  UpdateOrderExcuted();
  @override
  List<Object?> get props => [];
}

class UpdateOrderIsLoading extends UpdateOrderEvent {
  final UserResponse data;
  UpdateOrderIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateOrderIsOptimistic extends UpdateOrderEvent {
  final UserResponse data;
  UpdateOrderIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateOrderIsConcrete extends UpdateOrderEvent {
  final UserResponse data;
  UpdateOrderIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateOrderErrored extends UpdateOrderEvent {
  final UserResponse data;
  final String message;
  UpdateOrderErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderFailed extends UpdateOrderEvent {
  final UserResponse data;
  final String message;
  UpdateOrderFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderReseted extends UpdateOrderEvent {
  @override
  List<Object?> get props => [];
}

class UpdateOrderRefreshed extends UpdateOrderEvent {
  final UpdateOrderState data;
  UpdateOrderRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateOrderRetried extends UpdateOrderEvent {
  @override
  List<Object?> get props => [];
}
