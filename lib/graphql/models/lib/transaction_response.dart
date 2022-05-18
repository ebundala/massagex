import 'transaction.dart';

import "package:equatable/equatable.dart";

class TransactionResponse extends Equatable {
  final bool? status;
  final Transaction? data;
  final String? message;
  TransactionResponse({this.status, this.data, this.message});

  static TransactionResponse fromJson(Map<dynamic, dynamic> json) {
    return TransactionResponse(
      status: json['status'],
      data: json['data'] != null ? Transaction.fromJson(json['data']) : null,
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

  TransactionResponse copyWith(
      {bool? status, Transaction? data, String? message}) {
    return TransactionResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
