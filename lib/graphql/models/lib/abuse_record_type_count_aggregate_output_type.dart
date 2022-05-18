import "package:equatable/equatable.dart";

class AbuseRecordTypeCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? $all;
  AbuseRecordTypeCountAggregateOutputType({this.id, this.name, this.$all});

  static AbuseRecordTypeCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseRecordTypeCountAggregateOutputType(
      id: json['id'],
      name: json['name'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  AbuseRecordTypeCountAggregateOutputType copyWith(
      {int? id, int? name, int? $all}) {
    return AbuseRecordTypeCountAggregateOutputType(
        id: id ?? this.id, name: name ?? this.name, $all: $all ?? this.$all);
  }

  List<Object?> get props => [id, name, $all];
}
