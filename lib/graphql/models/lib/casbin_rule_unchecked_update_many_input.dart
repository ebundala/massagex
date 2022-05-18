import 'int_field_update_operations_input.dart';
import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CasbinRuleUncheckedUpdateManyInput extends Equatable {
  final IntFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? ptype;
  final NullableStringFieldUpdateOperationsInput? v0;
  final NullableStringFieldUpdateOperationsInput? v1;
  final NullableStringFieldUpdateOperationsInput? v2;
  final NullableStringFieldUpdateOperationsInput? v3;
  final NullableStringFieldUpdateOperationsInput? v4;
  final NullableStringFieldUpdateOperationsInput? v5;
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

    if (ptype != null) {
      ptype!.getFilesVariables(
          field_name: '${field_name}_ptype', variables: variables);
    }

    if (v0 != null) {
      v0!.getFilesVariables(
          field_name: '${field_name}_v0', variables: variables);
    }

    if (v1 != null) {
      v1!.getFilesVariables(
          field_name: '${field_name}_v1', variables: variables);
    }

    if (v2 != null) {
      v2!.getFilesVariables(
          field_name: '${field_name}_v2', variables: variables);
    }

    if (v3 != null) {
      v3!.getFilesVariables(
          field_name: '${field_name}_v3', variables: variables);
    }

    if (v4 != null) {
      v4!.getFilesVariables(
          field_name: '${field_name}_v4', variables: variables);
    }

    if (v5 != null) {
      v5!.getFilesVariables(
          field_name: '${field_name}_v5', variables: variables);
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
      if (ptype != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ptype'),
          value: ptype!.toValueNode(field_name: '${field_name}_ptype'),
        ),
      if (v0 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v0'),
          value: v0!.toValueNode(field_name: '${field_name}_v0'),
        ),
      if (v1 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v1'),
          value: v1!.toValueNode(field_name: '${field_name}_v1'),
        ),
      if (v2 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v2'),
          value: v2!.toValueNode(field_name: '${field_name}_v2'),
        ),
      if (v3 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v3'),
          value: v3!.toValueNode(field_name: '${field_name}_v3'),
        ),
      if (v4 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v4'),
          value: v4!.toValueNode(field_name: '${field_name}_v4'),
        ),
      if (v5 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v5'),
          value: v5!.toValueNode(field_name: '${field_name}_v5'),
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

  CasbinRuleUncheckedUpdateManyInput(
      {this.id,
      this.ptype,
      this.v0,
      this.v1,
      this.v2,
      this.v3,
      this.v4,
      this.v5,
      this.createdAt,
      this.updatedAt});

  static CasbinRuleUncheckedUpdateManyInput fromJson(
      Map<dynamic, dynamic> json) {
    return CasbinRuleUncheckedUpdateManyInput(
      id: json['id'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      ptype: json['ptype'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['ptype'])
          : null,
      v0: json['v0'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v0'])
          : null,
      v1: json['v1'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v1'])
          : null,
      v2: json['v2'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v2'])
          : null,
      v3: json['v3'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v3'])
          : null,
      v4: json['v4'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v4'])
          : null,
      v5: json['v5'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['v5'])
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
    if (ptype != null) _data['ptype'] = ptype!.toJson();
    if (v0 != null) _data['v0'] = v0!.toJson();
    if (v1 != null) _data['v1'] = v1!.toJson();
    if (v2 != null) _data['v2'] = v2!.toJson();
    if (v3 != null) _data['v3'] = v3!.toJson();
    if (v4 != null) _data['v4'] = v4!.toJson();
    if (v5 != null) _data['v5'] = v5!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  CasbinRuleUncheckedUpdateManyInput copyWith(
      {IntFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? ptype,
      NullableStringFieldUpdateOperationsInput? v0,
      NullableStringFieldUpdateOperationsInput? v1,
      NullableStringFieldUpdateOperationsInput? v2,
      NullableStringFieldUpdateOperationsInput? v3,
      NullableStringFieldUpdateOperationsInput? v4,
      NullableStringFieldUpdateOperationsInput? v5,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt}) {
    return CasbinRuleUncheckedUpdateManyInput(
        id: id ?? this.id,
        ptype: ptype ?? this.ptype,
        v0: v0 ?? this.v0,
        v1: v1 ?? this.v1,
        v2: v2 ?? this.v2,
        v3: v3 ?? this.v3,
        v4: v4 ?? this.v4,
        v5: v5 ?? this.v5,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, ptype, v0, v1, v2, v3, v4, v5, createdAt, updatedAt];
}
