import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseRecordTypeOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? name;

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
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.EnumValueNode(name: ast.NameNode(value: name!.toJson())),
        )
    ]);
  }

  AbuseRecordTypeOrderByInput({this.id, this.name});

  static AbuseRecordTypeOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return AbuseRecordTypeOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      name: json['name'] != null ? SortOrderExt.fromJson(json['name']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    return _data;
  }

  AbuseRecordTypeOrderByInput copyWith({SortOrder? id, SortOrder? name}) {
    return AbuseRecordTypeOrderByInput(
        id: id ?? this.id, name: name ?? this.name);
  }

  List<Object?> get props => [id, name];
}
