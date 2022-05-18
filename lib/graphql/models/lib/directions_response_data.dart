import 'geocoded_waypoint.dart';
import 'directions_route.dart';

import "package:equatable/equatable.dart";

class DirectionsResponseData extends Equatable {
  final List<GeocodedWaypoint>? geocoded$waypoints;
  final List<DirectionsRoute>? routes;
  final List<String>? available$travel$modes;
  DirectionsResponseData(
      {this.geocoded$waypoints, this.routes, this.available$travel$modes});

  static DirectionsResponseData fromJson(Map<dynamic, dynamic> json) {
    return DirectionsResponseData(
      geocoded$waypoints: json['geocoded_waypoints'] != null
          ? List.generate(
              json['geocoded_waypoints'].length,
              (index) =>
                  GeocodedWaypoint.fromJson(json['geocoded_waypoints'][index]))
          : null,
      routes: json['routes'] != null
          ? List.generate(json['routes'].length,
              (index) => DirectionsRoute.fromJson(json['routes'][index]))
          : null,
      available$travel$modes: json['available_travel_modes'] != null
          ? List.generate(json['available_travel_modes'].length,
              (index) => json['available_travel_modes'][index] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (geocoded$waypoints != null)
      _data['geocoded_waypoints'] = List.generate(
          geocoded$waypoints?.length ?? 0,
          (index) => geocoded$waypoints![index].toJson());
    if (routes != null)
      _data['routes'] = List.generate(
          routes?.length ?? 0, (index) => routes![index].toJson());
    if (available$travel$modes != null)
      _data['available_travel_modes'] = available$travel$modes;
    return _data;
  }

  DirectionsResponseData copyWith(
      {List<GeocodedWaypoint>? geocoded$waypoints,
      List<DirectionsRoute>? routes,
      List<String>? available$travel$modes}) {
    return DirectionsResponseData(
        geocoded$waypoints: geocoded$waypoints ?? this.geocoded$waypoints,
        routes: routes ?? this.routes,
        available$travel$modes:
            available$travel$modes ?? this.available$travel$modes);
  }

  List<Object?> get props => [
        List.from(geocoded$waypoints ?? []),
        List.from(routes ?? []),
        List.from(available$travel$modes ?? [])
      ];
}
