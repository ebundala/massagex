import 'order.dart';

import "package:equatable/equatable.dart";

class OrderListResponse extends Equatable {
  final bool? status;
  final List<Order>? data;
  final String? message;
  OrderListResponse({this.status, this.data, this.message});

  static OrderListResponse fromJson(Map<dynamic, dynamic> json) {
    return OrderListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Order.fromJson(json['data'][index]))
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

  OrderListResponse copyWith(
      {bool? status, List<Order>? data, String? message}) {
    return OrderListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
