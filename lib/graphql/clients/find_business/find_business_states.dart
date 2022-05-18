part of 'find_business_bloc.dart';

abstract class FindBusinessState extends Equatable {
  final BusinessResponse? data;
  final String? message;
  FindBusinessState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessInitial extends FindBusinessState {
  @override
  List<Object?> get props => [];
}

class FindBusinessSuccess extends FindBusinessState {
  final BusinessResponse data;
  final String? message;
  FindBusinessSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessFailure extends FindBusinessState {
  final BusinessResponse data;
  final String? message;
  FindBusinessFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessInProgress extends FindBusinessState {
  final BusinessResponse data;
  final String? message;
  FindBusinessInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessOptimistic extends FindBusinessState {
  final BusinessResponse data;
  final String? message;
  FindBusinessOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessError extends FindBusinessState {
  final BusinessResponse data;
  final String? message;
  FindBusinessError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
