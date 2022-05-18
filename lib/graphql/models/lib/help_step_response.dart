import 'help_step.dart';

import "package:equatable/equatable.dart";

class HelpStepResponse extends Equatable {
  final bool? status;
  final HelpStep? data;
  final String? message;
  HelpStepResponse({this.status, this.data, this.message});

  static HelpStepResponse fromJson(Map<dynamic, dynamic> json) {
    return HelpStepResponse(
      status: json['status'],
      data: json['data'] != null ? HelpStep.fromJson(json['data']) : null,
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

  HelpStepResponse copyWith({bool? status, HelpStep? data, String? message}) {
    return HelpStepResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
