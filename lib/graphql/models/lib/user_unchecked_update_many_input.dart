import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'nullable_date_time_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'enum_role_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_account_status_field_update_operations_input.dart';
import 'enum_gender_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserUncheckedUpdateManyInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final NullableStringFieldUpdateOperationsInput? email;
  final NullableStringFieldUpdateOperationsInput? displayName;
  final NullableStringFieldUpdateOperationsInput? phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? dateOfBirth;
  final BoolFieldUpdateOperationsInput? emailVerified;
  final BoolFieldUpdateOperationsInput? disabled;
  final NullableStringFieldUpdateOperationsInput? avatorId;
  final EnumRoleFieldUpdateOperationsInput? role;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumAccountStatusFieldUpdateOperationsInput? state;
  final EnumGenderFieldUpdateOperationsInput? gender;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? locationId;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (email != null) {
      email!.getFilesVariables(
          field_name: '${field_name}_email', variables: variables);
    }

    if (displayName != null) {
      displayName!.getFilesVariables(
          field_name: '${field_name}_displayName', variables: variables);
    }

    if (phoneNumber != null) {
      phoneNumber!.getFilesVariables(
          field_name: '${field_name}_phoneNumber', variables: variables);
    }

    if (dateOfBirth != null) {
      dateOfBirth!.getFilesVariables(
          field_name: '${field_name}_dateOfBirth', variables: variables);
    }

    if (emailVerified != null) {
      emailVerified!.getFilesVariables(
          field_name: '${field_name}_emailVerified', variables: variables);
    }

    if (disabled != null) {
      disabled!.getFilesVariables(
          field_name: '${field_name}_disabled', variables: variables);
    }

    if (avatorId != null) {
      avatorId!.getFilesVariables(
          field_name: '${field_name}_avatorId', variables: variables);
    }

    if (role != null) {
      role!.getFilesVariables(
          field_name: '${field_name}_role', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (state != null) {
      state!.getFilesVariables(
          field_name: '${field_name}_state', variables: variables);
    }

    if (gender != null) {
      gender!.getFilesVariables(
          field_name: '${field_name}_gender', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (locationId != null) {
      locationId!.getFilesVariables(
          field_name: '${field_name}_locationId', variables: variables);
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
      if (email != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'email'),
          value: email!.toValueNode(field_name: '${field_name}_email'),
        ),
      if (displayName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'displayName'),
          value:
              displayName!.toValueNode(field_name: '${field_name}_displayName'),
        ),
      if (phoneNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'phoneNumber'),
          value:
              phoneNumber!.toValueNode(field_name: '${field_name}_phoneNumber'),
        ),
      if (dateOfBirth != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'dateOfBirth'),
          value:
              dateOfBirth!.toValueNode(field_name: '${field_name}_dateOfBirth'),
        ),
      if (emailVerified != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'emailVerified'),
          value: emailVerified!
              .toValueNode(field_name: '${field_name}_emailVerified'),
        ),
      if (disabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'disabled'),
          value: disabled!.toValueNode(field_name: '${field_name}_disabled'),
        ),
      if (avatorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avatorId'),
          value: avatorId!.toValueNode(field_name: '${field_name}_avatorId'),
        ),
      if (role != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'role'),
          value: role!.toValueNode(field_name: '${field_name}_role'),
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
      if (gender != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gender'),
          value: gender!.toValueNode(field_name: '${field_name}_gender'),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
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
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value:
              locationId!.toValueNode(field_name: '${field_name}_locationId'),
        )
    ]);
  }

  UserUncheckedUpdateManyInput(
      {this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.emailVerified,
      this.disabled,
      this.avatorId,
      this.role,
      this.recordStatus,
      this.state,
      this.gender,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.locationId});

  static UserUncheckedUpdateManyInput fromJson(Map<dynamic, dynamic> json) {
    return UserUncheckedUpdateManyInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      email: json['email'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['email'])
          : null,
      displayName: json['displayName'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['displayName'])
          : null,
      phoneNumber: json['phoneNumber'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['phoneNumber'])
          : null,
      dateOfBirth: json['dateOfBirth'] != null
          ? NullableDateTimeFieldUpdateOperationsInput.fromJson(
              json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['emailVerified'])
          : null,
      disabled: json['disabled'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['disabled'])
          : null,
      avatorId: json['avatorId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['avatorId'])
          : null,
      role: json['role'] != null
          ? EnumRoleFieldUpdateOperationsInput.fromJson(json['role'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      state: json['state'] != null
          ? EnumAccountStatusFieldUpdateOperationsInput.fromJson(json['state'])
          : null,
      gender: json['gender'] != null
          ? EnumGenderFieldUpdateOperationsInput.fromJson(json['gender'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      locationId: json['locationId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['locationId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (email != null) _data['email'] = email!.toJson();
    if (displayName != null) _data['displayName'] = displayName!.toJson();
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber!.toJson();
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toJson();
    if (emailVerified != null) _data['emailVerified'] = emailVerified!.toJson();
    if (disabled != null) _data['disabled'] = disabled!.toJson();
    if (avatorId != null) _data['avatorId'] = avatorId!.toJson();
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (locationId != null) _data['locationId'] = locationId!.toJson();
    return _data;
  }

  UserUncheckedUpdateManyInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      NullableStringFieldUpdateOperationsInput? email,
      NullableStringFieldUpdateOperationsInput? displayName,
      NullableStringFieldUpdateOperationsInput? phoneNumber,
      NullableDateTimeFieldUpdateOperationsInput? dateOfBirth,
      BoolFieldUpdateOperationsInput? emailVerified,
      BoolFieldUpdateOperationsInput? disabled,
      NullableStringFieldUpdateOperationsInput? avatorId,
      EnumRoleFieldUpdateOperationsInput? role,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumAccountStatusFieldUpdateOperationsInput? state,
      EnumGenderFieldUpdateOperationsInput? gender,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? locationId}) {
    return UserUncheckedUpdateManyInput(
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
        disabled: disabled ?? this.disabled,
        avatorId: avatorId ?? this.avatorId,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        gender: gender ?? this.gender,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        locationId: locationId ?? this.locationId);
  }

  List<Object?> get props => [
        id,
        email,
        displayName,
        phoneNumber,
        dateOfBirth,
        emailVerified,
        disabled,
        avatorId,
        role,
        recordStatus,
        state,
        gender,
        metadata,
        createdAt,
        updatedAt,
        locationId
      ];
}
