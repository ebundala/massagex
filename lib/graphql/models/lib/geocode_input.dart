import 'lat_lng_bounds_input.dart';
import 'geocode_components_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class GeocodeInput extends Equatable {
  final String? place$id;
  final String? address;
  final LatLngBoundsInput? bounds;
  final String? language;
  final String? region;
  final GeocodeComponentsInput? components;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (bounds != null) {
      bounds!.getFilesVariables(
          field_name: '${field_name}_bounds', variables: variables);
    }

    if (components != null) {
      components!.getFilesVariables(
          field_name: '${field_name}_components', variables: variables);
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
      if (address != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'address'),
          value: ast.StringValueNode(value: '${address!}', isBlock: false),
        ),
      if (bounds != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'bounds'),
          value: bounds!.toValueNode(field_name: '${field_name}_bounds'),
        ),
      if (language != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'language'),
          value: ast.StringValueNode(value: '${language!}', isBlock: false),
        ),
      if (region != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'region'),
          value: ast.StringValueNode(value: '${region!}', isBlock: false),
        ),
      if (components != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'components'),
          value:
              components!.toValueNode(field_name: '${field_name}_components'),
        )
    ]);
  }

  GeocodeInput(
      {this.place$id,
      this.address,
      this.bounds,
      this.language,
      this.region,
      this.components});

  static GeocodeInput fromJson(Map<dynamic, dynamic> json) {
    return GeocodeInput(
      place$id: json['place_id'],
      address: json['address'],
      bounds: json['bounds'] != null
          ? LatLngBoundsInput.fromJson(json['bounds'])
          : null,
      language: json['language'],
      region: json['region'],
      components: json['components'] != null
          ? GeocodeComponentsInput.fromJson(json['components'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (place$id != null) _data['place_id'] = place$id;
    if (address != null) _data['address'] = address;
    if (bounds != null) _data['bounds'] = bounds!.toJson();
    if (language != null) _data['language'] = language;
    if (region != null) _data['region'] = region;
    if (components != null) _data['components'] = components!.toJson();
    return _data;
  }

  GeocodeInput copyWith(
      {String? place$id,
      String? address,
      LatLngBoundsInput? bounds,
      String? language,
      String? region,
      GeocodeComponentsInput? components}) {
    return GeocodeInput(
        place$id: place$id ?? this.place$id,
        address: address ?? this.address,
        bounds: bounds ?? this.bounds,
        language: language ?? this.language,
        region: region ?? this.region,
        components: components ?? this.components);
  }

  List<Object?> get props =>
      [place$id, address, bounds, language, region, components];
}
