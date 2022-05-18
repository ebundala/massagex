import 'address_component.dart';
import 'address_geometry.dart';
import 'plus_code.dart';

import "package:equatable/equatable.dart";

class GeocodeResult extends Equatable {
  final List<String>? types;
  final String? formatted$address;
  final List<AddressComponent>? address$components;
  final List<String>? postcode$localities;
  final AddressGeometry? geometry;
  final PlusCode? plus$code;
  final bool? partial$match;
  final String? place$id;
  GeocodeResult(
      {this.types,
      this.formatted$address,
      this.address$components,
      this.postcode$localities,
      this.geometry,
      this.plus$code,
      this.partial$match,
      this.place$id});

  static GeocodeResult fromJson(Map<dynamic, dynamic> json) {
    return GeocodeResult(
      types: json['types'] != null
          ? List.generate(
              json['types'].length, (index) => json['types'][index] as String)
          : null,
      formatted$address: json['formatted_address'],
      address$components: json['address_components'] != null
          ? List.generate(
              json['address_components'].length,
              (index) =>
                  AddressComponent.fromJson(json['address_components'][index]))
          : null,
      postcode$localities: json['postcode_localities'] != null
          ? List.generate(json['postcode_localities'].length,
              (index) => json['postcode_localities'][index] as String)
          : null,
      geometry: json['geometry'] != null
          ? AddressGeometry.fromJson(json['geometry'])
          : null,
      plus$code: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
      partial$match: json['partial_match'],
      place$id: json['place_id'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (types != null) _data['types'] = types;
    if (formatted$address != null)
      _data['formatted_address'] = formatted$address;
    if (address$components != null)
      _data['address_components'] = List.generate(
          address$components?.length ?? 0,
          (index) => address$components![index].toJson());
    if (postcode$localities != null)
      _data['postcode_localities'] = postcode$localities;
    if (geometry != null) _data['geometry'] = geometry!.toJson();
    if (plus$code != null) _data['plus_code'] = plus$code!.toJson();
    if (partial$match != null) _data['partial_match'] = partial$match;
    if (place$id != null) _data['place_id'] = place$id;
    return _data;
  }

  GeocodeResult copyWith(
      {List<String>? types,
      String? formatted$address,
      List<AddressComponent>? address$components,
      List<String>? postcode$localities,
      AddressGeometry? geometry,
      PlusCode? plus$code,
      bool? partial$match,
      String? place$id}) {
    return GeocodeResult(
        types: types ?? this.types,
        formatted$address: formatted$address ?? this.formatted$address,
        address$components: address$components ?? this.address$components,
        postcode$localities: postcode$localities ?? this.postcode$localities,
        geometry: geometry ?? this.geometry,
        plus$code: plus$code ?? this.plus$code,
        partial$match: partial$match ?? this.partial$match,
        place$id: place$id ?? this.place$id);
  }

  List<Object?> get props => [
        List.from(types ?? []),
        formatted$address,
        List.from(address$components ?? []),
        List.from(postcode$localities ?? []),
        geometry,
        plus$code,
        partial$match,
        place$id
      ];
}
