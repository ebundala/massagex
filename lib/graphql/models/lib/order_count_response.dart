import "package:equatable/equatable.dart";

class OrderCountResponse extends Equatable {
  final bool? status;
  final int? data;
  final String? message;
  OrderCountResponse({this.status, this.data, this.message});

  static OrderCountResponse fromJson(Map<dynamic, dynamic> json) {
    return OrderCountResponse(
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

  OrderCountResponse copyWith({bool? status, int? data, String? message}) {
    return OrderCountResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
