import 'business_count_aggregate_output_type.dart';
import 'business_min_aggregate_output_type.dart';
import 'business_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateBusiness extends Equatable {
  final BusinessCountAggregateOutputType? $count;
  final BusinessCountAggregateOutputType? count;
  final BusinessMinAggregateOutputType? $min;
  final BusinessMinAggregateOutputType? min;
  final BusinessMaxAggregateOutputType? $max;
  final BusinessMaxAggregateOutputType? max;
  AggregateBusiness(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateBusiness fromJson(Map<dynamic, dynamic> json) {
    return AggregateBusiness(
      $count: json['_count'] != null
          ? BusinessCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? BusinessCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? BusinessMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? BusinessMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? BusinessMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? BusinessMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateBusiness copyWith(
      {BusinessCountAggregateOutputType? $count,
      BusinessCountAggregateOutputType? count,
      BusinessMinAggregateOutputType? $min,
      BusinessMinAggregateOutputType? min,
      BusinessMaxAggregateOutputType? $max,
      BusinessMaxAggregateOutputType? max}) {
    return AggregateBusiness(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
