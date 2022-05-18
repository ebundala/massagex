import 'payment_method.dart';

import "package:equatable/equatable.dart";

class PaymentMethodResponse extends Equatable {
  final bool? status;
  final PaymentMethod? data;
  final String? message;
  PaymentMethodResponse({this.status, this.data, this.message});

  static PaymentMethodResponse fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodResponse(
      status: json['status'],
      data: json['data'] != null ? PaymentMethod.fromJson(json['data']) : null,
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

  PaymentMethodResponse copyWith(
      {bool? status, PaymentMethod? data, String? message}) {
    return PaymentMethodResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
