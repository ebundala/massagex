import 'selcom_disbursement.dart';

import "package:equatable/equatable.dart";

class SelcomDisbursementResponse extends Equatable {
  final bool? status;
  final SelcomDisbursement? data;
  final String? message;
  SelcomDisbursementResponse({this.status, this.data, this.message});

  static SelcomDisbursementResponse fromJson(Map<dynamic, dynamic> json) {
    return SelcomDisbursementResponse(
      status: json['status'],
      data: json['data'] != null
          ? SelcomDisbursement.fromJson(json['data'])
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

  SelcomDisbursementResponse copyWith(
      {bool? status, SelcomDisbursement? data, String? message}) {
    return SelcomDisbursementResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
