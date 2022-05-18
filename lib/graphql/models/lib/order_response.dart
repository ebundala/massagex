import 'order.dart';

import "package:equatable/equatable.dart";

class OrderResponse extends Equatable {
  final bool? status;
  final Order? data;
  final String? message;
  OrderResponse({this.status, this.data, this.message});

  static OrderResponse fromJson(Map<dynamic, dynamic> json) {
    return OrderResponse(
      status: json['status'],
      data: json['data'] != null ? Order.fromJson(json['data']) : null,
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

  OrderResponse copyWith({bool? status, Order? data, String? message}) {
    return OrderResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
