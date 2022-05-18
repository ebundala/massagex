import 'aggregate_user.dart';

import "package:equatable/equatable.dart";

class AggregateUserResponse extends Equatable {
  final bool? status;
  final AggregateUser? data;
  final String? message;
  AggregateUserResponse({this.status, this.data, this.message});

  static AggregateUserResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateUserResponse(
      status: json['status'],
      data: json['data'] != null ? AggregateUser.fromJson(json['data']) : null,
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

  AggregateUserResponse copyWith(
      {bool? status, AggregateUser? data, String? message}) {
    return AggregateUserResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
