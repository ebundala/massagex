import 'category.dart';

import "package:equatable/equatable.dart";

class CategoryResponse extends Equatable {
  final bool? status;
  final Category? data;
  final String? message;
  CategoryResponse({this.status, this.data, this.message});

  static CategoryResponse fromJson(Map<dynamic, dynamic> json) {
    return CategoryResponse(
      status: json['status'],
      data: json['data'] != null ? Category.fromJson(json['data']) : null,
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

  CategoryResponse copyWith({bool? status, Category? data, String? message}) {
    return CategoryResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, data, message];
}
