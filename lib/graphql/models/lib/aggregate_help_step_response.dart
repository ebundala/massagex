import 'aggregate_help_step.dart';

import "package:equatable/equatable.dart";

class AggregateHelpStepResponse extends Equatable {
  final bool? status;
  final AggregateHelpStep? data;
  final String? message;
  AggregateHelpStepResponse({this.status, this.data, this.message});

  static AggregateHelpStepResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateHelpStepResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateHelpStep.fromJson(json['data'])
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

  AggregateHelpStepResponse copyWith(
      {bool? status, AggregateHelpStep? data, String? message}) {
    return AggregateHelpStepResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
