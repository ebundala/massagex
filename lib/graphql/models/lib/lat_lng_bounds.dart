import 'lat_lng.dart';

import "package:equatable/equatable.dart";

class LatLngBounds extends Equatable {
  final LatLng? northeast;
  final LatLng? southwest;
  LatLngBounds({this.northeast, this.southwest});

  static LatLngBounds fromJson(Map<dynamic, dynamic> json) {
    return LatLngBounds(
      northeast:
          json['northeast'] != null ? LatLng.fromJson(json['northeast']) : null,
      southwest:
          json['southwest'] != null ? LatLng.fromJson(json['southwest']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (northeast != null) _data['northeast'] = northeast!.toJson();
    if (southwest != null) _data['southwest'] = southwest!.toJson();
    return _data;
  }

  LatLngBounds copyWith({LatLng? northeast, LatLng? southwest}) {
    return LatLngBounds(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest);
  }

  List<Object?> get props => [northeast, southwest];
}
