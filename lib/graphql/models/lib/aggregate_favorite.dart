import 'favorite_count_aggregate_output_type.dart';
import 'favorite_min_aggregate_output_type.dart';
import 'favorite_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateFavorite extends Equatable {
  final FavoriteCountAggregateOutputType? $count;
  final FavoriteCountAggregateOutputType? count;
  final FavoriteMinAggregateOutputType? $min;
  final FavoriteMinAggregateOutputType? min;
  final FavoriteMaxAggregateOutputType? $max;
  final FavoriteMaxAggregateOutputType? max;
  AggregateFavorite(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateFavorite fromJson(Map<dynamic, dynamic> json) {
    return AggregateFavorite(
      $count: json['_count'] != null
          ? FavoriteCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? FavoriteCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? FavoriteMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? FavoriteMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? FavoriteMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? FavoriteMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateFavorite copyWith(
      {FavoriteCountAggregateOutputType? $count,
      FavoriteCountAggregateOutputType? count,
      FavoriteMinAggregateOutputType? $min,
      FavoriteMinAggregateOutputType? min,
      FavoriteMaxAggregateOutputType? $max,
      FavoriteMaxAggregateOutputType? max}) {
    return AggregateFavorite(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
