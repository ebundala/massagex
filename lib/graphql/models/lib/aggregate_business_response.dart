import 'aggregate_business.dart';

import "package:equatable/equatable.dart";

class AggregateBusinessResponse extends Equatable {
  final bool? status;
  final AggregateBusiness? data;
  final String? message;
  AggregateBusinessResponse({this.status, this.data, this.message});

  static AggregateBusinessResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateBusinessResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateBusiness.fromJson(json['data'])
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

  AggregateBusinessResponse copyWith(
      {bool? status, AggregateBusiness? data, String? message}) {
    return AggregateBusinessResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
