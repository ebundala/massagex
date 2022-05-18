import 'transaction_count_aggregate_output_type.dart';
import 'transaction_min_aggregate_output_type.dart';
import 'transaction_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateTransaction extends Equatable {
  final TransactionCountAggregateOutputType? $count;
  final TransactionCountAggregateOutputType? count;
  final TransactionMinAggregateOutputType? $min;
  final TransactionMinAggregateOutputType? min;
  final TransactionMaxAggregateOutputType? $max;
  final TransactionMaxAggregateOutputType? max;
  AggregateTransaction(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateTransaction fromJson(Map<dynamic, dynamic> json) {
    return AggregateTransaction(
      $count: json['_count'] != null
          ? TransactionCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? TransactionCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? TransactionMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? TransactionMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? TransactionMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? TransactionMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateTransaction copyWith(
      {TransactionCountAggregateOutputType? $count,
      TransactionCountAggregateOutputType? count,
      TransactionMinAggregateOutputType? $min,
      TransactionMinAggregateOutputType? min,
      TransactionMaxAggregateOutputType? $max,
      TransactionMaxAggregateOutputType? max}) {
    return AggregateTransaction(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
