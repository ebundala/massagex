import 'geocode_response_data.dart';

import "package:equatable/equatable.dart";

class GeocodeResponse extends Equatable {
  final bool? status;
  final String? message;
  final GeocodeResponseData? data;
  GeocodeResponse({this.status, this.message, this.data});

  static GeocodeResponse fromJson(Map<dynamic, dynamic> json) {
    return GeocodeResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? GeocodeResponseData.fromJson(json['data'])
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

  GeocodeResponse copyWith(
      {bool? status, String? message, GeocodeResponseData? data}) {
    return GeocodeResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [status, message, data];
}
