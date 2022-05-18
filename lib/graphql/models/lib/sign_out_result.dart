import "package:equatable/equatable.dart";

class SignOutResult extends Equatable {
  final bool? status;
  final String? message;
  SignOutResult({this.status, this.message});

  static SignOutResult fromJson(Map<dynamic, dynamic> json) {
    return SignOutResult(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (message != null) _data['message'] = message;
    return _data;
  }

  SignOutResult copyWith({bool? status, String? message}) {
    return SignOutResult(
        status: status ?? this.status, message: message ?? this.message);
  }

  List<Object?> get props => [status, message];
}
