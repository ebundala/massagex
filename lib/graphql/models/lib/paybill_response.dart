import 'transaction.dart';

import "package:equatable/equatable.dart";

class PaybillResponse extends Equatable {
  final bool? status;
  final String? message;
  final Transaction? data;
  PaybillResponse({this.status, this.message, this.data});

  static PaybillResponse fromJson(Map<dynamic, dynamic> json) {
    return PaybillResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Transaction.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (message != null) _data['message'] = message;
    if (data != null) _data['data'] = data!.toJson();
    return _data;
  }

  PaybillResponse copyWith({bool? status, String? message, Transaction? data}) {
    return PaybillResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [status, message, data];
}
