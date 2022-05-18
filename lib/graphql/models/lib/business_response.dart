import 'business.dart';

import "package:equatable/equatable.dart";

class BusinessResponse extends Equatable {
  final bool? status;
  final Business? data;
  final String? message;
  BusinessResponse({this.status, this.data, this.message});

  static BusinessResponse fromJson(Map<dynamic, dynamic> json) {
    return BusinessResponse(
      status: json['status'],
      data: json['data'] != null ? Business.fromJson(json['data']) : null,
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

  BusinessResponse copyWith({bool? status, Business? data, String? message}) {
    return BusinessResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
