import "package:equatable/equatable.dart";

class LocationSumAggregateOutputType extends Equatable {
  final double? lat;
  final double? lon;
  LocationSumAggregateOutputType({this.lat, this.lon});

  static LocationSumAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return LocationSumAggregateOutputType(
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (lat != null) _data['lat'] = lat;
    if (lon != null) _data['lon'] = lon;
    return _data;
  }

  LocationSumAggregateOutputType copyWith({double? lat, double? lon}) {
    return LocationSumAggregateOutputType(
        lat: lat ?? this.lat, lon: lon ?? this.lon);
  }

  List<Object?> get props => [lat, lon];
}
