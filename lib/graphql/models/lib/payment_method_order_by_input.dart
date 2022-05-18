import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? name;
  final SortOrder? description;
  final SortOrder? attachmentId;
  final SortOrder? code;
  final SortOrder? recordStatus;
  final SortOrder? status;
  final SortOrder? metadata;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

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
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.EnumValueNode(name: ast.NameNode(value: name!.toJson())),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: description!.toJson())),
        ),
      if (attachmentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachmentId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: attachmentId!.toJson())),
        ),
      if (code != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'code'),
          value: ast.EnumValueNode(name: ast.NameNode(value: code!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: ast.EnumValueNode(name: ast.NameNode(value: status!.toJson())),
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
        )
    ]);
  }

  PaymentMethodOrderByInput(
      {this.id,
      this.name,
      this.description,
      this.attachmentId,
      this.code,
      this.recordStatus,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static PaymentMethodOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      name: json['name'] != null ? SortOrderExt.fromJson(json['name']) : null,
      description: json['description'] != null
          ? SortOrderExt.fromJson(json['description'])
          : null,
      attachmentId: json['attachmentId'] != null
          ? SortOrderExt.fromJson(json['attachmentId'])
          : null,
      code: json['code'] != null ? SortOrderExt.fromJson(json['code']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      status:
          json['status'] != null ? SortOrderExt.fromJson(json['status']) : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (attachmentId != null) _data['attachmentId'] = attachmentId!.toJson();
    if (code != null) _data['code'] = code!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  PaymentMethodOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? name,
      SortOrder? description,
      SortOrder? attachmentId,
      SortOrder? code,
      SortOrder? recordStatus,
      SortOrder? status,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return PaymentMethodOrderByInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        attachmentId,
        code,
        recordStatus,
        status,
        metadata,
        createdAt,
        updatedAt
      ];
}
