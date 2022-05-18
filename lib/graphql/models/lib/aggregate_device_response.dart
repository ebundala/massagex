import 'aggregate_device.dart';

import "package:equatable/equatable.dart";

class AggregateDeviceResponse extends Equatable {
  final bool? status;
  final AggregateDevice? data;
  final String? message;
  AggregateDeviceResponse({this.status, this.data, this.message});

  static AggregateDeviceResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateDeviceResponse(
      status: json['status'],
      data:
          json['data'] != null ? AggregateDevice.fromJson(json['data']) : null,
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

  AggregateDeviceResponse copyWith(
      {bool? status, AggregateDevice? data, String? message}) {
    return AggregateDeviceResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
