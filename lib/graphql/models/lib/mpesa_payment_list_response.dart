import 'mpesa_payment.dart';

import "package:equatable/equatable.dart";

class MpesaPaymentListResponse extends Equatable {
  final bool? status;
  final List<MpesaPayment>? data;
  final String? message;
  MpesaPaymentListResponse({this.status, this.data, this.message});

  static MpesaPaymentListResponse fromJson(Map<dynamic, dynamic> json) {
    return MpesaPaymentListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => MpesaPayment.fromJson(json['data'][index]))
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

  MpesaPaymentListResponse copyWith(
      {bool? status, List<MpesaPayment>? data, String? message}) {
    return MpesaPaymentListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
