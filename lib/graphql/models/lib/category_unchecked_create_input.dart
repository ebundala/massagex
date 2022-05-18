import 'scalars/json_object.dart';
import 'service_unchecked_create_nested_many_without_category_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CategoryUncheckedCreateInput extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final String? pictureId;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceUncheckedCreateNestedManyWithoutCategoryInput? services;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (services != null) {
      services!.getFilesVariables(
          field_name: '${field_name}_services', variables: variables);
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
        ),
      if (services != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'services'),
          value: services!.toValueNode(field_name: '${field_name}_services'),
        )
    ]);
  }

  CategoryUncheckedCreateInput(
      {this.id,
      required this.name,
      this.description,
      this.pictureId,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.services});

  static CategoryUncheckedCreateInput fromJson(Map<dynamic, dynamic> json) {
    return CategoryUncheckedCreateInput(
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
      services: json['services'] != null
          ? ServiceUncheckedCreateNestedManyWithoutCategoryInput.fromJson(
              json['services'])
          : null,
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
    if (services != null) _data['services'] = services!.toJson();
    return _data;
  }

  CategoryUncheckedCreateInput copyWith(
      {String? id,
      String? name,
      String? description,
      String? pictureId,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      ServiceUncheckedCreateNestedManyWithoutCategoryInput? services}) {
    return CategoryUncheckedCreateInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        services: services ?? this.services);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        pictureId,
        metadata,
        createdAt,
        updatedAt,
        services
      ];
}
