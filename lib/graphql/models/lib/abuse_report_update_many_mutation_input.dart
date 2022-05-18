import 'string_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_abuse_report_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseReportUpdateManyMutationInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final IntFieldUpdateOperationsInput? number;
  final NullableStringFieldUpdateOperationsInput? report;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumAbuseReportStatusFieldUpdateOperationsInput? state;
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

    if (number != null) {
      number!.getFilesVariables(
          field_name: '${field_name}_number', variables: variables);
    }

    if (report != null) {
      report!.getFilesVariables(
          field_name: '${field_name}_report', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (state != null) {
      state!.getFilesVariables(
          field_name: '${field_name}_state', variables: variables);
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
      if (number != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'number'),
          value: number!.toValueNode(field_name: '${field_name}_number'),
        ),
      if (report != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'report'),
          value: report!.toValueNode(field_name: '${field_name}_report'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: state!.toValueNode(field_name: '${field_name}_state'),
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

  AbuseReportUpdateManyMutationInput(
      {this.id,
      this.number,
      this.report,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt});

  static AbuseReportUpdateManyMutationInput fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportUpdateManyMutationInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      number: json['number'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['number'])
          : null,
      report: json['report'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['report'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      state: json['state'] != null
          ? EnumAbuseReportStatusFieldUpdateOperationsInput.fromJson(
              json['state'])
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
    if (number != null) _data['number'] = number!.toJson();
    if (report != null) _data['report'] = report!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  AbuseReportUpdateManyMutationInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      IntFieldUpdateOperationsInput? number,
      NullableStringFieldUpdateOperationsInput? report,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumAbuseReportStatusFieldUpdateOperationsInput? state,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt}) {
    return AbuseReportUpdateManyMutationInput(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, number, report, recordStatus, state, createdAt, updatedAt];
}
