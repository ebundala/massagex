import 'selcom_disbursement.dart';

import "package:equatable/equatable.dart";

class SelcomDisbursementListResponse extends Equatable {
  final bool? status;
  final List<SelcomDisbursement>? data;
  final String? message;
  SelcomDisbursementListResponse({this.status, this.data, this.message});

  static SelcomDisbursementListResponse fromJson(Map<dynamic, dynamic> json) {
    return SelcomDisbursementListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => SelcomDisbursement.fromJson(json['data'][index]))
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

  SelcomDisbursementListResponse copyWith(
      {bool? status, List<SelcomDisbursement>? data, String? message}) {
    return SelcomDisbursementListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
