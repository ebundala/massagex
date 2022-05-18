import 'service.dart';

import "package:equatable/equatable.dart";

class ServiceResponse extends Equatable {
  final bool? status;
  final Service? data;
  final String? message;
  ServiceResponse({this.status, this.data, this.message});

  static ServiceResponse fromJson(Map<dynamic, dynamic> json) {
    return ServiceResponse(
      status: json['status'],
      data: json['data'] != null ? Service.fromJson(json['data']) : null,
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

  ServiceResponse copyWith({bool? status, Service? data, String? message}) {
    return ServiceResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
