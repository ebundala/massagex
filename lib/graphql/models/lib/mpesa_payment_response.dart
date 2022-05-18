import 'mpesa_payment.dart';

import "package:equatable/equatable.dart";

class MpesaPaymentResponse extends Equatable {
  final bool? status;
  final MpesaPayment? data;
  final String? message;
  MpesaPaymentResponse({this.status, this.data, this.message});

  static MpesaPaymentResponse fromJson(Map<dynamic, dynamic> json) {
    return MpesaPaymentResponse(
      status: json['status'],
      data: json['data'] != null ? MpesaPayment.fromJson(json['data']) : null,
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

  MpesaPaymentResponse copyWith(
      {bool? status, MpesaPayment? data, String? message}) {
    return MpesaPaymentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
