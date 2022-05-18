import 'lat_lng.dart';

import "package:equatable/equatable.dart";

class TransitStop extends Equatable {
  final String? name;
  final LatLng? location;
  TransitStop({this.name, this.location});

  static TransitStop fromJson(Map<dynamic, dynamic> json) {
    return TransitStop(
      name: json['name'],
      location:
          json['location'] != null ? LatLng.fromJson(json['location']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (name != null) _data['name'] = name;
    if (location != null) _data['location'] = location!.toJson();
    return _data;
  }

  TransitStop copyWith({String? name, LatLng? location}) {
    return TransitStop(
        name: name ?? this.name, location: location ?? this.location);
  }

  List<Object?> get props => [name, location];
}
