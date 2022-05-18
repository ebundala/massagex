part of 'update_service_bloc.dart';

abstract class UpdateServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateServiceStarted extends UpdateServiceEvent {
  @override
  List<Object?> get props => [];
}

class UpdateServiceExcuted extends UpdateServiceEvent {
  final AttachmentCreateWithoutServicesInput? image;
  UpdateServiceExcuted({this.image});
  @override
  List<Object?> get props => [image];
}

class UpdateServiceIsLoading extends UpdateServiceEvent {
  final UserResponse data;
  UpdateServiceIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateServiceIsOptimistic extends UpdateServiceEvent {
  final UserResponse data;
  UpdateServiceIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateServiceIsConcrete extends UpdateServiceEvent {
  final UserResponse data;
  UpdateServiceIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateServiceErrored extends UpdateServiceEvent {
  final UserResponse data;
  final String message;
  UpdateServiceErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceFailed extends UpdateServiceEvent {
  final UserResponse data;
  final String message;
  UpdateServiceFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceReseted extends UpdateServiceEvent {
  @override
  List<Object?> get props => [];
}

class UpdateServiceRefreshed extends UpdateServiceEvent {
  final UpdateServiceState data;
  UpdateServiceRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class UpdateServiceRetried extends UpdateServiceEvent {
  @override
  List<Object?> get props => [];
}
