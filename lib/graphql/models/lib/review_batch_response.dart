import 'batch_payload.dart';

import "package:equatable/equatable.dart";

class ReviewBatchResponse extends Equatable {
  final bool? status;
  final BatchPayload? data;
  final String? message;
  ReviewBatchResponse({this.status, this.data, this.message});

  static ReviewBatchResponse fromJson(Map<dynamic, dynamic> json) {
    return ReviewBatchResponse(
      status: json['status'],
      data: json['data'] != null ? BatchPayload.fromJson(json['data']) : null,
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

  ReviewBatchResponse copyWith(
      {bool? status, BatchPayload? data, String? message}) {
    return ReviewBatchResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
