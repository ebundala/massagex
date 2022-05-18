import "package:equatable/equatable.dart";

class UserCountResponse extends Equatable {
  final bool? status;
  final int? data;
  final String? message;
  UserCountResponse({this.status, this.data, this.message});

  static UserCountResponse fromJson(Map<dynamic, dynamic> json) {
    return UserCountResponse(
      status: json['status'],
      data: json['data'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (data != null) _data['data'] = data;
    if (message != null) _data['message'] = message;
    return _data;
  }

  UserCountResponse copyWith({bool? status, int? data, String? message}) {
    return UserCountResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
