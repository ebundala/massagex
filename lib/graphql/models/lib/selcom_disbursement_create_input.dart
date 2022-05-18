import 'payment_status.dart';
import 'selcom_utility_code.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';
import 'transaction_create_nested_one_without_selcom_disbursement_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomDisbursementCreateInput extends Equatable {
  final String? id;
  final int amount;
  final String? reference;
  final String? resultCode;
  final PaymentStatus? status;
  final String transId;
  final int userId;
  final SelcomUtilityCode utilitycode;
  final String utilityref;
  final PaymentStatus? validation;
  final PaymentStatus? state;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final TransactionCreateNestedOneWithoutSelcomDisbursementInput? transaction;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (transaction != null) {
      transaction!.getFilesVariables(
          field_name: '${field_name}_transaction', variables: variables);
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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'amount'),
        value: ast.IntValueNode(value: '${amount}'),
      ),
      if (reference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reference'),
          value: ast.StringValueNode(value: '${reference!}', isBlock: false),
        ),
      if (resultCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'resultCode'),
          value: ast.StringValueNode(value: '${resultCode!}', isBlock: false),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: ast.EnumValueNode(name: ast.NameNode(value: status!.toJson())),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'transId'),
        value: ast.StringValueNode(value: '${transId}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'userId'),
        value: ast.IntValueNode(value: '${userId}'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'utilitycode'),
        value:
            ast.EnumValueNode(name: ast.NameNode(value: utilitycode.toJson())),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'utilityref'),
        value: ast.StringValueNode(value: '${utilityref}', isBlock: false),
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
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        ),
      if (transaction != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transaction'),
          value:
              transaction!.toValueNode(field_name: '${field_name}_transaction'),
        )
    ]);
  }

  SelcomDisbursementCreateInput(
      {this.id,
      required this.amount,
      this.reference,
      this.resultCode,
      this.status,
      required this.transId,
      required this.userId,
      required this.utilitycode,
      required this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.transaction});

  static SelcomDisbursementCreateInput fromJson(Map<dynamic, dynamic> json) {
    return SelcomDisbursementCreateInput(
      id: json['id'],
      amount: json['amount'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
          : null,
      transId: json['transId'],
      userId: json['userId'],
      utilitycode: SelcomUtilityCodeExt.fromJson(json['utilitycode']),
      utilityref: json['utilityref'],
      validation: json['validation'] != null
          ? PaymentStatusExt.fromJson(json['validation'])
          : null,
      state: json['state'] != null
          ? PaymentStatusExt.fromJson(json['state'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      transaction: json['transaction'] != null
          ? TransactionCreateNestedOneWithoutSelcomDisbursementInput.fromJson(
              json['transaction'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['amount'] = amount;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status!.toJson();

    _data['transId'] = transId;

    _data['userId'] = userId;

    _data['utilitycode'] = utilitycode.toJson();

    _data['utilityref'] = utilityref;
    if (validation != null) _data['validation'] = validation!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (transaction != null) _data['transaction'] = transaction!.toJson();
    return _data;
  }

  SelcomDisbursementCreateInput copyWith(
      {String? id,
      int? amount,
      String? reference,
      String? resultCode,
      PaymentStatus? status,
      String? transId,
      int? userId,
      SelcomUtilityCode? utilitycode,
      String? utilityref,
      PaymentStatus? validation,
      PaymentStatus? state,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      TransactionCreateNestedOneWithoutSelcomDisbursementInput? transaction}) {
    return SelcomDisbursementCreateInput(
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
        updatedAt: updatedAt ?? this.updatedAt,
        transaction: transaction ?? this.transaction);
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
        updatedAt,
        transaction
      ];
}
