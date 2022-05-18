import 'place_autocomplete_result.dart';

import "package:equatable/equatable.dart";

class PlaceAutocompleteResponseData extends Equatable {
  final List<PlaceAutocompleteResult>? predictions;
  PlaceAutocompleteResponseData({this.predictions});

  static PlaceAutocompleteResponseData fromJson(Map<dynamic, dynamic> json) {
    return PlaceAutocompleteResponseData(
      predictions: json['predictions'] != null
          ? List.generate(
              json['predictions'].length,
              (index) =>
                  PlaceAutocompleteResult.fromJson(json['predictions'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (predictions != null)
      _data['predictions'] = List.generate(
          predictions?.length ?? 0, (index) => predictions![index].toJson());
    return _data;
  }

  PlaceAutocompleteResponseData copyWith(
      {List<PlaceAutocompleteResult>? predictions}) {
    return PlaceAutocompleteResponseData(
        predictions: predictions ?? this.predictions);
  }

  List<Object?> get props => [List.from(predictions ?? [])];
}
