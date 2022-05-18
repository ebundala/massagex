import 'lat_lng_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LatLngBoundsInput extends Equatable {
  final LatLngInput northeast;
  final LatLngInput southwest;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      northeast.getFilesVariables(
          field_name: '${field_name}_northeast', variables: variables);
    }

    {
      southwest.getFilesVariables(
          field_name: '${field_name}_southwest', variables: variables);
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
        name: ast.NameNode(value: 'northeast'),
        value: northeast.toValueNode(field_name: '${field_name}_northeast'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'southwest'),
        value: southwest.toValueNode(field_name: '${field_name}_southwest'),
      )
    ]);
  }

  LatLngBoundsInput({required this.northeast, required this.southwest});

  static LatLngBoundsInput fromJson(Map<dynamic, dynamic> json) {
    return LatLngBoundsInput(
      northeast: LatLngInput.fromJson(json['northeast']),
      southwest: LatLngInput.fromJson(json['southwest']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['northeast'] = northeast.toJson();

    _data['southwest'] = southwest.toJson();
    return _data;
  }

  LatLngBoundsInput copyWith({LatLngInput? northeast, LatLngInput? southwest}) {
    return LatLngBoundsInput(
        northeast: northeast ?? this.northeast,
        southwest: southwest ?? this.southwest);
  }

  List<Object?> get props => [northeast, southwest];
}
