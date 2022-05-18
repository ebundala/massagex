import 'casbin_rule.dart';

import "package:equatable/equatable.dart";

class CasbinRuleResponse extends Equatable {
  final bool? status;
  final CasbinRule? data;
  final String? message;
  CasbinRuleResponse({this.status, this.data, this.message});

  static CasbinRuleResponse fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleResponse(
      status: json['status'],
      data: json['data'] != null ? CasbinRule.fromJson(json['data']) : null,
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

  CasbinRuleResponse copyWith(
      {bool? status, CasbinRule? data, String? message}) {
    return CasbinRuleResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
