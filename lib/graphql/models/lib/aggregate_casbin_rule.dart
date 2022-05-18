import 'casbin_rule_count_aggregate_output_type.dart';
import 'casbin_rule_avg_aggregate_output_type.dart';
import 'casbin_rule_sum_aggregate_output_type.dart';
import 'casbin_rule_min_aggregate_output_type.dart';
import 'casbin_rule_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateCasbinRule extends Equatable {
  final CasbinRuleCountAggregateOutputType? $count;
  final CasbinRuleCountAggregateOutputType? count;
  final CasbinRuleAvgAggregateOutputType? $avg;
  final CasbinRuleAvgAggregateOutputType? avg;
  final CasbinRuleSumAggregateOutputType? $sum;
  final CasbinRuleSumAggregateOutputType? sum;
  final CasbinRuleMinAggregateOutputType? $min;
  final CasbinRuleMinAggregateOutputType? min;
  final CasbinRuleMaxAggregateOutputType? $max;
  final CasbinRuleMaxAggregateOutputType? max;
  AggregateCasbinRule(
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

  static AggregateCasbinRule fromJson(Map<dynamic, dynamic> json) {
    return AggregateCasbinRule(
      $count: json['_count'] != null
          ? CasbinRuleCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? CasbinRuleCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? CasbinRuleAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? CasbinRuleAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? CasbinRuleSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? CasbinRuleSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? CasbinRuleMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? CasbinRuleMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? CasbinRuleMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? CasbinRuleMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateCasbinRule copyWith(
      {CasbinRuleCountAggregateOutputType? $count,
      CasbinRuleCountAggregateOutputType? count,
      CasbinRuleAvgAggregateOutputType? $avg,
      CasbinRuleAvgAggregateOutputType? avg,
      CasbinRuleSumAggregateOutputType? $sum,
      CasbinRuleSumAggregateOutputType? sum,
      CasbinRuleMinAggregateOutputType? $min,
      CasbinRuleMinAggregateOutputType? min,
      CasbinRuleMaxAggregateOutputType? $max,
      CasbinRuleMaxAggregateOutputType? max}) {
    return AggregateCasbinRule(
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
