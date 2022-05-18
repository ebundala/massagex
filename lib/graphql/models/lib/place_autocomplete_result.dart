import 'prediction_term.dart';
import 'prediction_substring.dart';
import 'structured_formatting.dart';

import "package:equatable/equatable.dart";

class PlaceAutocompleteResult extends Equatable {
  final String? description;
  final double? distance$meters;
  final String? place$id;
  final List<PredictionTerm>? terms;
  final List<String>? types;
  final List<PredictionSubstring>? matched$substrings;
  final StructuredFormatting? structured$formatting;
  PlaceAutocompleteResult(
      {this.description,
      this.distance$meters,
      this.place$id,
      this.terms,
      this.types,
      this.matched$substrings,
      this.structured$formatting});

  static PlaceAutocompleteResult fromJson(Map<dynamic, dynamic> json) {
    return PlaceAutocompleteResult(
      description: json['description'],
      distance$meters: json['distance_meters']?.toDouble(),
      place$id: json['place_id'],
      terms: json['terms'] != null
          ? List.generate(json['terms'].length,
              (index) => PredictionTerm.fromJson(json['terms'][index]))
          : null,
      types: json['types'] != null
          ? List.generate(
              json['types'].length, (index) => json['types'][index] as String)
          : null,
      matched$substrings: json['matched_substrings'] != null
          ? List.generate(
              json['matched_substrings'].length,
              (index) => PredictionSubstring.fromJson(
                  json['matched_substrings'][index]))
          : null,
      structured$formatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (description != null) _data['description'] = description;
    if (distance$meters != null) _data['distance_meters'] = distance$meters;
    if (place$id != null) _data['place_id'] = place$id;
    if (terms != null)
      _data['terms'] =
          List.generate(terms?.length ?? 0, (index) => terms![index].toJson());
    if (types != null) _data['types'] = types;
    if (matched$substrings != null)
      _data['matched_substrings'] = List.generate(
          matched$substrings?.length ?? 0,
          (index) => matched$substrings![index].toJson());
    if (structured$formatting != null)
      _data['structured_formatting'] = structured$formatting!.toJson();
    return _data;
  }

  PlaceAutocompleteResult copyWith(
      {String? description,
      double? distance$meters,
      String? place$id,
      List<PredictionTerm>? terms,
      List<String>? types,
      List<PredictionSubstring>? matched$substrings,
      StructuredFormatting? structured$formatting}) {
    return PlaceAutocompleteResult(
        description: description ?? this.description,
        distance$meters: distance$meters ?? this.distance$meters,
        place$id: place$id ?? this.place$id,
        terms: terms ?? this.terms,
        types: types ?? this.types,
        matched$substrings: matched$substrings ?? this.matched$substrings,
        structured$formatting:
            structured$formatting ?? this.structured$formatting);
  }

  List<Object?> get props => [
        description,
        distance$meters,
        place$id,
        List.from(terms ?? []),
        List.from(types ?? []),
        List.from(matched$substrings ?? []),
        structured$formatting
      ];
}
