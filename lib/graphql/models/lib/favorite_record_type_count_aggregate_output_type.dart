import "package:equatable/equatable.dart";

class FavoriteRecordTypeCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? $all;
  FavoriteRecordTypeCountAggregateOutputType({this.id, this.name, this.$all});

  static FavoriteRecordTypeCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeCountAggregateOutputType(
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

  FavoriteRecordTypeCountAggregateOutputType copyWith(
      {int? id, int? name, int? $all}) {
    return FavoriteRecordTypeCountAggregateOutputType(
        id: id ?? this.id, name: name ?? this.name, $all: $all ?? this.$all);
  }

  List<Object?> get props => [id, name, $all];
}
