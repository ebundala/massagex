import 'scalars/json_object.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CategoryUncheckedCreateWithoutServicesInput extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final String? pictureId;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'name'),
        value: ast.StringValueNode(value: '${name}', isBlock: false),
      ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.StringValueNode(value: '${description!}', isBlock: false),
        ),
      if (pictureId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'pictureId'),
          value: ast.StringValueNode(value: '${pictureId!}', isBlock: false),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        )
    ]);
  }

  CategoryUncheckedCreateWithoutServicesInput(
      {this.id,
      required this.name,
      this.description,
      this.pictureId,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static CategoryUncheckedCreateWithoutServicesInput fromJson(
      Map<dynamic, dynamic> json) {
    return CategoryUncheckedCreateWithoutServicesInput(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (pictureId != null) _data['pictureId'] = pictureId;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  CategoryUncheckedCreateWithoutServicesInput copyWith(
      {String? id,
      String? name,
      String? description,
      String? pictureId,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return CategoryUncheckedCreateWithoutServicesInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, name, description, pictureId, metadata, createdAt, updatedAt];
}
