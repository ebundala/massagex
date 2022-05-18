import 'device_where_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DeviceRelationFilter extends Equatable {
  final DeviceWhereInput? is$;
  final DeviceWhereInput? isNot;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (is$ != null) {
      is$!.getFilesVariables(
          field_name: '${field_name}_is', variables: variables);
    }

    if (isNot != null) {
      isNot!.getFilesVariables(
          field_name: '${field_name}_isNot', variables: variables);
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
      if (is$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'is'),
          value: is$!.toValueNode(field_name: '${field_name}_is'),
        ),
      if (isNot != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'isNot'),
          value: isNot!.toValueNode(field_name: '${field_name}_isNot'),
        )
    ]);
  }

  DeviceRelationFilter({this.is$, this.isNot});

  static DeviceRelationFilter fromJson(Map<dynamic, dynamic> json) {
    return DeviceRelationFilter(
      is$: json['is'] != null ? DeviceWhereInput.fromJson(json['is']) : null,
      isNot: json['isNot'] != null
          ? DeviceWhereInput.fromJson(json['isNot'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (is$ != null) _data['is'] = is$!.toJson();
    if (isNot != null) _data['isNot'] = isNot!.toJson();
    return _data;
  }

  DeviceRelationFilter copyWith(
      {DeviceWhereInput? is$, DeviceWhereInput? isNot}) {
    return DeviceRelationFilter(
        is$: is$ ?? this.is$, isNot: isNot ?? this.isNot);
  }

  List<Object?> get props => [is$, isNot];
}
