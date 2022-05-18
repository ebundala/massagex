import 'selcom_payment.dart';

import "package:equatable/equatable.dart";

class SelcomPaymentResponse extends Equatable {
  final bool? status;
  final SelcomPayment? data;
  final String? message;
  SelcomPaymentResponse({this.status, this.data, this.message});

  static SelcomPaymentResponse fromJson(Map<dynamic, dynamic> json) {
    return SelcomPaymentResponse(
      status: json['status'],
      data: json['data'] != null ? SelcomPayment.fromJson(json['data']) : null,
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

  SelcomPaymentResponse copyWith(
      {bool? status, SelcomPayment? data, String? message}) {
    return SelcomPaymentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
