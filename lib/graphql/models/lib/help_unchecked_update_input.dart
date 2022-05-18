import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_role_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'help_step_unchecked_update_many_without_help_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpUncheckedUpdateInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? topic;
  final NullableStringFieldUpdateOperationsInput? description;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumRoleFieldUpdateOperationsInput? audience;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final HelpStepUncheckedUpdateManyWithoutHelpInput? steps;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (topic != null) {
      topic!.getFilesVariables(
          field_name: '${field_name}_topic', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (audience != null) {
      audience!.getFilesVariables(
          field_name: '${field_name}_audience', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (topic != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'topic'),
          value: topic!.toValueNode(field_name: '${field_name}_topic'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (audience != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'audience'),
          value: audience!.toValueNode(field_name: '${field_name}_audience'),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: createdAt!.toValueNode(field_name: '${field_name}_createdAt'),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: updatedAt!.toValueNode(field_name: '${field_name}_updatedAt'),
        ),
      if (steps != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'steps'),
          value: steps!.toValueNode(field_name: '${field_name}_steps'),
        )
    ]);
  }

  HelpUncheckedUpdateInput(
      {this.id,
      this.topic,
      this.description,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt,
      this.steps});

  static HelpUncheckedUpdateInput fromJson(Map<dynamic, dynamic> json) {
    return HelpUncheckedUpdateInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      topic: json['topic'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['topic'])
          : null,
      description: json['description'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      audience: json['audience'] != null
          ? EnumRoleFieldUpdateOperationsInput.fromJson(json['audience'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      steps: json['steps'] != null
          ? HelpStepUncheckedUpdateManyWithoutHelpInput.fromJson(json['steps'])
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
    if (steps != null) _data['steps'] = steps!.toJson();
    return _data;
  }

  HelpUncheckedUpdateInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? topic,
      NullableStringFieldUpdateOperationsInput? description,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumRoleFieldUpdateOperationsInput? audience,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      HelpStepUncheckedUpdateManyWithoutHelpInput? steps}) {
    return HelpUncheckedUpdateInput(
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
