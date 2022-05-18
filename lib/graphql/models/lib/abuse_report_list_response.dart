import 'abuse_report.dart';

import "package:equatable/equatable.dart";

class AbuseReportListResponse extends Equatable {
  final bool? status;
  final List<AbuseReport>? data;
  final String? message;
  AbuseReportListResponse({this.status, this.data, this.message});

  static AbuseReportListResponse fromJson(Map<dynamic, dynamic> json) {
    return AbuseReportListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => AbuseReport.fromJson(json['data'][index]))
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

  AbuseReportListResponse copyWith(
      {bool? status, List<AbuseReport>? data, String? message}) {
    return AbuseReportListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
