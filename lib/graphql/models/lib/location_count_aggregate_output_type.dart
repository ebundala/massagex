import "package:equatable/equatable.dart";

class LocationCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? lat;
  final int? lon;
  final int? heading;
  final int? recordStatus;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  LocationCountAggregateOutputType(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.heading,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static LocationCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return LocationCountAggregateOutputType(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lon: json['lon'],
      heading: json['heading'],
      recordStatus: json['recordStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (lat != null) _data['lat'] = lat;
    if (lon != null) _data['lon'] = lon;
    if (heading != null) _data['heading'] = heading;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  LocationCountAggregateOutputType copyWith(
      {int? id,
      int? name,
      int? lat,
      int? lon,
      int? heading,
      int? recordStatus,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return LocationCountAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props =>
      [id, name, lat, lon, heading, recordStatus, createdAt, updatedAt, $all];
}
