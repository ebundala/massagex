import 'aggregate_selcom_payment.dart';

import "package:equatable/equatable.dart";

class AggregateSelcomPaymentResponse extends Equatable {
  final bool? status;
  final AggregateSelcomPayment? data;
  final String? message;
  AggregateSelcomPaymentResponse({this.status, this.data, this.message});

  static AggregateSelcomPaymentResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateSelcomPaymentResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateSelcomPayment.fromJson(json['data'])
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

  AggregateSelcomPaymentResponse copyWith(
      {bool? status, AggregateSelcomPayment? data, String? message}) {
    return AggregateSelcomPaymentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
