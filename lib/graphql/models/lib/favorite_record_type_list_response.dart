import 'favorite_record_type.dart';

import "package:equatable/equatable.dart";

class FavoriteRecordTypeListResponse extends Equatable {
  final bool? status;
  final List<FavoriteRecordType>? data;
  final String? message;
  FavoriteRecordTypeListResponse({this.status, this.data, this.message});

  static FavoriteRecordTypeListResponse fromJson(Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => FavoriteRecordType.fromJson(json['data'][index]))
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

  FavoriteRecordTypeListResponse copyWith(
      {bool? status, List<FavoriteRecordType>? data, String? message}) {
    return FavoriteRecordTypeListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
