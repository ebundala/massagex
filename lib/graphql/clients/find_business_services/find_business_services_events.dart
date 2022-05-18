part of 'find_business_services_bloc.dart';

abstract class FindBusinessServicesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindBusinessServicesStarted extends FindBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessServicesExcuted extends FindBusinessServicesEvent {
  FindBusinessServicesExcuted();
  @override
  List<Object?> get props => [];
}

class FindBusinessServicesIsLoading extends FindBusinessServicesEvent {
  final UserResponse data;
  FindBusinessServicesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessServicesIsOptimistic extends FindBusinessServicesEvent {
  final UserResponse data;
  FindBusinessServicesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessServicesIsConcrete extends FindBusinessServicesEvent {
  final UserResponse data;
  FindBusinessServicesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessServicesErrored extends FindBusinessServicesEvent {
  final UserResponse data;
  final String message;
  FindBusinessServicesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesFailed extends FindBusinessServicesEvent {
  final UserResponse data;
  final String message;
  FindBusinessServicesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindBusinessServicesReseted extends FindBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindBusinessServicesRefreshed extends FindBusinessServicesEvent {
  final FindBusinessServicesState data;
  FindBusinessServicesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindBusinessServicesRetried extends FindBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}
