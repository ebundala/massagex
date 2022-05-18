import 'selcom_disbursement_count_aggregate_output_type.dart';
import 'selcom_disbursement_avg_aggregate_output_type.dart';
import 'selcom_disbursement_sum_aggregate_output_type.dart';
import 'selcom_disbursement_min_aggregate_output_type.dart';
import 'selcom_disbursement_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateSelcomDisbursement extends Equatable {
  final SelcomDisbursementCountAggregateOutputType? $count;
  final SelcomDisbursementCountAggregateOutputType? count;
  final SelcomDisbursementAvgAggregateOutputType? $avg;
  final SelcomDisbursementAvgAggregateOutputType? avg;
  final SelcomDisbursementSumAggregateOutputType? $sum;
  final SelcomDisbursementSumAggregateOutputType? sum;
  final SelcomDisbursementMinAggregateOutputType? $min;
  final SelcomDisbursementMinAggregateOutputType? min;
  final SelcomDisbursementMaxAggregateOutputType? $max;
  final SelcomDisbursementMaxAggregateOutputType? max;
  AggregateSelcomDisbursement(
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

  static AggregateSelcomDisbursement fromJson(Map<dynamic, dynamic> json) {
    return AggregateSelcomDisbursement(
      $count: json['_count'] != null
          ? SelcomDisbursementCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? SelcomDisbursementCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? SelcomDisbursementAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? SelcomDisbursementAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? SelcomDisbursementSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? SelcomDisbursementSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? SelcomDisbursementMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? SelcomDisbursementMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? SelcomDisbursementMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? SelcomDisbursementMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateSelcomDisbursement copyWith(
      {SelcomDisbursementCountAggregateOutputType? $count,
      SelcomDisbursementCountAggregateOutputType? count,
      SelcomDisbursementAvgAggregateOutputType? $avg,
      SelcomDisbursementAvgAggregateOutputType? avg,
      SelcomDisbursementSumAggregateOutputType? $sum,
      SelcomDisbursementSumAggregateOutputType? sum,
      SelcomDisbursementMinAggregateOutputType? $min,
      SelcomDisbursementMinAggregateOutputType? min,
      SelcomDisbursementMaxAggregateOutputType? $max,
      SelcomDisbursementMaxAggregateOutputType? max}) {
    return AggregateSelcomDisbursement(
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
