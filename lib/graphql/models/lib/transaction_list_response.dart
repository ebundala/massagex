import 'transaction.dart';

import "package:equatable/equatable.dart";

class TransactionListResponse extends Equatable {
  final bool? status;
  final List<Transaction>? data;
  final String? message;
  TransactionListResponse({this.status, this.data, this.message});

  static TransactionListResponse fromJson(Map<dynamic, dynamic> json) {
    return TransactionListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Transaction.fromJson(json['data'][index]))
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

  TransactionListResponse copyWith(
      {bool? status, List<Transaction>? data, String? message}) {
    return TransactionListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
