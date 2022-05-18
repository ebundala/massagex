import 'help_count_aggregate_output_type.dart';
import 'help_min_aggregate_output_type.dart';
import 'help_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateHelp extends Equatable {
  final HelpCountAggregateOutputType? $count;
  final HelpCountAggregateOutputType? count;
  final HelpMinAggregateOutputType? $min;
  final HelpMinAggregateOutputType? min;
  final HelpMaxAggregateOutputType? $max;
  final HelpMaxAggregateOutputType? max;
  AggregateHelp(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateHelp fromJson(Map<dynamic, dynamic> json) {
    return AggregateHelp(
      $count: json['_count'] != null
          ? HelpCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? HelpCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? HelpMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? HelpMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? HelpMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? HelpMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateHelp copyWith(
      {HelpCountAggregateOutputType? $count,
      HelpCountAggregateOutputType? count,
      HelpMinAggregateOutputType? $min,
      HelpMinAggregateOutputType? min,
      HelpMaxAggregateOutputType? $max,
      HelpMaxAggregateOutputType? max}) {
    return AggregateHelp(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
