import 'record_status.dart';
import 'role.dart';
import 'help_step_create_nested_many_without_help_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpCreateInput extends Equatable {
  final String? id;
  final String topic;
  final String? description;
  final RecordStatus? recordStatus;
  final Role? audience;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final HelpStepCreateNestedManyWithoutHelpInput? steps;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (steps != null) {
      steps!.getFilesVariables(
          field_name: '${field_name}_steps', variables: variables);
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
        name: ast.NameNode(value: 'topic'),
        value: ast.StringValueNode(value: '${topic}', isBlock: false),
      ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.StringValueNode(value: '${description!}', isBlock: false),
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
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        ),
      if (steps != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'steps'),
          value: steps!.toValueNode(field_name: '${field_name}_steps'),
        )
    ]);
  }

  HelpCreateInput(
      {this.id,
      required this.topic,
      this.description,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt,
      this.steps});

  static HelpCreateInput fromJson(Map<dynamic, dynamic> json) {
    return HelpCreateInput(
      id: json['id'],
      topic: json['topic'],
      description: json['description'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      audience:
          json['audience'] != null ? RoleExt.fromJson(json['audience']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      steps: json['steps'] != null
          ? HelpStepCreateNestedManyWithoutHelpInput.fromJson(json['steps'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['topic'] = topic;
    if (description != null) _data['description'] = description;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (audience != null) _data['audience'] = audience!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (steps != null) _data['steps'] = steps!.toJson();
    return _data;
  }

  HelpCreateInput copyWith(
      {String? id,
      String? topic,
      String? description,
      RecordStatus? recordStatus,
      Role? audience,
      DateTime? createdAt,
      DateTime? updatedAt,
      HelpStepCreateNestedManyWithoutHelpInput? steps}) {
    return HelpCreateInput(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        audience: audience ?? this.audience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        steps: steps ?? this.steps);
  }

  List<Object?> get props => [
        id,
        topic,
        description,
        recordStatus,
        audience,
        createdAt,
        updatedAt,
        steps
      ];
}
