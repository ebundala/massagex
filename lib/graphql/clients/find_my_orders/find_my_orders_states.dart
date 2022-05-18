part of 'find_my_orders_bloc.dart';

abstract class FindMyOrdersState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindMyOrdersState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersInitial extends FindMyOrdersState {
  @override
  List<Object?> get props => [];
}

class FindMyOrdersSuccess extends FindMyOrdersState {
  final UserResponse data;
  final String? message;
  FindMyOrdersSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersFailure extends FindMyOrdersState {
  final UserResponse data;
  final String? message;
  FindMyOrdersFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersInProgress extends FindMyOrdersState {
  final UserResponse data;
  final String? message;
  FindMyOrdersInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersOptimistic extends FindMyOrdersState {
  final UserResponse data;
  final String? message;
  FindMyOrdersOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyOrdersError extends FindMyOrdersState {
  final UserResponse data;
  final String? message;
  FindMyOrdersError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
