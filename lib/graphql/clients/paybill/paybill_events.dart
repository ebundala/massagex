part of 'paybill_bloc.dart';

abstract class PaybillEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaybillStarted extends PaybillEvent {
  @override
  List<Object?> get props => [];
}

class PaybillExcuted extends PaybillEvent {
  final PaybillRequest data;
  PaybillExcuted({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaybillIsLoading extends PaybillEvent {
  final PaybillResponse data;
  PaybillIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaybillIsOptimistic extends PaybillEvent {
  final PaybillResponse data;
  PaybillIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaybillIsConcrete extends PaybillEvent {
  final PaybillResponse data;
  PaybillIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaybillErrored extends PaybillEvent {
  final PaybillResponse data;
  final String message;
  PaybillErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillFailed extends PaybillEvent {
  final PaybillResponse data;
  final String message;
  PaybillFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class PaybillReseted extends PaybillEvent {
  @override
  List<Object?> get props => [];
}

class PaybillRefreshed extends PaybillEvent {
  final PaybillState data;
  PaybillRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaybillRetried extends PaybillEvent {
  @override
  List<Object?> get props => [];
}
