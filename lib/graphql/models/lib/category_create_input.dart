import 'scalars/json_object.dart';
import 'attachment_create_nested_one_without_categories_input.dart';
import 'service_create_nested_many_without_category_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CategoryCreateInput extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AttachmentCreateNestedOneWithoutCategoriesInput? picture;
  final ServiceCreateNestedManyWithoutCategoryInput? services;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (picture != null) {
      picture!.getFilesVariables(
          field_name: '${field_name}_picture', variables: variables);
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
      if (picture != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'picture'),
          value: picture!.toValueNode(field_name: '${field_name}_picture'),
        ),
      if (services != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'services'),
          value: services!.toValueNode(field_name: '${field_name}_services'),
        )
    ]);
  }

  CategoryCreateInput(
      {this.id,
      required this.name,
      this.description,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.picture,
      this.services});

  static CategoryCreateInput fromJson(Map<dynamic, dynamic> json) {
    return CategoryCreateInput(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      picture: json['picture'] != null
          ? AttachmentCreateNestedOneWithoutCategoriesInput.fromJson(
              json['picture'])
          : null,
      services: json['services'] != null
          ? ServiceCreateNestedManyWithoutCategoryInput.fromJson(
              json['services'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (picture != null) _data['picture'] = picture!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    return _data;
  }

  CategoryCreateInput copyWith(
      {String? id,
      String? name,
      String? description,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      AttachmentCreateNestedOneWithoutCategoriesInput? picture,
      ServiceCreateNestedManyWithoutCategoryInput? services}) {
    return CategoryCreateInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        picture: picture ?? this.picture,
        services: services ?? this.services);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        metadata,
        createdAt,
        updatedAt,
        picture,
        services
      ];
}
