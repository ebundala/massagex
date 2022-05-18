import 'attachment.dart';

import "package:equatable/equatable.dart";

class AttachmentListResponse extends Equatable {
  final bool? status;
  final List<Attachment>? data;
  final String? message;
  AttachmentListResponse({this.status, this.data, this.message});

  static AttachmentListResponse fromJson(Map<dynamic, dynamic> json) {
    return AttachmentListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Attachment.fromJson(json['data'][index]))
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

  AttachmentListResponse copyWith(
      {bool? status, List<Attachment>? data, String? message}) {
    return AttachmentListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
