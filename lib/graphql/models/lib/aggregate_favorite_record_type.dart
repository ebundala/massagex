import 'favorite_record_type_count_aggregate_output_type.dart';
import 'favorite_record_type_min_aggregate_output_type.dart';
import 'favorite_record_type_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateFavoriteRecordType extends Equatable {
  final FavoriteRecordTypeCountAggregateOutputType? $count;
  final FavoriteRecordTypeCountAggregateOutputType? count;
  final FavoriteRecordTypeMinAggregateOutputType? $min;
  final FavoriteRecordTypeMinAggregateOutputType? min;
  final FavoriteRecordTypeMaxAggregateOutputType? $max;
  final FavoriteRecordTypeMaxAggregateOutputType? max;
  AggregateFavoriteRecordType(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateFavoriteRecordType fromJson(Map<dynamic, dynamic> json) {
    return AggregateFavoriteRecordType(
      $count: json['_count'] != null
          ? FavoriteRecordTypeCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? FavoriteRecordTypeCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? FavoriteRecordTypeMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? FavoriteRecordTypeMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? FavoriteRecordTypeMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? FavoriteRecordTypeMaxAggregateOutputType.fromJson(json['max'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  AggregateFavoriteRecordType copyWith(
      {FavoriteRecordTypeCountAggregateOutputType? $count,
      FavoriteRecordTypeCountAggregateOutputType? count,
      FavoriteRecordTypeMinAggregateOutputType? $min,
      FavoriteRecordTypeMinAggregateOutputType? min,
      FavoriteRecordTypeMaxAggregateOutputType? $max,
      FavoriteRecordTypeMaxAggregateOutputType? max}) {
    return AggregateFavoriteRecordType(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
