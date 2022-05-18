import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomPaymentOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? transId;
  final SortOrder? amount;
  final SortOrder? msisdn;
  final SortOrder? operator$;
  final SortOrder? reference;
  final SortOrder? resultCode;
  final SortOrder? status;
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
      if (transId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: transId!.toJson())),
        ),
      if (amount != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'amount'),
          value: ast.EnumValueNode(name: ast.NameNode(value: amount!.toJson())),
        ),
      if (msisdn != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'msisdn'),
          value: ast.EnumValueNode(name: ast.NameNode(value: msisdn!.toJson())),
        ),
      if (operator$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'operator'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: operator$!.toJson())),
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

  SelcomPaymentOrderByInput(
      {this.id,
      this.transId,
      this.amount,
      this.msisdn,
      this.operator$,
      this.reference,
      this.resultCode,
      this.status,
      this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static SelcomPaymentOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return SelcomPaymentOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      transId: json['transId'] != null
          ? SortOrderExt.fromJson(json['transId'])
          : null,
      amount:
          json['amount'] != null ? SortOrderExt.fromJson(json['amount']) : null,
      msisdn:
          json['msisdn'] != null ? SortOrderExt.fromJson(json['msisdn']) : null,
      operator$: json['operator'] != null
          ? SortOrderExt.fromJson(json['operator'])
          : null,
      reference: json['reference'] != null
          ? SortOrderExt.fromJson(json['reference'])
          : null,
      resultCode: json['resultCode'] != null
          ? SortOrderExt.fromJson(json['resultCode'])
          : null,
      status:
          json['status'] != null ? SortOrderExt.fromJson(json['status']) : null,
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
    if (transId != null) _data['transId'] = transId!.toJson();
    if (amount != null) _data['amount'] = amount!.toJson();
    if (msisdn != null) _data['msisdn'] = msisdn!.toJson();
    if (operator$ != null) _data['operator'] = operator$!.toJson();
    if (reference != null) _data['reference'] = reference!.toJson();
    if (resultCode != null) _data['resultCode'] = resultCode!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (utilityref != null) _data['utilityref'] = utilityref!.toJson();
    if (validation != null) _data['validation'] = validation!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  SelcomPaymentOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? transId,
      SortOrder? amount,
      SortOrder? msisdn,
      SortOrder? operator$,
      SortOrder? reference,
      SortOrder? resultCode,
      SortOrder? status,
      SortOrder? utilityref,
      SortOrder? validation,
      SortOrder? state,
      SortOrder? recordStatus,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return SelcomPaymentOrderByInput(
        id: id ?? this.id,
        transId: transId ?? this.transId,
        amount: amount ?? this.amount,
        msisdn: msisdn ?? this.msisdn,
        operator$: operator$ ?? this.operator$,
        reference: reference ?? this.reference,
        resultCode: resultCode ?? this.resultCode,
        status: status ?? this.status,
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
        transId,
        amount,
        msisdn,
        operator$,
        reference,
        resultCode,
        status,
        utilityref,
        validation,
        state,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
