import 'review.dart';

import "package:equatable/equatable.dart";

class ReviewListResponse extends Equatable {
  final bool? status;
  final List<Review>? data;
  final String? message;
  ReviewListResponse({this.status, this.data, this.message});

  static ReviewListResponse fromJson(Map<dynamic, dynamic> json) {
    return ReviewListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Review.fromJson(json['data'][index]))
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

  ReviewListResponse copyWith(
      {bool? status, List<Review>? data, String? message}) {
    return ReviewListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
