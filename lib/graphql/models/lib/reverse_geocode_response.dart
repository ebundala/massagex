import 'reverse_geocode_response_data.dart';

import "package:equatable/equatable.dart";

class ReverseGeocodeResponse extends Equatable {
  final bool? status;
  final String? message;
  final ReverseGeocodeResponseData? data;
  ReverseGeocodeResponse({this.status, this.message, this.data});

  static ReverseGeocodeResponse fromJson(Map<dynamic, dynamic> json) {
    return ReverseGeocodeResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? ReverseGeocodeResponseData.fromJson(json['data'])
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

  ReverseGeocodeResponse copyWith(
      {bool? status, String? message, ReverseGeocodeResponseData? data}) {
    return ReverseGeocodeResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [status, message, data];
}
