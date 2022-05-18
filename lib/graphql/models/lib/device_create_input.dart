import 'record_status.dart';
import 'user_create_nested_one_without_device_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DeviceCreateInput extends Equatable {
  final String id;
  final String? fcm$id;
  final String? type;
  final RecordStatus? recordStatus;
  final UserCreateNestedOneWithoutDeviceInput? user;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (user != null) {
      user!.getFilesVariables(
          field_name: '${field_name}_user', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'id'),
        value: ast.StringValueNode(value: '${id}', isBlock: false),
      ),
      if (fcm$id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'fcm_id'),
          value: ast.StringValueNode(value: '${fcm$id!}', isBlock: false),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: ast.StringValueNode(value: '${type!}', isBlock: false),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (user != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'user'),
          value: user!.toValueNode(field_name: '${field_name}_user'),
        )
    ]);
  }

  DeviceCreateInput(
      {required this.id, this.fcm$id, this.type, this.recordStatus, this.user});

  static DeviceCreateInput fromJson(Map<dynamic, dynamic> json) {
    return DeviceCreateInput(
      id: json['id'],
      fcm$id: json['fcm_id'],
      type: json['type'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      user: json['user'] != null
          ? UserCreateNestedOneWithoutDeviceInput.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['id'] = id;
    if (fcm$id != null) _data['fcm_id'] = fcm$id;
    if (type != null) _data['type'] = type;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (user != null) _data['user'] = user!.toJson();
    return _data;
  }

  DeviceCreateInput copyWith(
      {String? id,
      String? fcm$id,
      String? type,
      RecordStatus? recordStatus,
      UserCreateNestedOneWithoutDeviceInput? user}) {
    return DeviceCreateInput(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        recordStatus: recordStatus ?? this.recordStatus,
        user: user ?? this.user);
  }

  List<Object?> get props => [id, fcm$id, type, recordStatus, user];
}
