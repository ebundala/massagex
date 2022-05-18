part of 'register_device_bloc.dart';

abstract class RegisterDeviceState extends Equatable {
  final DeviceResponse? data;
  final String? message;
  RegisterDeviceState({this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceInitial extends RegisterDeviceState {
  @override
  List<Object?> get props => [];
}

class RegisterDeviceSuccess extends RegisterDeviceState {
  final DeviceResponse data;
  final String? message;
  RegisterDeviceSuccess({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceFailure extends RegisterDeviceState {
  final DeviceResponse data;
  final String? message;
  RegisterDeviceFailure({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceInProgress extends RegisterDeviceState {
  final DeviceResponse data;
  final String? message;
  RegisterDeviceInProgress({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceOptimistic extends RegisterDeviceState {
  final DeviceResponse data;
  final String? message;
  RegisterDeviceOptimistic({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceError extends RegisterDeviceState {
  final DeviceResponse data;
  final String? message;
  RegisterDeviceError({required this.data, this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceDeviceIdValidationError extends RegisterDeviceState {
  final RegisterDeviceInput $device;
  final DeviceResponse? data;
  final String? message;
  RegisterDeviceDeviceIdValidationError(this.message, this.data,
      {required this.$device});
  @override
  List<Object?> get props => [$device, message, data];
}
