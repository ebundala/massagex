import 'business.dart';

import "package:equatable/equatable.dart";

class BusinessListResponse extends Equatable {
  final bool? status;
  final List<Business>? data;
  final String? message;
  BusinessListResponse({this.status, this.data, this.message});

  static BusinessListResponse fromJson(Map<dynamic, dynamic> json) {
    return BusinessListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Business.fromJson(json['data'][index]))
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

  BusinessListResponse copyWith(
      {bool? status, List<Business>? data, String? message}) {
    return BusinessListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
