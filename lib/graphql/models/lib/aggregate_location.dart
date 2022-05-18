import 'location_count_aggregate_output_type.dart';
import 'location_avg_aggregate_output_type.dart';
import 'location_sum_aggregate_output_type.dart';
import 'location_min_aggregate_output_type.dart';
import 'location_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateLocation extends Equatable {
  final LocationCountAggregateOutputType? $count;
  final LocationCountAggregateOutputType? count;
  final LocationAvgAggregateOutputType? $avg;
  final LocationAvgAggregateOutputType? avg;
  final LocationSumAggregateOutputType? $sum;
  final LocationSumAggregateOutputType? sum;
  final LocationMinAggregateOutputType? $min;
  final LocationMinAggregateOutputType? min;
  final LocationMaxAggregateOutputType? $max;
  final LocationMaxAggregateOutputType? max;
  AggregateLocation(
      {this.$count,
      this.count,
      this.$avg,
      this.avg,
      this.$sum,
      this.sum,
      this.$min,
      this.min,
      this.$max,
      this.max});

  static AggregateLocation fromJson(Map<dynamic, dynamic> json) {
    return AggregateLocation(
      $count: json['_count'] != null
          ? LocationCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? LocationCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? LocationAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? LocationAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? LocationSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? LocationSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? LocationMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? LocationMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? LocationMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? LocationMaxAggregateOutputType.fromJson(json['max'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($avg != null) _data['_avg'] = $avg!.toJson();
    if (avg != null) _data['avg'] = avg!.toJson();
    if ($sum != null) _data['_sum'] = $sum!.toJson();
    if (sum != null) _data['sum'] = sum!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  AggregateLocation copyWith(
      {LocationCountAggregateOutputType? $count,
      LocationCountAggregateOutputType? count,
      LocationAvgAggregateOutputType? $avg,
      LocationAvgAggregateOutputType? avg,
      LocationSumAggregateOutputType? $sum,
      LocationSumAggregateOutputType? sum,
      LocationMinAggregateOutputType? $min,
      LocationMinAggregateOutputType? min,
      LocationMaxAggregateOutputType? $max,
      LocationMaxAggregateOutputType? max}) {
    return AggregateLocation(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $avg: $avg ?? this.$avg,
        avg: avg ?? this.avg,
        $sum: $sum ?? this.$sum,
        sum: sum ?? this.sum,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props =>
      [$count, count, $avg, avg, $sum, sum, $min, min, $max, max];
}
