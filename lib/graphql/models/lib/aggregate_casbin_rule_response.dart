import 'aggregate_casbin_rule.dart';

import "package:equatable/equatable.dart";

class AggregateCasbinRuleResponse extends Equatable {
  final bool? status;
  final AggregateCasbinRule? data;
  final String? message;
  AggregateCasbinRuleResponse({this.status, this.data, this.message});

  static AggregateCasbinRuleResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateCasbinRuleResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateCasbinRule.fromJson(json['data'])
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

  AggregateCasbinRuleResponse copyWith(
      {bool? status, AggregateCasbinRule? data, String? message}) {
    return AggregateCasbinRuleResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
