part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}

class GeolocationInitial extends GeolocationState {}

class GeolocationListenerUnregistered extends GeolocationState {
  final GeolocationState state;
  const GeolocationListenerUnregistered({required this.state});
  @override
  List<Object> get props => [state];
}

class GeolocationInProggress extends GeolocationState {
  final GeolocationState state;
  const GeolocationInProggress({required this.state});
  @override
  List<Object> get props => [state];
}

class GeolocationPermissionDenied extends GeolocationState {
  final bool enabled;
  final bool listening;
  const GeolocationPermissionDenied(
      {this.enabled = false, this.listening = false});
  @override
  List<Object> get props => [enabled];
}

class GeolocationPermissionDeniedForever extends GeolocationState {
  final bool enabled;
  final bool listening;

  const GeolocationPermissionDeniedForever(
      {this.enabled = false, this.listening = false});
  @override
  List<Object> get props => [enabled];
}

class GeolocationPermissionGranted extends GeolocationState {
  final bool enabled;
  final bool listening;

  const GeolocationPermissionGranted(
      {this.enabled = false, this.listening = false});
  @override
  List<Object> get props => [enabled, listening];
}

class GeolocationPositionChanged extends GeolocationState {
  final bool enabled;
  final LocationData position;
  final bool listening;
  const GeolocationPositionChanged(
      {required this.enabled, required this.position, required this.listening});
  @override
  List<Object> get props => [enabled, position, listening];
}

class GeolocationCantPerformQuery extends GeolocationState {
  final GeolocationState state;
  const GeolocationCantPerformQuery({required this.state});
  @override
  List<Object> get props => [state];
}
