import 'review.dart';

import "package:equatable/equatable.dart";

class ReviewResponse extends Equatable {
  final bool? status;
  final Review? data;
  final String? message;
  ReviewResponse({this.status, this.data, this.message});

  static ReviewResponse fromJson(Map<dynamic, dynamic> json) {
    return ReviewResponse(
      status: json['status'],
      data: json['data'] != null ? Review.fromJson(json['data']) : null,
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

  ReviewResponse copyWith({bool? status, Review? data, String? message}) {
    return ReviewResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
