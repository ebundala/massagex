import 'payment_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomPaymentUncheckedCreateWithoutTransactionInput extends Equatable {
  final String? id;
  final String transId;
  final int amount;
  final String msisdn;
  final String? operator$;
  final String? reference;
  final String? resultCode;
  final PaymentStatus? status;
  final int utilityref;
  final PaymentStatus? validation;
  final PaymentStatus? state;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'transId'),
        value: ast.StringValueNode(value: '${transId}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'amount'),
        value: ast.IntValueNode(value: '${amount}'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'msisdn'),
        value: ast.StringValueNode(value: '${msisdn}', isBlock: false),
      ),
      if (operator$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'operator'),
          value: ast.StringValueNode(value: '${operator$!}', isBlock: false),
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
        name: ast.NameNode(value: 'utilityref'),
        value: ast.IntValueNode(value: '${utilityref}'),
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
        )
    ]);
  }

  SelcomPaymentUncheckedCreateWithoutTransactionInput(
      {this.id,
      required this.transId,
      required this.amount,
      required this.msisdn,
      this.operator$,
      this.reference,
      this.resultCode,
      this.status,
      required this.utilityref,
      this.validation,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static SelcomPaymentUncheckedCreateWithoutTransactionInput fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomPaymentUncheckedCreateWithoutTransactionInput(
      id: json['id'],
      transId: json['transId'],
      amount: json['amount'],
      msisdn: json['msisdn'],
      operator$: json['operator'],
      reference: json['reference'],
      resultCode: json['resultCode'],
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
          : null,
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
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['transId'] = transId;

    _data['amount'] = amount;

    _data['msisdn'] = msisdn;
    if (operator$ != null) _data['operator'] = operator$;
    if (reference != null) _data['reference'] = reference;
    if (resultCode != null) _data['resultCode'] = resultCode;
    if (status != null) _data['status'] = status!.toJson();

    _data['utilityref'] = utilityref;
    if (validation != null) _data['validation'] = validation!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  SelcomPaymentUncheckedCreateWithoutTransactionInput copyWith(
      {String? id,
      String? transId,
      int? amount,
      String? msisdn,
      String? operator$,
      String? reference,
      String? resultCode,
      PaymentStatus? status,
      int? utilityref,
      PaymentStatus? validation,
      PaymentStatus? state,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return SelcomPaymentUncheckedCreateWithoutTransactionInput(
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
