import 'user.dart';

import "package:equatable/equatable.dart";

class UserListResponse extends Equatable {
  final bool? status;
  final List<User>? data;
  final String? message;
  UserListResponse({this.status, this.data, this.message});

  static UserListResponse fromJson(Map<dynamic, dynamic> json) {
    return UserListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => User.fromJson(json['data'][index]))
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

  UserListResponse copyWith({bool? status, List<User>? data, String? message}) {
    return UserListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
