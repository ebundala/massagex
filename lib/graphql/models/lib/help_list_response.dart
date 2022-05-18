import 'help.dart';

import "package:equatable/equatable.dart";

class HelpListResponse extends Equatable {
  final bool? status;
  final List<Help>? data;
  final String? message;
  HelpListResponse({this.status, this.data, this.message});

  static HelpListResponse fromJson(Map<dynamic, dynamic> json) {
    return HelpListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Help.fromJson(json['data'][index]))
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

  HelpListResponse copyWith({bool? status, List<Help>? data, String? message}) {
    return HelpListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
