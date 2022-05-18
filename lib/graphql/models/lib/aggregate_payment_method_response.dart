import 'aggregate_payment_method.dart';

import "package:equatable/equatable.dart";

class AggregatePaymentMethodResponse extends Equatable {
  final bool? status;
  final AggregatePaymentMethod? data;
  final String? message;
  AggregatePaymentMethodResponse({this.status, this.data, this.message});

  static AggregatePaymentMethodResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregatePaymentMethodResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregatePaymentMethod.fromJson(json['data'])
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (data != null) _data['data'] = data!.toJson();
    if (message != null) _data['message'] = message;
    return _data;
  }

  AggregatePaymentMethodResponse copyWith(
      {bool? status, AggregatePaymentMethod? data, String? message}) {
    return AggregatePaymentMethodResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
