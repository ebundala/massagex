part of 'create_service_bloc.dart';

abstract class CreateServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateServiceStarted extends CreateServiceEvent {
  @override
  List<Object?> get props => [];
}

class CreateServiceExcuted extends CreateServiceEvent {
  final String uid;
  final String name;
  final double price;
  final JSONObject? metadata;
  final String? currency;
  final String? description;
  final AttachmentCreateNestedOneWithoutServicesInput? image;
  CreateServiceExcuted(
      {required this.uid,
      required this.name,
      required this.price,
      this.metadata,
      this.currency,
      this.description,
      this.image});
  @override
  List<Object?> get props =>
      [uid, name, price, metadata, currency, description, image];
}

class CreateServiceIsLoading extends CreateServiceEvent {
  final UserResponse data;
  CreateServiceIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateServiceIsOptimistic extends CreateServiceEvent {
  final UserResponse data;
  CreateServiceIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateServiceIsConcrete extends CreateServiceEvent {
  final UserResponse data;
  CreateServiceIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateServiceErrored extends CreateServiceEvent {
  final UserResponse data;
  final String message;
  CreateServiceErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceFailed extends CreateServiceEvent {
  final UserResponse data;
  final String message;
  CreateServiceFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceReseted extends CreateServiceEvent {
  @override
  List<Object?> get props => [];
}

class CreateServiceRefreshed extends CreateServiceEvent {
  final CreateServiceState data;
  CreateServiceRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class CreateServiceRetried extends CreateServiceEvent {
  @override
  List<Object?> get props => [];
}
