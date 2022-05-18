import 'location.dart';

import "package:equatable/equatable.dart";

class LocationResponse extends Equatable {
  final bool? status;
  final Location? data;
  final String? message;
  LocationResponse({this.status, this.data, this.message});

  static LocationResponse fromJson(Map<dynamic, dynamic> json) {
    return LocationResponse(
      status: json['status'],
      data: json['data'] != null ? Location.fromJson(json['data']) : null,
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

  LocationResponse copyWith({bool? status, Location? data, String? message}) {
    return LocationResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
