import 'mpesa_payment_count_aggregate_output_type.dart';
import 'mpesa_payment_min_aggregate_output_type.dart';
import 'mpesa_payment_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregateMpesaPayment extends Equatable {
  final MpesaPaymentCountAggregateOutputType? $count;
  final MpesaPaymentCountAggregateOutputType? count;
  final MpesaPaymentMinAggregateOutputType? $min;
  final MpesaPaymentMinAggregateOutputType? min;
  final MpesaPaymentMaxAggregateOutputType? $max;
  final MpesaPaymentMaxAggregateOutputType? max;
  AggregateMpesaPayment(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregateMpesaPayment fromJson(Map<dynamic, dynamic> json) {
    return AggregateMpesaPayment(
      $count: json['_count'] != null
          ? MpesaPaymentCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? MpesaPaymentCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? MpesaPaymentMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? MpesaPaymentMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? MpesaPaymentMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? MpesaPaymentMaxAggregateOutputType.fromJson(json['max'])
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

  AggregateMpesaPayment copyWith(
      {MpesaPaymentCountAggregateOutputType? $count,
      MpesaPaymentCountAggregateOutputType? count,
      MpesaPaymentMinAggregateOutputType? $min,
      MpesaPaymentMinAggregateOutputType? min,
      MpesaPaymentMaxAggregateOutputType? $max,
      MpesaPaymentMaxAggregateOutputType? max}) {
    return AggregateMpesaPayment(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
