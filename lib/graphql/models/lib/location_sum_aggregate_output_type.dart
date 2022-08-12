import "package:equatable/equatable.dart";

class LocationSumAggregateOutputType extends Equatable {
  final double? lat;
  final double? lon;
  final double? heading;
  LocationSumAggregateOutputType({this.lat, this.lon, this.heading});

  static LocationSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return LocationSumAggregateOutputType(
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      heading: json['heading']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (lat != null) _data['lat'] = lat;
    if (lon != null) _data['lon'] = lon;
    if (heading != null) _data['heading'] = heading;
    return _data;
  }

  LocationSumAggregateOutputType copyWith(
      {double? lat, double? lon, double? heading}) {
    return LocationSumAggregateOutputType(
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading);
  }

  List<Object?> get props => [lat, lon, heading];
}
