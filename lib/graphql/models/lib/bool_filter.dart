import 'nested_bool_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BoolFilter extends Equatable {
  final bool? equals;
  final NestedBoolFilter? not;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (not != null) {
      not!.getFilesVariables(
          field_name: '${field_name}_not', variables: variables);
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
          value: ast.BooleanValueNode(value: equals!),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        )
    ]);
  }

  BoolFilter({this.equals, this.not});

  static BoolFilter fromJson(Map<dynamic, dynamic> json) {
    return BoolFilter(
      equals: json['equals'],
      not: json['not'] != null ? NestedBoolFilter.fromJson(json['not']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals;
    if (not != null) _data['not'] = not!.toJson();
    return _data;
  }

  BoolFilter copyWith({bool? equals, NestedBoolFilter? not}) {
    return BoolFilter(equals: equals ?? this.equals, not: not ?? this.not);
  }

  List<Object?> get props => [equals, not];
}
