part of 'find_my_business_services_bloc.dart';

abstract class FindMyBusinessServicesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessServicesStarted extends FindMyBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessServicesExcuted extends FindMyBusinessServicesEvent {
  final String uid;
  final ServiceWhereInput? where;
  final int? skip;
  final int? take;
  FindMyBusinessServicesExcuted(
      {required this.uid, this.where, this.skip, this.take});
  @override
  List<Object?> get props => [uid, where, skip, take];
}

class FindMyBusinessServicesIsLoading extends FindMyBusinessServicesEvent {
  final UserResponse data;
  FindMyBusinessServicesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessServicesIsOptimistic extends FindMyBusinessServicesEvent {
  final UserResponse data;
  FindMyBusinessServicesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessServicesIsConcrete extends FindMyBusinessServicesEvent {
  final UserResponse data;
  FindMyBusinessServicesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessServicesErrored extends FindMyBusinessServicesEvent {
  final UserResponse data;
  final String message;
  FindMyBusinessServicesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesFailed extends FindMyBusinessServicesEvent {
  final UserResponse data;
  final String message;
  FindMyBusinessServicesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindMyBusinessServicesReseted extends FindMyBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindMyBusinessServicesRefreshed extends FindMyBusinessServicesEvent {
  final FindMyBusinessServicesState data;
  FindMyBusinessServicesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindMyBusinessServicesRetried extends FindMyBusinessServicesEvent {
  @override
  List<Object?> get props => [];
}
