import 'aggregate_favorite.dart';

import "package:equatable/equatable.dart";

class AggregateFavoriteResponse extends Equatable {
  final bool? status;
  final AggregateFavorite? data;
  final String? message;
  AggregateFavoriteResponse({this.status, this.data, this.message});

  static AggregateFavoriteResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateFavoriteResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateFavorite.fromJson(json['data'])
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

  AggregateFavoriteResponse copyWith(
      {bool? status, AggregateFavorite? data, String? message}) {
    return AggregateFavoriteResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
