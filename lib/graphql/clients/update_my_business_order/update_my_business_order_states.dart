part of 'update_my_business_order_bloc.dart';

abstract class UpdateMyBusinessOrderState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessOrderState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderInitial extends UpdateMyBusinessOrderState {
  @override
  List<Object?> get props => [];
}

class UpdateMyBusinessOrderSuccess extends UpdateMyBusinessOrderState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessOrderSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderFailure extends UpdateMyBusinessOrderState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessOrderFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderInProgress extends UpdateMyBusinessOrderState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessOrderInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderOptimistic extends UpdateMyBusinessOrderState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessOrderOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderError extends UpdateMyBusinessOrderState {
  final UserResponse data;
  final String? message;
  UpdateMyBusinessOrderError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateMyBusinessOrderOrdersWhereValidationError
    extends UpdateMyBusinessOrderState {
  final String $uid;
  final int? $count;
  final List<OrderUpdateWithWhereUniqueWithoutBusinessInput> $orders;
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessOrderOrdersWhereValidationError(this.message, this.data,
      {required this.$uid, this.$count, required this.$orders});
  @override
  List<Object?> get props => [$uid, $count, $orders, message, data];
}

class UpdateMyBusinessOrderOrdersDataValidationError
    extends UpdateMyBusinessOrderState {
  final String $uid;
  final int? $count;
  final List<OrderUpdateWithWhereUniqueWithoutBusinessInput> $orders;
  final UserResponse? data;
  final String? message;
  UpdateMyBusinessOrderOrdersDataValidationError(this.message, this.data,
      {required this.$uid, this.$count, required this.$orders});
  @override
  List<Object?> get props => [$uid, $count, $orders, message, data];
}
