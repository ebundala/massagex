import 'abuse_record_type.dart';

import "package:equatable/equatable.dart";

class AbuseRecordTypeResponse extends Equatable {
  final bool? status;
  final AbuseRecordType? data;
  final String? message;
  AbuseRecordTypeResponse({this.status, this.data, this.message});

  static AbuseRecordTypeResponse fromJson(Map<dynamic, dynamic> json) {
    return AbuseRecordTypeResponse(
      status: json['status'],
      data:
          json['data'] != null ? AbuseRecordType.fromJson(json['data']) : null,
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

  AbuseRecordTypeResponse copyWith(
      {bool? status, AbuseRecordType? data, String? message}) {
    return AbuseRecordTypeResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
