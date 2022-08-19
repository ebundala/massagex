part of 'find_services_bloc.dart';

abstract class FindServicesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FindServicesStarted extends FindServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindServicesExcuted extends FindServicesEvent {
  final String businessId;
  final ServiceWhereInput? where;
  final int? take;
  final int? skip;
  FindServicesExcuted(
      {required this.businessId, this.where, this.take, this.skip});
  @override
  List<Object?> get props => [businessId, where, take, skip];
}

class FindServicesIsLoading extends FindServicesEvent {
  final BusinessResponse data;
  FindServicesIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindServicesIsOptimistic extends FindServicesEvent {
  final BusinessResponse data;
  FindServicesIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindServicesIsConcrete extends FindServicesEvent {
  final BusinessResponse data;
  FindServicesIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindServicesErrored extends FindServicesEvent {
  final BusinessResponse data;
  final String message;
  FindServicesErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesFailed extends FindServicesEvent {
  final BusinessResponse data;
  final String message;
  FindServicesFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class FindServicesReseted extends FindServicesEvent {
  @override
  List<Object?> get props => [];
}

class FindServicesRefreshed extends FindServicesEvent {
  final FindServicesState data;
  FindServicesRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class FindServicesRetried extends FindServicesEvent {
  @override
  List<Object?> get props => [];
}
