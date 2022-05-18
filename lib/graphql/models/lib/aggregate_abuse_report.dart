import 'abuse_report_count_aggregate_output_type.dart';
import 'abuse_report_avg_aggregate_output_type.dart';
import 'abuse_report_sum_aggregate_output_type.dart';
import 'abuse_report_min_aggregate_output_type.dart';
import 'abuse_report_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateAbuseReport extends Equatable {
  final AbuseReportCountAggregateOutputType? $count;
  final AbuseReportCountAggregateOutputType? count;
  final AbuseReportAvgAggregateOutputType? $avg;
  final AbuseReportAvgAggregateOutputType? avg;
  final AbuseReportSumAggregateOutputType? $sum;
  final AbuseReportSumAggregateOutputType? sum;
  final AbuseReportMinAggregateOutputType? $min;
  final AbuseReportMinAggregateOutputType? min;
  final AbuseReportMaxAggregateOutputType? $max;
  final AbuseReportMaxAggregateOutputType? max;
  AggregateAbuseReport(
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

  static AggregateAbuseReport fromJson(Map<dynamic, dynamic> json) {
    return AggregateAbuseReport(
      $count: json['_count'] != null
          ? AbuseReportCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? AbuseReportCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? AbuseReportAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? AbuseReportAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? AbuseReportSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? AbuseReportSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? AbuseReportMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? AbuseReportMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? AbuseReportMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? AbuseReportMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateAbuseReport copyWith(
      {AbuseReportCountAggregateOutputType? $count,
      AbuseReportCountAggregateOutputType? count,
      AbuseReportAvgAggregateOutputType? $avg,
      AbuseReportAvgAggregateOutputType? avg,
      AbuseReportSumAggregateOutputType? $sum,
      AbuseReportSumAggregateOutputType? sum,
      AbuseReportMinAggregateOutputType? $min,
      AbuseReportMinAggregateOutputType? min,
      AbuseReportMaxAggregateOutputType? $max,
      AbuseReportMaxAggregateOutputType? max}) {
    return AggregateAbuseReport(
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
