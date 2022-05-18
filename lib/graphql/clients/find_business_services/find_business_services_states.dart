part of 'find_business_services_bloc.dart';

abstract class FindBusinessServicesState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindBusinessServicesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesInitial extends FindBusinessServicesState {
  @override
  List<Object?> get props => [];
}

class FindBusinessServicesSuccess extends FindBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindBusinessServicesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesFailure extends FindBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindBusinessServicesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesInProgress extends FindBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindBusinessServicesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesOptimistic extends FindBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindBusinessServicesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesError extends FindBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindBusinessServicesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
