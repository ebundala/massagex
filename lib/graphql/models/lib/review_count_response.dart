import "package:equatable/equatable.dart";

class ReviewCountResponse extends Equatable {
  final bool? status;
  final int? data;
  final String? message;
  ReviewCountResponse({this.status, this.data, this.message});

  static ReviewCountResponse fromJson(Map<dynamic, dynamic> json) {
    return ReviewCountResponse(
      status: json['status'],
      data: json['data'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (data != null) _data['data'] = data;
    if (message != null) _data['message'] = message;
    return _data;
  }

  ReviewCountResponse copyWith({bool? status, int? data, String? message}) {
    return ReviewCountResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
