import 'aggregate_transaction.dart';

import "package:equatable/equatable.dart";

class AggregateTransactionResponse extends Equatable {
  final bool? status;
  final AggregateTransaction? data;
  final String? message;
  AggregateTransactionResponse({this.status, this.data, this.message});

  static AggregateTransactionResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateTransactionResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateTransaction.fromJson(json['data'])
          : null,
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

  AggregateTransactionResponse copyWith(
      {bool? status, AggregateTransaction? data, String? message}) {
    return AggregateTransactionResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
