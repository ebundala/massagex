import 'abuse_report.dart';

import "package:equatable/equatable.dart";

class AbuseReportResponse extends Equatable {
  final bool? status;
  final AbuseReport? data;
  final String? message;
  AbuseReportResponse({this.status, this.data, this.message});

  static AbuseReportResponse fromJson(Map<dynamic, dynamic> json) {
    return AbuseReportResponse(
      status: json['status'],
      data: json['data'] != null ? AbuseReport.fromJson(json['data']) : null,
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

  AbuseReportResponse copyWith(
      {bool? status, AbuseReport? data, String? message}) {
    return AbuseReportResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
