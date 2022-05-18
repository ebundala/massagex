import "package:equatable/equatable.dart";

class LocationAvgAggregateOutputType extends Equatable {
  final double? lat;
  final double? lon;
  LocationAvgAggregateOutputType({this.lat, this.lon});

  static LocationAvgAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return LocationAvgAggregateOutputType(
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

  LocationAvgAggregateOutputType copyWith({double? lat, double? lon}) {
    return LocationAvgAggregateOutputType(
        lat: lat ?? this.lat, lon: lon ?? this.lon);
  }

  List<Object?> get props => [lat, lon];
}
