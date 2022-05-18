import 'aggregate_abuse_record_type.dart';

import "package:equatable/equatable.dart";

class AggregateAbuseRecordTypeResponse extends Equatable {
  final bool? status;
  final AggregateAbuseRecordType? data;
  final String? message;
  AggregateAbuseRecordTypeResponse({this.status, this.data, this.message});

  static AggregateAbuseRecordTypeResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateAbuseRecordTypeResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateAbuseRecordType.fromJson(json['data'])
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

  AggregateAbuseRecordTypeResponse copyWith(
      {bool? status, AggregateAbuseRecordType? data, String? message}) {
    return AggregateAbuseRecordTypeResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
