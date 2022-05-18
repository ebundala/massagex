part of 'register_device_bloc.dart';

abstract class RegisterDeviceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterDeviceStarted extends RegisterDeviceEvent {
  @override
  List<Object?> get props => [];
}

class RegisterDeviceExcuted extends RegisterDeviceEvent {
  final RegisterDeviceInput device;
  RegisterDeviceExcuted({required this.device});
  @override
  List<Object?> get props => [device];
}

class RegisterDeviceIsLoading extends RegisterDeviceEvent {
  final DeviceResponse data;
  RegisterDeviceIsLoading({required this.data});
  @override
  List<Object?> get props => [data];
}

class RegisterDeviceIsOptimistic extends RegisterDeviceEvent {
  final DeviceResponse data;
  RegisterDeviceIsOptimistic({required this.data});
  @override
  List<Object?> get props => [data];
}

class RegisterDeviceIsConcrete extends RegisterDeviceEvent {
  final DeviceResponse data;
  RegisterDeviceIsConcrete({required this.data});
  @override
  List<Object?> get props => [data];
}

class RegisterDeviceErrored extends RegisterDeviceEvent {
  final DeviceResponse data;
  final String message;
  RegisterDeviceErrored({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceFailed extends RegisterDeviceEvent {
  final DeviceResponse data;
  final String message;
  RegisterDeviceFailed({required this.data, required this.message});
  @override
  List<Object?> get props => [data, message];
}

class RegisterDeviceReseted extends RegisterDeviceEvent {
  @override
  List<Object?> get props => [];
}

class RegisterDeviceRefreshed extends RegisterDeviceEvent {
  final RegisterDeviceState data;
  RegisterDeviceRefreshed({required this.data});
  @override
  List<Object?> get props => [data];
}

class RegisterDeviceRetried extends RegisterDeviceEvent {
  @override
  List<Object?> get props => [];
}
