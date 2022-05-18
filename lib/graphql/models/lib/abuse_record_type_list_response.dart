import 'abuse_record_type.dart';

import "package:equatable/equatable.dart";

class AbuseRecordTypeListResponse extends Equatable {
  final bool? status;
  final List<AbuseRecordType>? data;
  final String? message;
  AbuseRecordTypeListResponse({this.status, this.data, this.message});

  static AbuseRecordTypeListResponse fromJson(Map<dynamic, dynamic> json) {
    return AbuseRecordTypeListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => AbuseRecordType.fromJson(json['data'][index]))
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

  AbuseRecordTypeListResponse copyWith(
      {bool? status, List<AbuseRecordType>? data, String? message}) {
    return AbuseRecordTypeListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
