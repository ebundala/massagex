import 'attachment_count_aggregate_output_type.dart';
import 'attachment_avg_aggregate_output_type.dart';
import 'attachment_sum_aggregate_output_type.dart';
import 'attachment_min_aggregate_output_type.dart';
import 'attachment_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateAttachment extends Equatable {
  final AttachmentCountAggregateOutputType? $count;
  final AttachmentCountAggregateOutputType? count;
  final AttachmentAvgAggregateOutputType? $avg;
  final AttachmentAvgAggregateOutputType? avg;
  final AttachmentSumAggregateOutputType? $sum;
  final AttachmentSumAggregateOutputType? sum;
  final AttachmentMinAggregateOutputType? $min;
  final AttachmentMinAggregateOutputType? min;
  final AttachmentMaxAggregateOutputType? $max;
  final AttachmentMaxAggregateOutputType? max;
  AggregateAttachment(
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

  static AggregateAttachment fromJson(Map<dynamic, dynamic> json) {
    return AggregateAttachment(
      $count: json['_count'] != null
          ? AttachmentCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? AttachmentCountAggregateOutputType.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? AttachmentAvgAggregateOutputType.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null
          ? AttachmentAvgAggregateOutputType.fromJson(json['avg'])
          : null,
      $sum: json['_sum'] != null
          ? AttachmentSumAggregateOutputType.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null
          ? AttachmentSumAggregateOutputType.fromJson(json['sum'])
          : null,
      $min: json['_min'] != null
          ? AttachmentMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? AttachmentMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? AttachmentMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? AttachmentMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateAttachment copyWith(
      {AttachmentCountAggregateOutputType? $count,
      AttachmentCountAggregateOutputType? count,
      AttachmentAvgAggregateOutputType? $avg,
      AttachmentAvgAggregateOutputType? avg,
      AttachmentSumAggregateOutputType? $sum,
      AttachmentSumAggregateOutputType? sum,
      AttachmentMinAggregateOutputType? $min,
      AttachmentMinAggregateOutputType? min,
      AttachmentMaxAggregateOutputType? $max,
      AttachmentMaxAggregateOutputType? max}) {
    return AggregateAttachment(
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
