import 'aggregate_service.dart';

import "package:equatable/equatable.dart";

class AggregateServiceResponse extends Equatable {
  final bool? status;
  final AggregateService? data;
  final String? message;
  AggregateServiceResponse({this.status, this.data, this.message});

  static AggregateServiceResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateServiceResponse(
      status: json['status'],
      data:
          json['data'] != null ? AggregateService.fromJson(json['data']) : null,
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

  AggregateServiceResponse copyWith(
      {bool? status, AggregateService? data, String? message}) {
    return AggregateServiceResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
