import 'aggregate_abuse_report.dart';

import "package:equatable/equatable.dart";

class AggregateAbuseReportResponse extends Equatable {
  final bool? status;
  final AggregateAbuseReport? data;
  final String? message;
  AggregateAbuseReportResponse({this.status, this.data, this.message});

  static AggregateAbuseReportResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateAbuseReportResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateAbuseReport.fromJson(json['data'])
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

  AggregateAbuseReportResponse copyWith(
      {bool? status, AggregateAbuseReport? data, String? message}) {
    return AggregateAbuseReportResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
