part of 'find_business_orders_bloc.dart';

abstract class FindBusinessOrdersState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindBusinessOrdersState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersInitial extends FindBusinessOrdersState {
  @override
  List<Object?> get props => [];
}

class FindBusinessOrdersSuccess extends FindBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindBusinessOrdersSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersFailure extends FindBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindBusinessOrdersFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersInProgress extends FindBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindBusinessOrdersInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersOptimistic extends FindBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindBusinessOrdersOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOrdersError extends FindBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindBusinessOrdersError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
