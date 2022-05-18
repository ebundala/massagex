import 'aggregate_attachment.dart';

import "package:equatable/equatable.dart";

class AggregateAttachmentResponse extends Equatable {
  final bool? status;
  final AggregateAttachment? data;
  final String? message;
  AggregateAttachmentResponse({this.status, this.data, this.message});

  static AggregateAttachmentResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateAttachmentResponse(
      status: json['status'],
      data: json['data'] != null
          ? AggregateAttachment.fromJson(json['data'])
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

  AggregateAttachmentResponse copyWith(
      {bool? status, AggregateAttachment? data, String? message}) {
    return AggregateAttachmentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
