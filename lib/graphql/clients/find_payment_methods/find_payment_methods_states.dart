part of 'find_payment_methods_bloc.dart';

abstract class FindPaymentMethodsState extends Equatable {
  final PaymentMethodListResponse? data;
  final String? message;
  FindPaymentMethodsState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsInitial extends FindPaymentMethodsState {
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsSuccess extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsFailure extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsInProgress extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsOptimistic extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsError extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsLoadMoreInProgress extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsLoadMoreInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsAllDataLoaded extends FindPaymentMethodsState {
  final PaymentMethodListResponse data;
  final String? message;
  FindPaymentMethodsAllDataLoaded({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
