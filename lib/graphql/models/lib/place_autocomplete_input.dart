import 'lat_lng_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PlaceAutocompleteInput extends Equatable {
  final String input;
  final String? sessiontoken;
  final int? offset;
  final LatLngInput? origin;
  final LatLngInput? location;
  final double? radius;
  final String? language;
  final String? types;
  final List<String>? components;
  final bool? strictbounds;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (origin != null) {
      origin!.getFilesVariables(
          field_name: '${field_name}_origin', variables: variables);
    }

    if (location != null) {
      location!.getFilesVariables(
          field_name: '${field_name}_location', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input'),
        value: ast.StringValueNode(value: '${input}', isBlock: false),
      ),
      if (sessiontoken != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'sessiontoken'),
          value: ast.StringValueNode(value: '${sessiontoken!}', isBlock: false),
        ),
      if (offset != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'offset'),
          value: ast.IntValueNode(value: '${offset!}'),
        ),
      if (origin != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'origin'),
          value: origin!.toValueNode(field_name: '${field_name}_origin'),
        ),
      if (location != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'location'),
          value: location!.toValueNode(field_name: '${field_name}_location'),
        ),
      if (radius != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'radius'),
          value: ast.FloatValueNode(value: '${radius!}'),
        ),
      if (language != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'language'),
          value: ast.StringValueNode(value: '${language!}', isBlock: false),
        ),
      if (types != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'types'),
          value: ast.StringValueNode(value: '${types!}', isBlock: false),
        ),
      if (components != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'components'),
            value: ast.ListValueNode(
              values: [
                ...components!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.StringValueNode(value: e, isBlock: false)];
                })
              ],
            )),
      if (strictbounds != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'strictbounds'),
          value: ast.BooleanValueNode(value: strictbounds!),
        )
    ]);
  }

  PlaceAutocompleteInput(
      {required this.input,
      this.sessiontoken,
      this.offset,
      this.origin,
      this.location,
      this.radius,
      this.language,
      this.types,
      this.components,
      this.strictbounds});

  static PlaceAutocompleteInput fromJson(Map<dynamic, dynamic> json) {
    return PlaceAutocompleteInput(
      input: json['input'],
      sessiontoken: json['sessiontoken'],
      offset: json['offset'],
      origin:
          json['origin'] != null ? LatLngInput.fromJson(json['origin']) : null,
      location: json['location'] != null
          ? LatLngInput.fromJson(json['location'])
          : null,
      radius: json['radius']?.toDouble(),
      language: json['language'],
      types: json['types'],
      components: json['components'] != null
          ? List.generate(json['components'].length,
              (index) => json['components'][index] as String)
          : null,
      strictbounds: json['strictbounds'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['input'] = input;
    if (sessiontoken != null) _data['sessiontoken'] = sessiontoken;
    if (offset != null) _data['offset'] = offset;
    if (origin != null) _data['origin'] = origin!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (radius != null) _data['radius'] = radius;
    if (language != null) _data['language'] = language;
    if (types != null) _data['types'] = types;
    if (components != null) _data['components'] = components;
    if (strictbounds != null) _data['strictbounds'] = strictbounds;
    return _data;
  }

  PlaceAutocompleteInput copyWith(
      {String? input,
      String? sessiontoken,
      int? offset,
      LatLngInput? origin,
      LatLngInput? location,
      double? radius,
      String? language,
      String? types,
      List<String>? components,
      bool? strictbounds}) {
    return PlaceAutocompleteInput(
        input: input ?? this.input,
        sessiontoken: sessiontoken ?? this.sessiontoken,
        offset: offset ?? this.offset,
        origin: origin ?? this.origin,
        location: location ?? this.location,
        radius: radius ?? this.radius,
        language: language ?? this.language,
        types: types ?? this.types,
        components: components ?? this.components,
        strictbounds: strictbounds ?? this.strictbounds);
  }

  List<Object?> get props => [
        input,
        sessiontoken,
        offset,
        origin,
        location,
        radius,
        language,
        types,
        List.from(components ?? []),
        strictbounds
      ];
}
