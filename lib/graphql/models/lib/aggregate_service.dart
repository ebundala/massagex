import 'service_count_aggregate_output_type.dart';
import 'service_avg_aggregate_output_type.dart';
import 'service_sum_aggregate_output_type.dart';
import 'service_min_aggregate_output_type.dart';
import 'service_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateService extends Equatable {
  final ServiceCountAggregateOutputType? $count;
  final ServiceCountAggregateOutputType? count;
  final ServiceAvgAggregateOutputType? $avg;
  final ServiceAvgAggregateOutputType? avg;
  final ServiceSumAggregateOutputType? $sum;
  final ServiceSumAggregateOutputType? sum;
  final ServiceMinAggregateOutputType? $min;
  final ServiceMinAggregateOutputType? min;
  final ServiceMaxAggregateOutputType? $max;
  final ServiceMaxAggregateOutputType? max;
  AggregateService(
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

  static AggregateService fromJson(Map<dynamic, dynamic> json) {
    return AggregateService(
      $count: json['_count'] != null
          ? ServiceCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? ServiceCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? ServiceAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? ServiceAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? ServiceSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? ServiceSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? ServiceMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? ServiceMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? ServiceMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? ServiceMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateService copyWith(
      {ServiceCountAggregateOutputType? $count,
      ServiceCountAggregateOutputType? count,
      ServiceAvgAggregateOutputType? $avg,
      ServiceAvgAggregateOutputType? avg,
      ServiceSumAggregateOutputType? $sum,
      ServiceSumAggregateOutputType? sum,
      ServiceMinAggregateOutputType? $min,
      ServiceMinAggregateOutputType? min,
      ServiceMaxAggregateOutputType? $max,
      ServiceMaxAggregateOutputType? max}) {
    return AggregateService(
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
