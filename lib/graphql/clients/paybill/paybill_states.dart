part of 'paybill_bloc.dart';

abstract class PaybillState extends Equatable {
  final PaybillResponse? data;
  final String? message;
  PaybillState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillInitial extends PaybillState {
  @override
  List<Object?> get props => [];
}

class PaybillSuccess extends PaybillState {
  final PaybillResponse data;
  final String? message;
  PaybillSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillFailure extends PaybillState {
  final PaybillResponse data;
  final String? message;
  PaybillFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillInProgress extends PaybillState {
  final PaybillResponse data;
  final String? message;
  PaybillInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillOptimistic extends PaybillState {
  final PaybillResponse data;
  final String? message;
  PaybillOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillError extends PaybillState {
  final PaybillResponse data;
  final String? message;
  PaybillError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillDataMsisdnValidationError extends PaybillState {
  final PaybillRequest $data;
  final PaybillResponse? data;
  final String? message;
  PaybillDataMsisdnValidationError(this.message, this.data,
      {required this.$data});
  @override
  List<Object?> get props => [$data, message, data];
}

class PaybillDataOrderIdValidationError extends PaybillState {
  final PaybillRequest $data;
  final PaybillResponse? data;
  final String? message;
  PaybillDataOrderIdValidationError(this.message, this.data,
      {required this.$data});
  @override
  List<Object?> get props => [$data, message, data];
}
