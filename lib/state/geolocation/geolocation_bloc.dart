import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  bool _serviceEnabled = false;
  late Location location;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  StreamSubscription<LocationData>? subscription;
  GeolocationBloc() : super(GeolocationInitial()) {
    location = Location();

    on<GeolocationStart>((event, emit) => bootStrap(emit));
    on<GeolocationGetLocation>((event, emit) => bootStrap(emit));
    on<GeolocationRequestPermission>((event, emit) => bootStrap(emit));
    on<GeolocationOpenLocationSettings>((event, emit) => bootStrap(emit));
    on<GeolocationOpenAppSettings>((event, emit) => bootStrap(emit));

    on<GeolocationListenForLocationChanged>((event, emit) => bootStrap(emit));
    on<GeolocationStopListenForLocationChanged>(
        (event, emit) => unregisterLocationListener(emit));
    on<GeolocationLocationChanged>(
      (event, emit) {
        emit(GeolocationPositionChanged(
            enabled: _serviceEnabled,
            listening: true,
            position: event.position));
      },
    );
  }

  bootStrap(Emitter<GeolocationState> emit) async {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(GeolocationInProggress(state: state));
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        emit(GeolocationCantPerformQuery(state: state));
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.deniedForever) {
      emit(GeolocationPermissionDeniedForever(enabled: _serviceEnabled));
      return;
    } else if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        emit(GeolocationPermissionDenied(enabled: _serviceEnabled));
        return;
      } else {
        subscription = await registerLocationListener(emit);
        return;
      }
    } else {
      subscription = await registerLocationListener(emit);
      return;
    }
  }

  updateLocation(LocationData location) {
    _locationData = location;
    if (_locationData != null) {
      add(GeolocationLocationChanged(position: _locationData!));
    }
  }

  Future<StreamSubscription<LocationData>?> registerLocationListener(
      Emitter<GeolocationState> emit) async {
    if (serviceAvailable()) {
      location.changeSettings(interval: 30000);
      _locationData = await location.getLocation();
      if (!await location.isBackgroundModeEnabled()) {
        location.enableBackgroundMode(enable: true);
      }
      return location.onLocationChanged
          .listen((locationData) => updateLocation(locationData));
    }
    return null;
  }

  unregisterLocationListener(Emitter<GeolocationState> emit) async {
    if (await location.isBackgroundModeEnabled()) {
      location.enableBackgroundMode(enable: false);
    }

    await subscription?.cancel();
    emit(GeolocationListenerUnregistered(state: state));
  }

  bool serviceAvailable() {
    return _serviceEnabled &&
        (_permissionGranted == PermissionStatus.granted ||
            _permissionGranted == PermissionStatus.grantedLimited);
  }
// Position position;

//   Stream<Position> positionStream;
//   StreamSubscription<Position> positionSubscription;
//   LocationPermission locationPermission;

  // @override
  // Stream<GeolocationState> mapEventToState(
  //   GeolocationEvent event,
  // ) async* {
  //   if (event is GeolocationStart) {
  //     yield* bootstrap();
  //   } else if (event is GeolocationRequestPermission) {
  //     await isLocationEnabled();
  //     await requestLocationPermission();
  //     if (locationPermission == LocationPermission.denied ||
  //         locationPermission == LocationPermission.deniedForever) {
  //       yield GeolocationPermissionDeniedForever(
  //           enabled: locationEnabled, listening: positionStream != null);
  //     } else {
  //       yield GeolocationPermissionGranted(
  //           enabled: locationEnabled, listening: positionStream != null);
  //     }
  //   } else if (event is GeolocationOpenLocationSettings) {
  //     await openLocationSettings();
  //     await Future.delayed(Duration(seconds: 15), () async {
  //       await isLocationEnabled();
  //       await checkLocationPermission();
  //       if (!hasPermission()) {
  //         //permission denied cant ask more
  //         //  emit(GeolocationCantPerformQuery());
  //       } else {
  //         emit(GeolocationPermissionGranted(
  //             enabled: locationEnabled, listening: positionStream != null));
  //       }
  //     });
  //   } else if (event is GeolocationOpenAppSettings) {
  //     await openAppSetting();
  //     await Future.delayed(Duration(seconds: 15), () async {
  //       await isLocationEnabled();
  //       await checkLocationPermission();
  //       if (!hasPermission()) {
  //         //permission denied cant ask more
  //         // emit(GeolocationCantPerformQuery());
  //       } else {
  //         emit(GeolocationPermissionGranted(
  //             enabled: locationEnabled, listening: positionStream != null));
  //       }
  //     });
  //   } else if (event is GeolocationListenForLocationChanged) {
  //     yield* registerLocationListener();
  //   } else if (event is GeolocationStopListenForLocationChanged) {
  //     await unregisterLocationListener();
  //   } else if (event is GeolocationGetLocation) {
  //     if (!canPerformQuery()) {
  //       yield GeolocationCantPerformQuery();
  //     } else {
  //       if (event.lastKNown) {
  //         await getLastKnownPosition();
  //       } else {
  //         await getCurrentPosition();
  //       }
  //       yield GeolocationPositionChanged(
  //           enabled: locationEnabled,
  //           listening: positionStream != null,
  //           position: position);
  //     }
  //   } else if (event is GeolocationLocationChanged) {
  //     yield GeolocationPositionChanged(
  //         enabled: locationEnabled,
  //         listening: positionStream != null,
  //         position: event.position);
  //   }
  // }

  // bool hasPermission() {
  //   return !(locationPermission == LocationPermission.denied ||
  //       locationPermission == LocationPermission.deniedForever);
  // }

  // bool canPerformQuery() {
  //   if (!locationEnabled || !hasPermission()) {
  //     return false;
  //   }
  //   return true;
  // }

  // Stream<GeolocationState> bootstrap() async* {
  //   yield GeolocationInProggress(state: state);
  //   await isLocationEnabled();
  //   await checkLocationPermission();
  //   if (locationPermission == LocationPermission.denied) {
  //     // yield GeolocationPermissionDenied(
  //     //  enabled: locationEnabled, listening: positionStream != null);
  //     add(GeolocationRequestPermission());
  //   } else if (locationPermission == LocationPermission.deniedForever) {
  //     yield GeolocationPermissionDeniedForever(
  //         enabled: locationEnabled, listening: positionStream != null);
  //   } else {
  //     yield GeolocationPermissionGranted(
  //         enabled: locationEnabled, listening: positionStream != null);
  //   }
  // }

  // Stream<GeolocationState> registerLocationListener() async* {
  //   //yield GeolocationInProggress(state: state);
  //   await unregisterLocationListener();
  //   await getPositionStream(intervalDuration: Duration(seconds: 60));
  //   positionSubscription = positionStream.listen((event) {
  //     position = event;
  //     //print("Your location is: lat:${event.latitude}  lon:${event.longitude}");
  //     add(GeolocationResseted());
  //     add(GeolocationLocationChanged(position: event));
  //   });
  // }

  // Future<void> unregisterLocationListener() async {
  //   if (positionSubscription != null) {
  //     await positionSubscription.cancel();
  //   }
  //   if (positionStream != null) {
  //     positionStream = null;
  //   }
  // }

  // Future<Stream<Position>> getPositionStream(
  //     {LocationAccuracy desiredAccuracy = LocationAccuracy.best,
  //     int distanceFilter = 0,
  //     bool forceAndroidLocationManager = false,
  //     Duration intervalDuration,
  //     Duration timeLimit}) async {
  //   positionStream = await Geolocator.getPositionStream(
  //       desiredAccuracy: desiredAccuracy,
  //       distanceFilter: distanceFilter,
  //       forceAndroidLocationManager: forceAndroidLocationManager,
  //       intervalDuration: intervalDuration,
  //       timeLimit: timeLimit);
  //   return positionStream;
  // }

  // double distanceBetween(double startLatitude, double startLongitude,
  //     double endLatitude, double endLongitude) {
  //   return Geolocator.distanceBetween(
  //       startLatitude, startLongitude, endLatitude, endLongitude);
  // }

  // Future<bool> openAppSetting() {
  //   return Geolocator.openAppSettings();
  // }

  // Future<bool> openLocationSettings() {
  //   return Geolocator.openLocationSettings();
  // }

  // Future<LocationPermission> requestLocationPermission() async {
  //   locationPermission = await Geolocator.requestPermission();
  //   return locationPermission;
  // }

  // Future<Position> lastKnownLocation() async {
  //   position = await Geolocator.getLastKnownPosition();
  //   return position;
  // }

  // Future<bool> isLocationEnabled() async {
  //   locationEnabled = await Geolocator.isLocationServiceEnabled();
  //   return locationEnabled;
  // }

  // Future<LocationPermission> checkLocationPermission() async {
  //   locationPermission = await Geolocator.checkPermission();
  //   return locationPermission;
  // }

  // Future<Position> getCurrentPosition(
  //     {LocationAccuracy accuracy = LocationAccuracy.low}) async {
  //   position = await Geolocator.getCurrentPosition(desiredAccuracy: accuracy);
  //   return position;
  // }

  // Future<Position> getLastKnownPosition() async {
  //   position = await Geolocator.getLastKnownPosition();
  //   return position;
  // }
}
