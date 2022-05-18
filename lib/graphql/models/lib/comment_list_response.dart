import 'comment.dart';

import "package:equatable/equatable.dart";

class CommentListResponse extends Equatable {
  final bool? status;
  final List<Comment>? data;
  final String? message;
  CommentListResponse({this.status, this.data, this.message});

  static CommentListResponse fromJson(Map<dynamic, dynamic> json) {
    return CommentListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Comment.fromJson(json['data'][index]))
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

  CommentListResponse copyWith(
      {bool? status, List<Comment>? data, String? message}) {
    return CommentListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
