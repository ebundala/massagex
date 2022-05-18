import 'directions_response_data.dart';

import "package:equatable/equatable.dart";

class RouteResponse extends Equatable {
  final bool? status;
  final String? message;
  final DirectionsResponseData? data;
  RouteResponse({this.status, this.message, this.data});

  static RouteResponse fromJson(Map<dynamic, dynamic> json) {
    return RouteResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? DirectionsResponseData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (message != null) _data['message'] = message;
    if (data != null) _data['data'] = data!.toJson();
    return _data;
  }

  RouteResponse copyWith(
      {bool? status, String? message, DirectionsResponseData? data}) {
    return RouteResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [status, message, data];
}
