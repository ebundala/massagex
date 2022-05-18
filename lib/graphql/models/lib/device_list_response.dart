import 'device.dart';

import "package:equatable/equatable.dart";

class DeviceListResponse extends Equatable {
  final bool? status;
  final List<Device>? data;
  final String? message;
  DeviceListResponse({this.status, this.data, this.message});

  static DeviceListResponse fromJson(Map<dynamic, dynamic> json) {
    return DeviceListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Device.fromJson(json['data'][index]))
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

  DeviceListResponse copyWith(
      {bool? status, List<Device>? data, String? message}) {
    return DeviceListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
