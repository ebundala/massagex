import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? topic;
  final SortOrder? description;
  final SortOrder? recordStatus;
  final SortOrder? audience;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

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
      if (topic != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'topic'),
          value: ast.EnumValueNode(name: ast.NameNode(value: topic!.toJson())),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: description!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (audience != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'audience'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: audience!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        )
    ]);
  }

  HelpOrderByInput(
      {this.id,
      this.topic,
      this.description,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt});

  static HelpOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return HelpOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      topic:
          json['topic'] != null ? SortOrderExt.fromJson(json['topic']) : null,
      description: json['description'] != null
          ? SortOrderExt.fromJson(json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      audience: json['audience'] != null
          ? SortOrderExt.fromJson(json['audience'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (topic != null) _data['topic'] = topic!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (audience != null) _data['audience'] = audience!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  HelpOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? topic,
      SortOrder? description,
      SortOrder? recordStatus,
      SortOrder? audience,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return HelpOrderByInput(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        audience: audience ?? this.audience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, topic, description, recordStatus, audience, createdAt, updatedAt];
}
