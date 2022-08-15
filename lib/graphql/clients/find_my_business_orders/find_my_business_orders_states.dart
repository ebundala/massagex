part of 'find_my_business_orders_bloc.dart';

abstract class FindMyBusinessOrdersState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindMyBusinessOrdersState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersInitial extends FindMyBusinessOrdersState {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessOrdersSuccess extends FindMyBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindMyBusinessOrdersSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersFailure extends FindMyBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindMyBusinessOrdersFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersInProgress extends FindMyBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindMyBusinessOrdersInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersOptimistic extends FindMyBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindMyBusinessOrdersOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessOrdersError extends FindMyBusinessOrdersState {
  final UserResponse data;
  final String? message;
  FindMyBusinessOrdersError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
