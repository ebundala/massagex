import 'payment_method.dart';

import "package:equatable/equatable.dart";

class PaymentMethodListResponse extends Equatable {
  final bool? status;
  final List<PaymentMethod>? data;
  final String? message;
  PaymentMethodListResponse({this.status, this.data, this.message});

  static PaymentMethodListResponse fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => PaymentMethod.fromJson(json['data'][index]))
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (data != null)
      _data['data'] =
          List.generate(data?.length ?? 0, (index) => data![index].toJson());
    if (message != null) _data['message'] = message;
    return _data;
  }

  PaymentMethodListResponse copyWith(
      {bool? status, List<PaymentMethod>? data, String? message}) {
    return PaymentMethodListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
