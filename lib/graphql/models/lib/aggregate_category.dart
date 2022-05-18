import 'category_count_aggregate_output_type.dart';
import 'category_min_aggregate_output_type.dart';
import 'category_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateCategory extends Equatable {
  final CategoryCountAggregateOutputType? $count;
  final CategoryCountAggregateOutputType? count;
  final CategoryMinAggregateOutputType? $min;
  final CategoryMinAggregateOutputType? min;
  final CategoryMaxAggregateOutputType? $max;
  final CategoryMaxAggregateOutputType? max;
  AggregateCategory(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateCategory fromJson(Map<dynamic, dynamic> json) {
    return AggregateCategory(
      $count: json['_count'] != null
          ? CategoryCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? CategoryCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? CategoryMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? CategoryMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? CategoryMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? CategoryMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateCategory copyWith(
      {CategoryCountAggregateOutputType? $count,
      CategoryCountAggregateOutputType? count,
      CategoryMinAggregateOutputType? $min,
      CategoryMinAggregateOutputType? min,
      CategoryMaxAggregateOutputType? $max,
      CategoryMaxAggregateOutputType? max}) {
    return AggregateCategory(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
