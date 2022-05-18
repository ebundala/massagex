import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? email;
  final SortOrder? displayName;
  final SortOrder? phoneNumber;
  final SortOrder? dateOfBirth;
  final SortOrder? emailVerified;
  final SortOrder? disabled;
  final SortOrder? avatorId;
  final SortOrder? role;
  final SortOrder? recordStatus;
  final SortOrder? state;
  final SortOrder? gender;
  final SortOrder? metadata;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? locationId;

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
      if (email != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'email'),
          value: ast.EnumValueNode(name: ast.NameNode(value: email!.toJson())),
        ),
      if (displayName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'displayName'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: displayName!.toJson())),
        ),
      if (phoneNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'phoneNumber'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: phoneNumber!.toJson())),
        ),
      if (dateOfBirth != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'dateOfBirth'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: dateOfBirth!.toJson())),
        ),
      if (emailVerified != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'emailVerified'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: emailVerified!.toJson())),
        ),
      if (disabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'disabled'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: disabled!.toJson())),
        ),
      if (avatorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avatorId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: avatorId!.toJson())),
        ),
      if (role != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'role'),
          value: ast.EnumValueNode(name: ast.NameNode(value: role!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: ast.EnumValueNode(name: ast.NameNode(value: state!.toJson())),
        ),
      if (gender != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gender'),
          value: ast.EnumValueNode(name: ast.NameNode(value: gender!.toJson())),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: metadata!.toJson())),
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
        ),
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: locationId!.toJson())),
        )
    ]);
  }

  UserOrderByInput(
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

  static UserOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return UserOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      email:
          json['email'] != null ? SortOrderExt.fromJson(json['email']) : null,
      displayName: json['displayName'] != null
          ? SortOrderExt.fromJson(json['displayName'])
          : null,
      phoneNumber: json['phoneNumber'] != null
          ? SortOrderExt.fromJson(json['phoneNumber'])
          : null,
      dateOfBirth: json['dateOfBirth'] != null
          ? SortOrderExt.fromJson(json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'] != null
          ? SortOrderExt.fromJson(json['emailVerified'])
          : null,
      disabled: json['disabled'] != null
          ? SortOrderExt.fromJson(json['disabled'])
          : null,
      avatorId: json['avatorId'] != null
          ? SortOrderExt.fromJson(json['avatorId'])
          : null,
      role: json['role'] != null ? SortOrderExt.fromJson(json['role']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      state:
          json['state'] != null ? SortOrderExt.fromJson(json['state']) : null,
      gender:
          json['gender'] != null ? SortOrderExt.fromJson(json['gender']) : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      locationId: json['locationId'] != null
          ? SortOrderExt.fromJson(json['locationId'])
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

  UserOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? email,
      SortOrder? displayName,
      SortOrder? phoneNumber,
      SortOrder? dateOfBirth,
      SortOrder? emailVerified,
      SortOrder? disabled,
      SortOrder? avatorId,
      SortOrder? role,
      SortOrder? recordStatus,
      SortOrder? state,
      SortOrder? gender,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? locationId}) {
    return UserOrderByInput(
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
