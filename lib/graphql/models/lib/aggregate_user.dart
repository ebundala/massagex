import 'user_count_aggregate_output_type.dart';
import 'user_min_aggregate_output_type.dart';
import 'user_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateUser extends Equatable {
  final UserCountAggregateOutputType? $count;
  final UserCountAggregateOutputType? count;
  final UserMinAggregateOutputType? $min;
  final UserMinAggregateOutputType? min;
  final UserMaxAggregateOutputType? $max;
  final UserMaxAggregateOutputType? max;
  AggregateUser(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateUser fromJson(Map<dynamic, dynamic> json) {
    return AggregateUser(
      $count: json['_count'] != null
          ? UserCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? UserCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? UserMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? UserMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? UserMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? UserMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateUser copyWith(
      {UserCountAggregateOutputType? $count,
      UserCountAggregateOutputType? count,
      UserMinAggregateOutputType? $min,
      UserMinAggregateOutputType? min,
      UserMaxAggregateOutputType? $max,
      UserMaxAggregateOutputType? max}) {
    return AggregateUser(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
