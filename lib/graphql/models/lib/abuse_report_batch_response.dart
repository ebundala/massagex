import 'batch_payload.dart';

import "package:equatable/equatable.dart";

class AbuseReportBatchResponse extends Equatable {
  final bool? status;
  final BatchPayload? data;
  final String? message;
  AbuseReportBatchResponse({this.status, this.data, this.message});

  static AbuseReportBatchResponse fromJson(Map<dynamic, dynamic> json) {
    return AbuseReportBatchResponse(
      status: json['status'],
      data: json['data'] != null ? BatchPayload.fromJson(json['data']) : null,
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

  AbuseReportBatchResponse copyWith(
      {bool? status, BatchPayload? data, String? message}) {
    return AbuseReportBatchResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
