import 'abuse_record_type_count_aggregate_output_type.dart';
import 'abuse_record_type_min_aggregate_output_type.dart';
import 'abuse_record_type_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateAbuseRecordType extends Equatable {
  final AbuseRecordTypeCountAggregateOutputType? $count;
  final AbuseRecordTypeCountAggregateOutputType? count;
  final AbuseRecordTypeMinAggregateOutputType? $min;
  final AbuseRecordTypeMinAggregateOutputType? min;
  final AbuseRecordTypeMaxAggregateOutputType? $max;
  final AbuseRecordTypeMaxAggregateOutputType? max;
  AggregateAbuseRecordType(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateAbuseRecordType fromJson(Map<dynamic, dynamic> json) {
    return AggregateAbuseRecordType(
      $count: json['_count'] != null
          ? AbuseRecordTypeCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? AbuseRecordTypeCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? AbuseRecordTypeMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? AbuseRecordTypeMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? AbuseRecordTypeMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? AbuseRecordTypeMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateAbuseRecordType copyWith(
      {AbuseRecordTypeCountAggregateOutputType? $count,
      AbuseRecordTypeCountAggregateOutputType? count,
      AbuseRecordTypeMinAggregateOutputType? $min,
      AbuseRecordTypeMinAggregateOutputType? min,
      AbuseRecordTypeMaxAggregateOutputType? $max,
      AbuseRecordTypeMaxAggregateOutputType? max}) {
    return AggregateAbuseRecordType(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
