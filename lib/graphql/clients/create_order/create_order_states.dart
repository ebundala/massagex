part of 'create_order_bloc.dart';

abstract class CreateOrderState extends Equatable {
  final UserResponse? data;
  final String? message;
  CreateOrderState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderInitial extends CreateOrderState {
  @override
  List<Object?> get props => [];
}

class CreateOrderSuccess extends CreateOrderState {
  final UserResponse data;
  final String? message;
  CreateOrderSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderFailure extends CreateOrderState {
  final UserResponse data;
  final String? message;
  CreateOrderFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderInProgress extends CreateOrderState {
  final UserResponse data;
  final String? message;
  CreateOrderInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderOptimistic extends CreateOrderState {
  final UserResponse data;
  final String? message;
  CreateOrderOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateOrderError extends CreateOrderState {
  final UserResponse data;
  final String? message;
  CreateOrderError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
