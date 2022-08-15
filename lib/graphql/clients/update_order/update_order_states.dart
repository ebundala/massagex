part of 'update_order_bloc.dart';

abstract class UpdateOrderState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateOrderState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderInitial extends UpdateOrderState {
  @override
  List<Object?> get props => [];
}

class UpdateOrderSuccess extends UpdateOrderState {
  final UserResponse data;
  final String? message;
  UpdateOrderSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderFailure extends UpdateOrderState {
  final UserResponse data;
  final String? message;
  UpdateOrderFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderInProgress extends UpdateOrderState {
  final UserResponse data;
  final String? message;
  UpdateOrderInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderOptimistic extends UpdateOrderState {
  final UserResponse data;
  final String? message;
  UpdateOrderOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderError extends UpdateOrderState {
  final UserResponse data;
  final String? message;
  UpdateOrderError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateOrderOrdersWhereValidationError extends UpdateOrderState {
  final String $uid;
  final int? $count;
  final List<OrderUpdateWithWhereUniqueWithoutOwnerInput> $orders;
  final UserResponse? data;
  final String? message;
  UpdateOrderOrdersWhereValidationError(this.message, this.data,
      {required this.$uid, this.$count, required this.$orders});
  @override
  List<Object?> get props => [$uid, $count, $orders, message, data];
}

class UpdateOrderOrdersDataValidationError extends UpdateOrderState {
  final String $uid;
  final int? $count;
  final List<OrderUpdateWithWhereUniqueWithoutOwnerInput> $orders;
  final UserResponse? data;
  final String? message;
  UpdateOrderOrdersDataValidationError(this.message, this.data,
      {required this.$uid, this.$count, required this.$orders});
  @override
  List<Object?> get props => [$uid, $count, $orders, message, data];
}
