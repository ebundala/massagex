import 'geocode_result.dart';

import "package:equatable/equatable.dart";

class ReverseGeocodeResponseData extends Equatable {
  final List<GeocodeResult>? results;
  ReverseGeocodeResponseData({this.results});

  static ReverseGeocodeResponseData fromJson(Map<dynamic, dynamic> json) {
    return ReverseGeocodeResponseData(
      results: json['results'] != null
          ? List.generate(json['results'].length,
              (index) => GeocodeResult.fromJson(json['results'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (results != null)
      _data['results'] = List.generate(
          results?.length ?? 0, (index) => results![index].toJson());
    return _data;
  }

  ReverseGeocodeResponseData copyWith({List<GeocodeResult>? results}) {
    return ReverseGeocodeResponseData(results: results ?? this.results);
  }

  List<Object?> get props => [List.from(results ?? [])];
}
