import 'aggregate_review.dart';

import "package:equatable/equatable.dart";

class AggregateReviewResponse extends Equatable {
  final bool? status;
  final AggregateReview? data;
  final String? message;
  AggregateReviewResponse({this.status, this.data, this.message});

  static AggregateReviewResponse fromJson(Map<dynamic, dynamic> json) {
    return AggregateReviewResponse(
      status: json['status'],
      data:
          json['data'] != null ? AggregateReview.fromJson(json['data']) : null,
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

  AggregateReviewResponse copyWith(
      {bool? status, AggregateReview? data, String? message}) {
    return AggregateReviewResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
