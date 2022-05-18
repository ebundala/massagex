import 'favorite_record_type.dart';

import "package:equatable/equatable.dart";

class FavoriteRecordTypeResponse extends Equatable {
  final bool? status;
  final FavoriteRecordType? data;
  final String? message;
  FavoriteRecordTypeResponse({this.status, this.data, this.message});

  static FavoriteRecordTypeResponse fromJson(Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeResponse(
      status: json['status'],
      data: json['data'] != null
          ? FavoriteRecordType.fromJson(json['data'])
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

  FavoriteRecordTypeResponse copyWith(
      {bool? status, FavoriteRecordType? data, String? message}) {
    return FavoriteRecordTypeResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
