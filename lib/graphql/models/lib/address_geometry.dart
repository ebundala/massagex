import 'lat_lng.dart';
import 'location_type.dart';
import 'lat_lng_bounds.dart';

import "package:equatable/equatable.dart";

class AddressGeometry extends Equatable {
  final LatLng? location;
  final LocationType? location$type;
  final LatLngBounds? viewport;
  final LatLngBounds? bounds;
  AddressGeometry(
      {this.location, this.location$type, this.viewport, this.bounds});

  static AddressGeometry fromJson(Map<dynamic, dynamic> json) {
    return AddressGeometry(
      location:
          json['location'] != null ? LatLng.fromJson(json['location']) : null,
      location$type: json['location_type'] != null
          ? LocationTypeExt.fromJson(json['location_type'])
          : null,
      viewport: json['viewport'] != null
          ? LatLngBounds.fromJson(json['viewport'])
          : null,
      bounds:
          json['bounds'] != null ? LatLngBounds.fromJson(json['bounds']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (location != null) _data['location'] = location!.toJson();
    if (location$type != null) _data['location_type'] = location$type!.toJson();
    if (viewport != null) _data['viewport'] = viewport!.toJson();
    if (bounds != null) _data['bounds'] = bounds!.toJson();
    return _data;
  }

  AddressGeometry copyWith(
      {LatLng? location,
      LocationType? location$type,
      LatLngBounds? viewport,
      LatLngBounds? bounds}) {
    return AddressGeometry(
        location: location ?? this.location,
        location$type: location$type ?? this.location$type,
        viewport: viewport ?? this.viewport,
        bounds: bounds ?? this.bounds);
  }

  List<Object?> get props => [location, location$type, viewport, bounds];
}
