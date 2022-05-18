import 'help_step.dart';

import "package:equatable/equatable.dart";

class HelpStepListResponse extends Equatable {
  final bool? status;
  final List<HelpStep>? data;
  final String? message;
  HelpStepListResponse({this.status, this.data, this.message});

  static HelpStepListResponse fromJson(Map<dynamic, dynamic> json) {
    return HelpStepListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => HelpStep.fromJson(json['data'][index]))
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

  HelpStepListResponse copyWith(
      {bool? status, List<HelpStep>? data, String? message}) {
    return HelpStepListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
