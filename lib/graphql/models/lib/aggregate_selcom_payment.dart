import 'selcom_payment_count_aggregate_output_type.dart';
import 'selcom_payment_avg_aggregate_output_type.dart';
import 'selcom_payment_sum_aggregate_output_type.dart';
import 'selcom_payment_min_aggregate_output_type.dart';
import 'selcom_payment_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateSelcomPayment extends Equatable {
  final SelcomPaymentCountAggregateOutputType? $count;
  final SelcomPaymentCountAggregateOutputType? count;
  final SelcomPaymentAvgAggregateOutputType? $avg;
  final SelcomPaymentAvgAggregateOutputType? avg;
  final SelcomPaymentSumAggregateOutputType? $sum;
  final SelcomPaymentSumAggregateOutputType? sum;
  final SelcomPaymentMinAggregateOutputType? $min;
  final SelcomPaymentMinAggregateOutputType? min;
  final SelcomPaymentMaxAggregateOutputType? $max;
  final SelcomPaymentMaxAggregateOutputType? max;
  AggregateSelcomPayment(
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

  static AggregateSelcomPayment fromJson(Map<dynamic, dynamic> json) {
    return AggregateSelcomPayment(
      $count: json['_count'] != null
          ? SelcomPaymentCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? SelcomPaymentCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? SelcomPaymentAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? SelcomPaymentAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? SelcomPaymentSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? SelcomPaymentSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? SelcomPaymentMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? SelcomPaymentMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? SelcomPaymentMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? SelcomPaymentMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateSelcomPayment copyWith(
      {SelcomPaymentCountAggregateOutputType? $count,
      SelcomPaymentCountAggregateOutputType? count,
      SelcomPaymentAvgAggregateOutputType? $avg,
      SelcomPaymentAvgAggregateOutputType? avg,
      SelcomPaymentSumAggregateOutputType? $sum,
      SelcomPaymentSumAggregateOutputType? sum,
      SelcomPaymentMinAggregateOutputType? $min,
      SelcomPaymentMinAggregateOutputType? min,
      SelcomPaymentMaxAggregateOutputType? $max,
      SelcomPaymentMaxAggregateOutputType? max}) {
    return AggregateSelcomPayment(
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
