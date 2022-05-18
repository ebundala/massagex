part of 'update_service_bloc.dart';

abstract class UpdateServiceState extends Equatable {
  final UserResponse? data;
  final String? message;
  UpdateServiceState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceInitial extends UpdateServiceState {
  @override
  List<Object?> get props => [];
}

class UpdateServiceSuccess extends UpdateServiceState {
  final UserResponse data;
  final String? message;
  UpdateServiceSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceFailure extends UpdateServiceState {
  final UserResponse data;
  final String? message;
  UpdateServiceFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceInProgress extends UpdateServiceState {
  final UserResponse data;
  final String? message;
  UpdateServiceInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceOptimistic extends UpdateServiceState {
  final UserResponse data;
  final String? message;
  UpdateServiceOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceError extends UpdateServiceState {
  final UserResponse data;
  final String? message;
  UpdateServiceError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class UpdateServiceImagePathValidationError extends UpdateServiceState {
  final AttachmentCreateWithoutServicesInput? $image;
  final UserResponse? data;
  final String? message;
  UpdateServiceImagePathValidationError(this.message, this.data, {this.$image});
  @override
  List<Object?> get props => [$image, message, data];
}
