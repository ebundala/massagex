import 'selcom_payment.dart';

import "package:equatable/equatable.dart";

class SelcomPaymentListResponse extends Equatable {
  final bool? status;
  final List<SelcomPayment>? data;
  final String? message;
  SelcomPaymentListResponse({this.status, this.data, this.message});

  static SelcomPaymentListResponse fromJson(Map<dynamic, dynamic> json) {
    return SelcomPaymentListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => SelcomPayment.fromJson(json['data'][index]))
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

  SelcomPaymentListResponse copyWith(
      {bool? status, List<SelcomPayment>? data, String? message}) {
    return SelcomPaymentListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
