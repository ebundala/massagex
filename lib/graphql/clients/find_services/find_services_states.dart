part of 'find_services_bloc.dart';

abstract class FindServicesState extends Equatable {
  final BusinessResponse? data;
  final String? message;
  FindServicesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesInitial extends FindServicesState {
  @override
  List<Object?> get props => [];
}

class FindServicesSuccess extends FindServicesState {
  final BusinessResponse data;
  final String? message;
  FindServicesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesFailure extends FindServicesState {
  final BusinessResponse data;
  final String? message;
  FindServicesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesInProgress extends FindServicesState {
  final BusinessResponse data;
  final String? message;
  FindServicesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesOptimistic extends FindServicesState {
  final BusinessResponse data;
  final String? message;
  FindServicesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesError extends FindServicesState {
  final BusinessResponse data;
  final String? message;
  FindServicesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
