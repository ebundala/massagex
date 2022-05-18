import 'geocoded_waypoint_status.dart';

import "package:equatable/equatable.dart";

class GeocodedWaypoint extends Equatable {
  final GeocodedWaypointStatus? geocoder$status;
  final bool? partial$match;
  final String? place$id;
  final List<String>? types;
  GeocodedWaypoint(
      {this.geocoder$status, this.partial$match, this.place$id, this.types});

  static GeocodedWaypoint fromJson(Map<dynamic, dynamic> json) {
    return GeocodedWaypoint(
      geocoder$status: json['geocoder_status'] != null
          ? GeocodedWaypointStatusExt.fromJson(json['geocoder_status'])
          : null,
      partial$match: json['partial_match'],
      place$id: json['place_id'],
      types: json['types'] != null
          ? List.generate(
              json['types'].length, (index) => json['types'][index] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (geocoder$status != null)
      _data['geocoder_status'] = geocoder$status!.toJson();
    if (partial$match != null) _data['partial_match'] = partial$match;
    if (place$id != null) _data['place_id'] = place$id;
    if (types != null) _data['types'] = types;
    return _data;
  }

  GeocodedWaypoint copyWith(
      {GeocodedWaypointStatus? geocoder$status,
      bool? partial$match,
      String? place$id,
      List<String>? types}) {
    return GeocodedWaypoint(
        geocoder$status: geocoder$status ?? this.geocoder$status,
        partial$match: partial$match ?? this.partial$match,
        place$id: place$id ?? this.place$id,
        types: types ?? this.types);
  }

  List<Object?> get props =>
      [geocoder$status, partial$match, place$id, List.from(types ?? [])];
}
