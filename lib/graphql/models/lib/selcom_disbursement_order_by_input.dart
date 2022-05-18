import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomDisbursementOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? amount;
  final SortOrder? reference;
  final SortOrder? resultCode;
  final SortOrder? status;
  final SortOrder? transId;
  final SortOrder? userId;
  final SortOrder? utilitycode;
  final SortOrder? utilityref;
  final SortOrder? validation;
  final SortOrder? state;
  final SortOrder? recordStatus;
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
      if (amount != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'amount'),
          value: ast.EnumValueNode(name: ast.NameNode(value: amount!.toJson())),
        ),
      if (reference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reference'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: reference!.toJson())),
        ),
      if (resultCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'resultCode'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: resultCode!.toJson())),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: ast.EnumValueNode(name: ast.NameNode(value: status!.toJson())),
        ),
      if (transId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: transId!.toJson())),
        ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: userId!.toJson())),
        ),
      if (utilitycode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'utilitycode'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: utilitycode!.toJson())),
        ),
      if (utilityref != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'utilityref'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: utilityref!.toJson())),
        ),
      if (validation != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'validation'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: validation!.toJson())),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: ast.EnumValueNode(name: ast.NameNode(value: state!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
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

  SelcomDisbursementOrderByInput(
      {this.id,
      this.amount,
      this.reference,
      this.resultCode,
      this.status,
      this.transId,
      this.userId,
      this.utilitycode,
      this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static SelcomDisbursementOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return SelcomDisbursementOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      amount:
          json['amount'] != null ? SortOrderExt.fromJson(json['amount']) : null,
      reference: json['reference'] != null
          ? SortOrderExt.fromJson(json['reference'])
          : null,
      resultCode: json['resultCode'] != null
          ? SortOrderExt.fromJson(json['resultCode'])
          : null,
      status:
          json['status'] != null ? SortOrderExt.fromJson(json['status']) : null,
      transId: json['transId'] != null
          ? SortOrderExt.fromJson(json['transId'])
          : null,
      userId:
          json['userId'] != null ? SortOrderExt.fromJson(json['userId']) : null,
      utilitycode: json['utilitycode'] != null
          ? SortOrderExt.fromJson(json['utilitycode'])
          : null,
      utilityref: json['utilityref'] != null
          ? SortOrderExt.fromJson(json['utilityref'])
          : null,
      validation: json['validation'] != null
          ? SortOrderExt.fromJson(json['validation'])
          : null,
      state:
          json['state'] != null ? SortOrderExt.fromJson(json['state']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
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
    if (amount != null) _data['amount'] = amount!.toJson();
    if (reference != null) _data['reference'] = reference!.toJson();
    if (resultCode != null) _data['resultCode'] = resultCode!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (transId != null) _data['transId'] = transId!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (utilitycode != null) _data['utilitycode'] = utilitycode!.toJson();
    if (utilityref != null) _data['utilityref'] = utilityref!.toJson();
    if (validation != null) _data['validation'] = validation!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  SelcomDisbursementOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? amount,
      SortOrder? reference,
      SortOrder? resultCode,
      SortOrder? status,
      SortOrder? transId,
      SortOrder? userId,
      SortOrder? utilitycode,
      SortOrder? utilityref,
      SortOrder? validation,
      SortOrder? state,
      SortOrder? recordStatus,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return SelcomDisbursementOrderByInput(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
        transId: transId ?? this.transId,
        userId: userId ?? this.userId,
        utilitycode: utilitycode ?? this.utilitycode,
        utilityref: utilityref ?? this.utilityref,
        validation: validation ?? this.validation,
        state: state ?? this.state,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        id,
        amount,
        reference,
        resultCode,
        status,
        transId,
        userId,
        utilitycode,
        utilityref,
        validation,
        state,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
