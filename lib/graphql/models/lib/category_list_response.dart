import 'category.dart';

import "package:equatable/equatable.dart";

class CategoryListResponse extends Equatable {
  final bool? status;
  final List<Category>? data;
  final String? message;
  CategoryListResponse({this.status, this.data, this.message});

  static CategoryListResponse fromJson(Map<dynamic, dynamic> json) {
    return CategoryListResponse(
      status: json['status'],
      data: json['data'] != null
          ? List.generate(json['data'].length,
              (index) => Category.fromJson(json['data'][index]))
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

  CategoryListResponse copyWith(
      {bool? status, List<Category>? data, String? message}) {
    return CategoryListResponse(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message);
  }

  List<Object?> get props => [status, List.from(data ?? []), message];
}
