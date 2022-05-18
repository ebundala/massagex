import 'casbin_rule.dart';

import "package:equatable/equatable.dart";

class CasbinRuleListResponse extends Equatable {
  final bool? status;
  final List<CasbinRule>? data;
  final String? message;
  CasbinRuleListResponse({this.status, this.data, this.message});

  static CasbinRuleListResponse fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => CasbinRule.fromJson(json['data'][index]))
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

  CasbinRuleListResponse copyWith(
      {bool? status, List<CasbinRule>? data, String? message}) {
    return CasbinRuleListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
