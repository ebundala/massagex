import 'aggregate_order.dart';

import "package:equatable/equatable.dart";

class AggregateOrderResponse extends Equatable {
  final bool? status;
  final AggregateOrder? data;
  final String? message;
  AggregateOrderResponse({this.status, this.data, this.message});

  static AggregateOrderResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateOrderResponse(
      status: json['status'],
      data: json['data'] != null ? AggregateOrder.fromJson(json['data']) : null,
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

  AggregateOrderResponse copyWith(
      {bool? status, AggregateOrder? data, String? message}) {
    return AggregateOrderResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
