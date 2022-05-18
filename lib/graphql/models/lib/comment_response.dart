import 'comment.dart';

import "package:equatable/equatable.dart";

class CommentResponse extends Equatable {
  final bool? status;
  final Comment? data;
  final String? message;
  CommentResponse({this.status, this.data, this.message});

  static CommentResponse fromJson(Map<dynamic, dynamic> json) {
    return CommentResponse(
      status: json['status'],
      data: json['data'] != null ? Comment.fromJson(json['data']) : null,
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

  CommentResponse copyWith({bool? status, Comment? data, String? message}) {
    return CommentResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
