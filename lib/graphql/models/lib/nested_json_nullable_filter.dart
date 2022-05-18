import 'scalars/json_object.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedJsonNullableFilter extends Equatable {
  final JSONObject? equals;
  final JSONObject? not;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
      if (equals != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'equals'),
          value: equals!.toValueNode(field_name: '${field_name}_equals'),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        )
    ]);
  }

  NestedJsonNullableFilter({this.equals, this.not});

  static NestedJsonNullableFilter fromJson(Map<dynamic, dynamic> json) {
    return NestedJsonNullableFilter(
      equals:
          json['equals'] != null ? JSONObject.fromJson(json['equals']) : null,
      not: json['not'] != null ? JSONObject.fromJson(json['not']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals!.toJson();
    if (not != null) _data['not'] = not!.toJson();
    return _data;
  }

  NestedJsonNullableFilter copyWith({JSONObject? equals, JSONObject? not}) {
    return NestedJsonNullableFilter(
        equals: equals ?? this.equals, not: not ?? this.not);
  }

  List<Object?> get props => [equals, not];
}
