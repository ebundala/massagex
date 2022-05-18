import 'review_count_aggregate_output_type.dart';
import 'review_avg_aggregate_output_type.dart';
import 'review_sum_aggregate_output_type.dart';
import 'review_min_aggregate_output_type.dart';
import 'review_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateReview extends Equatable {
  final ReviewCountAggregateOutputType? $count;
  final ReviewCountAggregateOutputType? count;
  final ReviewAvgAggregateOutputType? $avg;
  final ReviewAvgAggregateOutputType? avg;
  final ReviewSumAggregateOutputType? $sum;
  final ReviewSumAggregateOutputType? sum;
  final ReviewMinAggregateOutputType? $min;
  final ReviewMinAggregateOutputType? min;
  final ReviewMaxAggregateOutputType? $max;
  final ReviewMaxAggregateOutputType? max;
  AggregateReview(
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

  static AggregateReview fromJson(Map<dynamic, dynamic> json) {
    return AggregateReview(
      $count: json['_count'] != null
          ? ReviewCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? ReviewCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? ReviewAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? ReviewAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? ReviewSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? ReviewSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? ReviewMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? ReviewMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? ReviewMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? ReviewMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateReview copyWith(
      {ReviewCountAggregateOutputType? $count,
      ReviewCountAggregateOutputType? count,
      ReviewAvgAggregateOutputType? $avg,
      ReviewAvgAggregateOutputType? avg,
      ReviewSumAggregateOutputType? $sum,
      ReviewSumAggregateOutputType? sum,
      ReviewMinAggregateOutputType? $min,
      ReviewMinAggregateOutputType? min,
      ReviewMaxAggregateOutputType? $max,
      ReviewMaxAggregateOutputType? max}) {
    return AggregateReview(
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
