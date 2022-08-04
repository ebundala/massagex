part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class GeolocationStart extends GeolocationEvent {}

class GeolocationGetLocation extends GeolocationEvent {
  final bool lastKNown;
  const GeolocationGetLocation({this.lastKNown = false});
  @override
  List<Object> get props => [lastKNown];
}

class GeolocationRequestPermission extends GeolocationEvent {}

class GeolocationOpenLocationSettings extends GeolocationEvent {}

class GeolocationOpenAppSettings extends GeolocationEvent {}

class GeolocationListenForLocationChanged extends GeolocationEvent {}

class GeolocationStopListenForLocationChanged extends GeolocationEvent {}

class GeolocationLocationChanged extends GeolocationEvent {
  final LocationData position;
  const GeolocationLocationChanged({required this.position});
  @override
  List<Object> get props => [position];
}

class GeolocationResseted extends GeolocationEvent {}
