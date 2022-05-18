import 'aggregate_help.dart';

import "package:equatable/equatable.dart";

class AggregateHelpResponse extends Equatable {
  final bool? status;
  final AggregateHelp? data;
  final String? message;
  AggregateHelpResponse({this.status, this.data, this.message});

  static AggregateHelpResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateHelpResponse(
      status: json['status'],
      data: json['data'] != null ? AggregateHelp.fromJson(json['data']) : null,
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

  AggregateHelpResponse copyWith(
      {bool? status, AggregateHelp? data, String? message}) {
    return AggregateHelpResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
