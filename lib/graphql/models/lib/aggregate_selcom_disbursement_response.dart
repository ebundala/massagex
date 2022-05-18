import 'aggregate_selcom_disbursement.dart';

import "package:equatable/equatable.dart";

class AggregateSelcomDisbursementResponse extends Equatable {
  final bool? status;
  final AggregateSelcomDisbursement? data;
  final String? message;
  AggregateSelcomDisbursementResponse({this.status, this.data, this.message});

  static AggregateSelcomDisbursementResponse fromJson(
      Map<dynamic, dynamic> json) {
    return AggregateSelcomDisbursementResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateSelcomDisbursement.fromJson(json['data'])
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

  AggregateSelcomDisbursementResponse copyWith(
      {bool? status, AggregateSelcomDisbursement? data, String? message}) {
    return AggregateSelcomDisbursementResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
