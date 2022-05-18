import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DeviceOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? fcm$id;
  final SortOrder? type;
  final SortOrder? userId;
  final SortOrder? recordStatus;

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
      if (fcm$id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'fcm_id'),
          value: ast.EnumValueNode(name: ast.NameNode(value: fcm$id!.toJson())),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: ast.EnumValueNode(name: ast.NameNode(value: type!.toJson())),
        ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: userId!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        )
    ]);
  }

  DeviceOrderByInput(
      {this.id, this.fcm$id, this.type, this.userId, this.recordStatus});

  static DeviceOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return DeviceOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      fcm$id:
          json['fcm_id'] != null ? SortOrderExt.fromJson(json['fcm_id']) : null,
      type: json['type'] != null ? SortOrderExt.fromJson(json['type']) : null,
      userId:
          json['userId'] != null ? SortOrderExt.fromJson(json['userId']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (fcm$id != null) _data['fcm_id'] = fcm$id!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    return _data;
  }

  DeviceOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? fcm$id,
      SortOrder? type,
      SortOrder? userId,
      SortOrder? recordStatus}) {
    return DeviceOrderByInput(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        userId: userId ?? this.userId,
        recordStatus: recordStatus ?? this.recordStatus);
  }

  List<Object?> get props => [id, fcm$id, type, userId, recordStatus];
}
