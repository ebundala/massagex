import 'batch_payload.dart';

import "package:equatable/equatable.dart";

class AttachmentBatchResponse extends Equatable {
  final bool? status;
  final BatchPayload? data;
  final String? message;
  AttachmentBatchResponse({this.status, this.data, this.message});

  static AttachmentBatchResponse fromJson(Map<dynamic, dynamic> json) {
    return AttachmentBatchResponse(
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

  AttachmentBatchResponse copyWith(
      {bool? status, BatchPayload? data, String? message}) {
    return AttachmentBatchResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
