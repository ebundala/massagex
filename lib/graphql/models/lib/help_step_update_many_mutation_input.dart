import 'string_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepUpdateManyMutationInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final IntFieldUpdateOperationsInput? stepNumber;
  final StringFieldUpdateOperationsInput? title;
  final NullableStringFieldUpdateOperationsInput? description;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (stepNumber != null) {
      stepNumber!.getFilesVariables(
          field_name: '${field_name}_stepNumber', variables: variables);
    }

    if (title != null) {
      title!.getFilesVariables(
          field_name: '${field_name}_title', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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
      if (stepNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'stepNumber'),
          value:
              stepNumber!.toValueNode(field_name: '${field_name}_stepNumber'),
        ),
      if (title != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'title'),
          value: title!.toValueNode(field_name: '${field_name}_title'),
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
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: createdAt!.toValueNode(field_name: '${field_name}_createdAt'),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: updatedAt!.toValueNode(field_name: '${field_name}_updatedAt'),
        )
    ]);
  }

  HelpStepUpdateManyMutationInput(
      {this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static HelpStepUpdateManyMutationInput fromJson(Map<dynamic, dynamic> json) {
    return HelpStepUpdateManyMutationInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      stepNumber: json['stepNumber'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['stepNumber'])
          : null,
      title: json['title'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['title'])
          : null,
      description: json['description'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (stepNumber != null) _data['stepNumber'] = stepNumber!.toJson();
    if (title != null) _data['title'] = title!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  HelpStepUpdateManyMutationInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      IntFieldUpdateOperationsInput? stepNumber,
      StringFieldUpdateOperationsInput? title,
      NullableStringFieldUpdateOperationsInput? description,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt}) {
    return HelpStepUpdateManyMutationInput(
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, stepNumber, title, description, recordStatus, createdAt, updatedAt];
}