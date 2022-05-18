import 'help_step_count_aggregate_output_type.dart';
import 'help_step_avg_aggregate_output_type.dart';
import 'help_step_sum_aggregate_output_type.dart';
import 'help_step_min_aggregate_output_type.dart';
import 'help_step_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateHelpStep extends Equatable {
  final HelpStepCountAggregateOutputType? $count;
  final HelpStepCountAggregateOutputType? count;
  final HelpStepAvgAggregateOutputType? $avg;
  final HelpStepAvgAggregateOutputType? avg;
  final HelpStepSumAggregateOutputType? $sum;
  final HelpStepSumAggregateOutputType? sum;
  final HelpStepMinAggregateOutputType? $min;
  final HelpStepMinAggregateOutputType? min;
  final HelpStepMaxAggregateOutputType? $max;
  final HelpStepMaxAggregateOutputType? max;
  AggregateHelpStep(
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

  static AggregateHelpStep fromJson(Map<dynamic, dynamic> json) {
    return AggregateHelpStep(
      $count: json['_count'] != null
          ? HelpStepCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? HelpStepCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? HelpStepAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? HelpStepAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? HelpStepSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? HelpStepSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? HelpStepMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? HelpStepMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? HelpStepMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? HelpStepMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateHelpStep copyWith(
      {HelpStepCountAggregateOutputType? $count,
      HelpStepCountAggregateOutputType? count,
      HelpStepAvgAggregateOutputType? $avg,
      HelpStepAvgAggregateOutputType? avg,
      HelpStepSumAggregateOutputType? $sum,
      HelpStepSumAggregateOutputType? sum,
      HelpStepMinAggregateOutputType? $min,
      HelpStepMinAggregateOutputType? min,
      HelpStepMaxAggregateOutputType? $max,
      HelpStepMaxAggregateOutputType? max}) {
    return AggregateHelpStep(
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
