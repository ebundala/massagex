import 'payment_method_count_aggregate_output_type.dart';
import 'payment_method_min_aggregate_output_type.dart';
import 'payment_method_max_aggregate_output_type.dart';

import "package:equatable/equatable.dart";

class AggregatePaymentMethod extends Equatable {
  final PaymentMethodCountAggregateOutputType? $count;
  final PaymentMethodCountAggregateOutputType? count;
  final PaymentMethodMinAggregateOutputType? $min;
  final PaymentMethodMinAggregateOutputType? min;
  final PaymentMethodMaxAggregateOutputType? $max;
  final PaymentMethodMaxAggregateOutputType? max;
  AggregatePaymentMethod(
      {this.$count, this.count, this.$min, this.min, this.$max, this.max});

  static AggregatePaymentMethod fromJson(Map<dynamic, dynamic> json) {
    return AggregatePaymentMethod(
      $count: json['_count'] != null
          ? PaymentMethodCountAggregateOutputType.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? PaymentMethodCountAggregateOutputType.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? PaymentMethodMinAggregateOutputType.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? PaymentMethodMinAggregateOutputType.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? PaymentMethodMaxAggregateOutputType.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? PaymentMethodMaxAggregateOutputType.fromJson(json['max'])
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

  AggregatePaymentMethod copyWith(
      {PaymentMethodCountAggregateOutputType? $count,
      PaymentMethodCountAggregateOutputType? count,
      PaymentMethodMinAggregateOutputType? $min,
      PaymentMethodMinAggregateOutputType? min,
      PaymentMethodMaxAggregateOutputType? $max,
      PaymentMethodMaxAggregateOutputType? max}) {
    return AggregatePaymentMethod(
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [$count, count, $min, min, $max, max];
}
