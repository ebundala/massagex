import 'aggregate_favorite_record_type.dart';

import "package:equatable/equatable.dart";

class AggregateFavoriteRecordTypeResponse extends Equatable {
  final bool? status;
  final AggregateFavoriteRecordType? data;
  final String? message;
  AggregateFavoriteRecordTypeResponse({this.status, this.data, this.message});

  static AggregateFavoriteRecordTypeResponse fromJson(
      Map<dynamic, dynamic> json) {
    return AggregateFavoriteRecordTypeResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateFavoriteRecordType.fromJson(json['data'])
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

  AggregateFavoriteRecordTypeResponse copyWith(
      {bool? status, AggregateFavoriteRecordType? data, String? message}) {
    return AggregateFavoriteRecordTypeResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
