import 'place_autocomplete_response_data.dart';

import "package:equatable/equatable.dart";

class PlaceAutocompleteResponse extends Equatable {
  final bool? status;
  final String? message;
  final PlaceAutocompleteResponseData? data;
  PlaceAutocompleteResponse({this.status, this.message, this.data});

  static PlaceAutocompleteResponse fromJson(Map<dynamic, dynamic> json) {
    return PlaceAutocompleteResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? PlaceAutocompleteResponseData.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (status != null) _data['status'] = status;
    if (message != null) _data['message'] = message;
    if (data != null) _data['data'] = data!.toJson();
    return _data;
  }

  PlaceAutocompleteResponse copyWith(
      {bool? status, String? message, PlaceAutocompleteResponseData? data}) {
    return PlaceAutocompleteResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data);
  }

  List<Object?> get props => [status, message, data];
}
