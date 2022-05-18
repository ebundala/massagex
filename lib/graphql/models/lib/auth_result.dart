import 'user.dart';

import "package:equatable/equatable.dart";

class AuthResult extends Equatable {
  final String? token;
  final bool? status;
  final String? message;
  final User? data;
  AuthResult({this.token, this.status, this.message, this.data});

  static AuthResult fromJson(Map<dynamic, dynamic> json) {
    return AuthResult(
      token: json['token'],
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (token != null) _data['token'] = token;
    if (status != null) _data['status'] = status;
    if (message != null) _data['message'] = message;
    if (data != null) _data['data'] = data!.toJson();
    return _data;
  }

  AuthResult copyWith(
      {String? token, bool? status, String? message, User? data}) {
    return AuthResult(
        token: token ?? this.token,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [token, status, message, data];
}
