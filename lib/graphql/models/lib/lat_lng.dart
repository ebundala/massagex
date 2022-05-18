import "package:equatable/equatable.dart";

class LatLng extends Equatable {
  final double? lat;
  final double? lng;
  LatLng({this.lat, this.lng});

  static LatLng fromJson(Map<dynamic, dynamic> json) {
    return LatLng(
      lat: json['lat']?.toDouble(),
      lng: json['lng']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (lat != null) _data['lat'] = lat;
    if (lng != null) _data['lng'] = lng;
    return _data;
  }

  LatLng copyWith({double? lat, double? lng}) {
    return LatLng(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  List<Object?> get props => [lat, lng];
}
