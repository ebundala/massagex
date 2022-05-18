import 'route_leg.dart';
import 'polyline.dart';
import 'lat_lng_bounds.dart';
import 'transit_fare.dart';
import 'lat_lng.dart';

import "package:equatable/equatable.dart";

class DirectionsRoute extends Equatable {
  final String? summary;
  final List<RouteLeg>? legs;
  final List<double>? waypoint$order;
  final Polyline? overview$polyline;
  final LatLngBounds? bounds;
  final String? copyrights;
  final List<String>? warnings;
  final TransitFare? fare;
  final List<LatLng>? overview$path;
  DirectionsRoute(
      {this.summary,
      this.legs,
      this.waypoint$order,
      this.overview$polyline,
      this.bounds,
      this.copyrights,
      this.warnings,
      this.fare,
      this.overview$path});

  static DirectionsRoute fromJson(Map<dynamic, dynamic> json) {
    return DirectionsRoute(
      summary: json['summary'],
      legs: json['legs'] != null
          ? List.generate(json['legs'].length,
              (index) => RouteLeg.fromJson(json['legs'][index]))
          : null,
      waypoint$order: json['waypoint_order'] != null
          ? List.generate(json['waypoint_order'].length,
              (index) => json['waypoint_order'][index] as double)
          : null,
      overview$polyline: json['overview_polyline'] != null
          ? Polyline.fromJson(json['overview_polyline'])
          : null,
      bounds:
          json['bounds'] != null ? LatLngBounds.fromJson(json['bounds']) : null,
      copyrights: json['copyrights'],
      warnings: json['warnings'] != null
          ? List.generate(json['warnings'].length,
              (index) => json['warnings'][index] as String)
          : null,
      fare: json['fare'] != null ? TransitFare.fromJson(json['fare']) : null,
      overview$path: json['overview_path'] != null
          ? List.generate(json['overview_path'].length,
              (index) => LatLng.fromJson(json['overview_path'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (summary != null) _data['summary'] = summary;
    if (legs != null)
      _data['legs'] =
          List.generate(legs?.length ?? 0, (index) => legs![index].toJson());
    if (waypoint$order != null) _data['waypoint_order'] = waypoint$order;
    if (overview$polyline != null)
      _data['overview_polyline'] = overview$polyline!.toJson();
    if (bounds != null) _data['bounds'] = bounds!.toJson();
    if (copyrights != null) _data['copyrights'] = copyrights;
    if (warnings != null) _data['warnings'] = warnings;
    if (fare != null) _data['fare'] = fare!.toJson();
    if (overview$path != null)
      _data['overview_path'] = List.generate(overview$path?.length ?? 0,
          (index) => overview$path![index].toJson());
    return _data;
  }

  DirectionsRoute copyWith(
      {String? summary,
      List<RouteLeg>? legs,
      List<double>? waypoint$order,
      Polyline? overview$polyline,
      LatLngBounds? bounds,
      String? copyrights,
      List<String>? warnings,
      TransitFare? fare,
      List<LatLng>? overview$path}) {
    return DirectionsRoute(
        summary: summary ?? this.summary,
        legs: legs ?? this.legs,
        waypoint$order: waypoint$order ?? this.waypoint$order,
        overview$polyline: overview$polyline ?? this.overview$polyline,
        bounds: bounds ?? this.bounds,
        copyrights: copyrights ?? this.copyrights,
        warnings: warnings ?? this.warnings,
        fare: fare ?? this.fare,
        overview$path: overview$path ?? this.overview$path);
  }

  List<Object?> get props => [
        summary,
        List.from(legs ?? []),
        List.from(waypoint$order ?? []),
        overview$polyline,
        bounds,
        copyrights,
        List.from(warnings ?? []),
        fare,
        List.from(overview$path ?? [])
      ];
}
