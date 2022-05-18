import 'aggregate_mpesa_payment.dart';

import "package:equatable/equatable.dart";

class AggregateMpesaPaymentResponse extends Equatable {
  final bool? status;
  final AggregateMpesaPayment? data;
  final String? message;
  AggregateMpesaPaymentResponse({this.status, this.data, this.message});

  static AggregateMpesaPaymentResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateMpesaPaymentResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateMpesaPayment.fromJson(json['data'])
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

  AggregateMpesaPaymentResponse copyWith(
      {bool? status, AggregateMpesaPayment? data, String? message}) {
    return AggregateMpesaPaymentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
