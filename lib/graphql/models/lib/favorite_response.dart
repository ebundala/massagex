import 'favorite.dart';

import "package:equatable/equatable.dart";

class FavoriteResponse extends Equatable {
  final bool? status;
  final Favorite? data;
  final String? message;
  FavoriteResponse({this.status, this.data, this.message});

  static FavoriteResponse fromJson(Map<dynamic, dynamic> json) {
    return FavoriteResponse(
      status: json['status'],
      data: json['data'] != null ? Favorite.fromJson(json['data']) : null,
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

  FavoriteResponse copyWith({bool? status, Favorite? data, String? message}) {
    return FavoriteResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
