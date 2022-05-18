import 'geocode_result.dart';

import "package:equatable/equatable.dart";

class GeocodeResponseData extends Equatable {
  final List<GeocodeResult>? results;
  GeocodeResponseData({this.results});

  static GeocodeResponseData fromJson(Map<dynamic, dynamic> json) {
    return GeocodeResponseData(
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

  GeocodeResponseData copyWith({List<GeocodeResult>? results}) {
    return GeocodeResponseData(results: results ?? this.results);
  }

  List<Object?> get props => [List.from(results ?? [])];
}
