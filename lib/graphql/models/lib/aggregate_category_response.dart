import 'aggregate_category.dart';

import "package:equatable/equatable.dart";

class AggregateCategoryResponse extends Equatable {
  final bool? status;
  final AggregateCategory? data;
  final String? message;
  AggregateCategoryResponse({this.status, this.data, this.message});

  static AggregateCategoryResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateCategoryResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateCategory.fromJson(json['data'])
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

  AggregateCategoryResponse copyWith(
      {bool? status, AggregateCategory? data, String? message}) {
    return AggregateCategoryResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
