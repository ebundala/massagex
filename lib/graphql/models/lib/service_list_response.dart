import 'service.dart';

import "package:equatable/equatable.dart";

class ServiceListResponse extends Equatable {
  final bool? status;
  final List<Service>? data;
  final String? message;
  ServiceListResponse({this.status, this.data, this.message});

  static ServiceListResponse fromJson(Map<dynamic, dynamic> json) {
    return ServiceListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Service.fromJson(json['data'][index]))
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

  ServiceListResponse copyWith(
      {bool? status, List<Service>? data, String? message}) {
    return ServiceListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
