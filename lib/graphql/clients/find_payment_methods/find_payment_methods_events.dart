part of 'find_payment_methods_bloc.dart';

abstract class FindPaymentMethodsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsStarted extends FindPaymentMethodsEvent {
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsExcuted extends FindPaymentMethodsEvent {
  FindPaymentMethodsExcuted();
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsIsLoading extends FindPaymentMethodsEvent {
  final PaymentMethodListResponse data;
  FindPaymentMethodsIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindPaymentMethodsIsOptimistic extends FindPaymentMethodsEvent {
  final PaymentMethodListResponse data;
  FindPaymentMethodsIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindPaymentMethodsIsConcrete extends FindPaymentMethodsEvent {
  final PaymentMethodListResponse data;
  FindPaymentMethodsIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindPaymentMethodsErrored extends FindPaymentMethodsEvent {
  final PaymentMethodListResponse data;
  final String message;
  FindPaymentMethodsErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsFailed extends FindPaymentMethodsEvent {
  final PaymentMethodListResponse data;
  final String message;
  FindPaymentMethodsFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindPaymentMethodsReseted extends FindPaymentMethodsEvent {
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsRefreshed extends FindPaymentMethodsEvent {
  final FindPaymentMethodsState data;
  FindPaymentMethodsRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindPaymentMethodsMoreLoaded extends FindPaymentMethodsEvent {
  FindPaymentMethodsMoreLoaded();
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsStreamEnded extends FindPaymentMethodsEvent {
  @override
  List<Object?> get props => [];
}

class FindPaymentMethodsRetried extends FindPaymentMethodsEvent {
  @override
  List<Object?> get props => [];
}
