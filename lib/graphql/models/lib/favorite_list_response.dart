import 'favorite.dart';

import "package:equatable/equatable.dart";

class FavoriteListResponse extends Equatable {
  final bool? status;
  final List<Favorite>? data;
  final String? message;
  FavoriteListResponse({this.status, this.data, this.message});

  static FavoriteListResponse fromJson(Map<dynamic, dynamic> json) {
    return FavoriteListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Favorite.fromJson(json['data'][index]))
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

  FavoriteListResponse copyWith(
      {bool? status, List<Favorite>? data, String? message}) {
    return FavoriteListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
