part of 'create_service_bloc.dart';

abstract class CreateServiceState extends Equatable {
  final UserResponse? data;
  final String? message;
  CreateServiceState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceInitial extends CreateServiceState {
  @override
  List<Object?> get props => [];
}

class CreateServiceSuccess extends CreateServiceState {
  final UserResponse data;
  final String? message;
  CreateServiceSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceFailure extends CreateServiceState {
  final UserResponse data;
  final String? message;
  CreateServiceFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceInProgress extends CreateServiceState {
  final UserResponse data;
  final String? message;
  CreateServiceInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceOptimistic extends CreateServiceState {
  final UserResponse data;
  final String? message;
  CreateServiceOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceError extends CreateServiceState {
  final UserResponse data;
  final String? message;
  CreateServiceError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class CreateServiceImagePathValidationError extends CreateServiceState {
  final AttachmentCreateWithoutServicesInput? $image;
  final UserResponse? data;
  final String? message;
  CreateServiceImagePathValidationError(this.message, this.data, {this.$image});
  @override
  List<Object?> get props => [$image, message, data];
}
