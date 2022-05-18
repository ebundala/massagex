import 'location.dart';

import "package:equatable/equatable.dart";

class LocationListResponse extends Equatable {
  final bool? status;
  final List<Location>? data;
  final String? message;
  LocationListResponse({this.status, this.data, this.message});

  static LocationListResponse fromJson(Map<dynamic, dynamic> json) {
    return LocationListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Location.fromJson(json['data'][index]))
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

  LocationListResponse copyWith(
      {bool? status, List<Location>? data, String? message}) {
    return LocationListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
