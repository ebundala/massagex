import 'device.dart';

import "package:equatable/equatable.dart";

class DeviceResponse extends Equatable {
  final bool? status;
  final Device? data;
  final String? message;
  DeviceResponse({this.status, this.data, this.message});

  static DeviceResponse fromJson(Map<dynamic, dynamic> json) {
    return DeviceResponse(
      status: json['status'],
      data: json['data'] != null ? Device.fromJson(json['data']) : null,
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

  DeviceResponse copyWith({bool? status, Device? data, String? message}) {
    return DeviceResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
