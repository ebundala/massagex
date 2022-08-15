part of 'find_my_business_services_bloc.dart';

abstract class FindMyBusinessServicesState extends Equatable {
  final UserResponse? data;
  final String? message;
  FindMyBusinessServicesState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesInitial extends FindMyBusinessServicesState {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessServicesSuccess extends FindMyBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindMyBusinessServicesSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesFailure extends FindMyBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindMyBusinessServicesFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesInProgress extends FindMyBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindMyBusinessServicesInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesOptimistic extends FindMyBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindMyBusinessServicesOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesError extends FindMyBusinessServicesState {
  final UserResponse data;
  final String? message;
  FindMyBusinessServicesError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}
