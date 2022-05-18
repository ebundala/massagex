import 'aggregate_location.dart';

import "package:equatable/equatable.dart";

class AggregateLocationResponse extends Equatable {
  final bool? status;
  final AggregateLocation? data;
  final String? message;
  AggregateLocationResponse({this.status, this.data, this.message});

  static AggregateLocationResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateLocationResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateLocation.fromJson(json['data'])
          : null,
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

  AggregateLocationResponse copyWith(
      {bool? status, AggregateLocation? data, String? message}) {
    return AggregateLocationResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
