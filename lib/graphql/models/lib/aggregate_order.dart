import 'order_count_aggregate_output_type.dart';
import 'order_avg_aggregate_output_type.dart';
import 'order_sum_aggregate_output_type.dart';
import 'order_min_aggregate_output_type.dart';
import 'order_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateOrder extends Equatable {
  final OrderCountAggregateOutputType? $count;
  final OrderCountAggregateOutputType? count;
  final OrderAvgAggregateOutputType? $avg;
  final OrderAvgAggregateOutputType? avg;
  final OrderSumAggregateOutputType? $sum;
  final OrderSumAggregateOutputType? sum;
  final OrderMinAggregateOutputType? $min;
  final OrderMinAggregateOutputType? min;
  final OrderMaxAggregateOutputType? $max;
  final OrderMaxAggregateOutputType? max;
  AggregateOrder(
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

  static AggregateOrder fromJson(Map<dynamic, dynamic> json) {
    return AggregateOrder(
      $count: json['_count'] != null
          ? OrderCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? OrderCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? OrderAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? OrderAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? OrderSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? OrderSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? OrderMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? OrderMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? OrderMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? OrderMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateOrder copyWith(
      {OrderCountAggregateOutputType? $count,
      OrderCountAggregateOutputType? count,
      OrderAvgAggregateOutputType? $avg,
      OrderAvgAggregateOutputType? avg,
      OrderSumAggregateOutputType? $sum,
      OrderSumAggregateOutputType? sum,
      OrderMinAggregateOutputType? $min,
      OrderMinAggregateOutputType? min,
      OrderMaxAggregateOutputType? $max,
      OrderMaxAggregateOutputType? max}) {
    return AggregateOrder(
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
