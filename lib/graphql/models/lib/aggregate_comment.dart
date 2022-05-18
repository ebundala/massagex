import 'comment_count_aggregate_output_type.dart';
import 'comment_min_aggregate_output_type.dart';
import 'comment_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateComment extends Equatable {
  final CommentCountAggregateOutputType? $count;
  final CommentCountAggregateOutputType? count;
  final CommentMinAggregateOutputType? $min;
  final CommentMinAggregateOutputType? min;
  final CommentMaxAggregateOutputType? $max;
  final CommentMaxAggregateOutputType? max;
  AggregateComment(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateComment fromJson(Map<dynamic, dynamic> json) {
    return AggregateComment(
      $count: json['_count'] != null
          ? CommentCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? CommentCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? CommentMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? CommentMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? CommentMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? CommentMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateComment copyWith(
      {CommentCountAggregateOutputType? $count,
      CommentCountAggregateOutputType? count,
      CommentMinAggregateOutputType? $min,
      CommentMinAggregateOutputType? min,
      CommentMaxAggregateOutputType? $max,
      CommentMaxAggregateOutputType? max}) {
    return AggregateComment(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
