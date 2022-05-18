import 'lat_lng_input.dart';
import 'language.dart';
import 'reverse_geocoding_location_type.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReverseGeocodeInput extends Equatable {
  final String? place$id;
  final LatLngInput? latlng;
  final Language? language;
  final List<String>? result$type;
  final List<ReverseGeocodingLocationType>? location$type;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (latlng != null) {
      latlng!.getFilesVariables(
          field_name: '${field_name}_latlng', variables: variables);
    }

    return variables;
  }

  List<ast.VariableDefinitionNode> getVariableDefinitionsNodes({
    required Map<String, dynamic> variables,
  }) {
    final List<ast.VariableDefinitionNode> vars = [];
    variables.forEach((key, value) {
      vars.add(ast.VariableDefinitionNode(
        variable: ast.VariableNode(name: ast.NameNode(value: key)),
        type: ast.NamedTypeNode(
            name: ast.NameNode(value: 'Upload'), isNonNull: true),
        defaultValue: ast.DefaultValueNode(value: null),
        directives: [],
      ));
    });
    return vars;
  }

  ast.ObjectValueNode toValueNode({required String field_name}) {
    return ast.ObjectValueNode(fields: [
      if (place$id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'place_id'),
          value: ast.StringValueNode(value: '${place$id!}', isBlock: false),
        ),
      if (latlng != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'latlng'),
          value: latlng!.toValueNode(field_name: '${field_name}_latlng'),
        ),
      if (language != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'language'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: language!.toJson())),
        ),
      if (result$type != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'result_type'),
            value: ast.ListValueNode(
              values: [
                ...result$type!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.StringValueNode(value: e, isBlock: false)];
                })
              ],
            )),
      if (location$type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'location_type'),
          value: ast.ListValueNode(
            values: [
              ...location$type!.fold([], (v, e) {
                // ignore: unused_local_variable
                int i = v.length;
                return [
                  ...v,
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        )
    ]);
  }

  ReverseGeocodeInput(
      {this.place$id,
      this.latlng,
      this.language,
      this.result$type,
      this.location$type});

  static ReverseGeocodeInput fromJson(Map<dynamic, dynamic> json) {
    return ReverseGeocodeInput(
      place$id: json['place_id'],
      latlng:
          json['latlng'] != null ? LatLngInput.fromJson(json['latlng']) : null,
      language: json['language'] != null
          ? LanguageExt.fromJson(json['language'])
          : null,
      result$type: json['result_type'] != null
          ? List.generate(json['result_type'].length,
              (index) => json['result_type'][index] as String)
          : null,
      location$type: json['location_type'] != null
          ? List.generate(
              json['location_type'].length,
              (index) => ReverseGeocodingLocationTypeExt.fromJson(
                  json['location_type'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (place$id != null) _data['place_id'] = place$id;
    if (latlng != null) _data['latlng'] = latlng!.toJson();
    if (language != null) _data['language'] = language!.toJson();
    if (result$type != null) _data['result_type'] = result$type;
    if (location$type != null)
      _data['location_type'] = List.generate(location$type?.length ?? 0,
          (index) => location$type![index].toJson());
    return _data;
  }

  ReverseGeocodeInput copyWith(
      {String? place$id,
      LatLngInput? latlng,
      Language? language,
      List<String>? result$type,
      List<ReverseGeocodingLocationType>? location$type}) {
    return ReverseGeocodeInput(
        place$id: place$id ?? this.place$id,
        latlng: latlng ?? this.latlng,
        language: language ?? this.language,
        result$type: result$type ?? this.result$type,
        location$type: location$type ?? this.location$type);
  }

  List<Object?> get props => [
        place$id,
        latlng,
        language,
        List.from(result$type ?? []),
        List.from(location$type ?? [])
      ];
}
