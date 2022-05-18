import 'record_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DeviceCreateWithoutUserInput extends Equatable {
  final String id;
  final String? fcm$id;
  final String? type;
  final RecordStatus? recordStatus;

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
        )
    ]);
  }

  DeviceCreateWithoutUserInput(
      {required this.id, this.fcm$id, this.type, this.recordStatus});

  static DeviceCreateWithoutUserInput fromJson(Map<dynamic, dynamic> json) {
    return DeviceCreateWithoutUserInput(
      id: json['id'],
      fcm$id: json['fcm_id'],
      type: json['type'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['id'] = id;
    if (fcm$id != null) _data['fcm_id'] = fcm$id;
    if (type != null) _data['type'] = type;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    return _data;
  }

  DeviceCreateWithoutUserInput copyWith(
      {String? id, String? fcm$id, String? type, RecordStatus? recordStatus}) {
    return DeviceCreateWithoutUserInput(
        id: id ?? this.id,
        fcm$id: fcm$id ?? this.fcm$id,
        type: type ?? this.type,
        recordStatus: recordStatus ?? this.recordStatus);
  }

  List<Object?> get props => [id, fcm$id, type, recordStatus];
}
