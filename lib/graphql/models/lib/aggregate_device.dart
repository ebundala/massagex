import 'device_count_aggregate_output_type.dart';
import 'device_min_aggregate_output_type.dart';
import 'device_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateDevice extends Equatable {
  final DeviceCountAggregateOutputType? $count;
  final DeviceCountAggregateOutputType? count;
  final DeviceMinAggregateOutputType? $min;
  final DeviceMinAggregateOutputType? min;
  final DeviceMaxAggregateOutputType? $max;
  final DeviceMaxAggregateOutputType? max;
  AggregateDevice(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateDevice fromJson(Map<dynamic, dynamic> json) {
    return AggregateDevice(
      $count: json['_count'] != null
          ? DeviceCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? DeviceCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? DeviceMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? DeviceMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? DeviceMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? DeviceMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateDevice copyWith(
      {DeviceCountAggregateOutputType? $count,
      DeviceCountAggregateOutputType? count,
      DeviceMinAggregateOutputType? $min,
      DeviceMinAggregateOutputType? min,
      DeviceMaxAggregateOutputType? $max,
      DeviceMaxAggregateOutputType? max}) {
    return AggregateDevice(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
