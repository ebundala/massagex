import 'user.dart';

import "package:equatable/equatable.dart";

class UserResponse extends Equatable {
  final bool? status;
  final User? data;
  final String? message;
  UserResponse({this.status, this.data, this.message});

  static UserResponse fromJson(Map<dynamic, dynamic> json) {
    return UserResponse(
      status: json['status'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
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

  UserResponse copyWith({bool? status, User? data, String? message}) {
    return UserResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
