import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DeviceUpdateManyMutationInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final NullableStringFieldUpdateOperationsInput? fcm$id;
  final StringFieldUpdateOperationsInput? type;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (fcm$id != null) {
      fcm$id!.getFilesVariables(
          field_name: '${field_name}_fcm_id', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
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
      if (fcm$id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'fcm_id'),
          value: fcm$id!.toValueNode(field_name: '${field_name}_fcm_id'),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        )
    ]);
  }

  DeviceUpdateManyMutationInput(
      {this.id, this.fcm$id, this.type, this.recordStatus});

  static DeviceUpdateManyMutationInput fromJson(Map<dynamic, dynamic> json) {
    return DeviceUpdateManyMutationInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      fcm$id: json['fcm_id'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['fcm_id'])
          : null,
      type: json['type'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['type'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (fcm$id != null) _data['fcm_id'] = fcm$id!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    return _data;
  }

  DeviceUpdateManyMutationInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      NullableStringFieldUpdateOperationsInput? fcm$id,
      StringFieldUpdateOperationsInput? type,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus}) {
    return DeviceUpdateManyMutationInput(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        recordStatus: recordStatus ?? this.recordStatus);
  }

  List<Object?> get props => [id, fcm$id, type, recordStatus];
}
