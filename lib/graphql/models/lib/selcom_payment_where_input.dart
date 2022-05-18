import 'string_filter.dart';
import 'int_filter.dart';
import 'string_nullable_filter.dart';
import 'enum_payment_status_filter.dart';
import 'transaction_relation_filter.dart';
import 'enum_record_status_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomPaymentWhereInput extends Equatable {
  final List<SelcomPaymentWhereInput>? AND;
  final List<SelcomPaymentWhereInput>? OR;
  final List<SelcomPaymentWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? transId;
  final IntFilter? amount;
  final StringFilter? msisdn;
  final StringNullableFilter? operator$;
  final StringNullableFilter? reference;
  final StringNullableFilter? resultCode;
  final EnumPaymentStatusFilter? status;
  final IntFilter? utilityref;
  final EnumPaymentStatusFilter? validation;
  final TransactionRelationFilter? transaction;
  final EnumPaymentStatusFilter? state;
  final EnumRecordStatusFilter? recordStatus;
  final JsonNullableFilter? metadata;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (AND != null) {
      int i = -1;
      AND!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_AND_$i', variables: variables);
      });
    }
    if (OR != null) {
      int i = -1;
      OR!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_OR_$i', variables: variables);
      });
    }
    if (NOT != null) {
      int i = -1;
      NOT!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_NOT_$i', variables: variables);
      });
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (transId != null) {
      transId!.getFilesVariables(
          field_name: '${field_name}_transId', variables: variables);
    }

    if (amount != null) {
      amount!.getFilesVariables(
          field_name: '${field_name}_amount', variables: variables);
    }

    if (msisdn != null) {
      msisdn!.getFilesVariables(
          field_name: '${field_name}_msisdn', variables: variables);
    }

    if (operator$ != null) {
      operator$!.getFilesVariables(
          field_name: '${field_name}_operator', variables: variables);
    }

    if (reference != null) {
      reference!.getFilesVariables(
          field_name: '${field_name}_reference', variables: variables);
    }

    if (resultCode != null) {
      resultCode!.getFilesVariables(
          field_name: '${field_name}_resultCode', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
    }

    if (utilityref != null) {
      utilityref!.getFilesVariables(
          field_name: '${field_name}_utilityref', variables: variables);
    }

    if (validation != null) {
      validation!.getFilesVariables(
          field_name: '${field_name}_validation', variables: variables);
    }

    if (transaction != null) {
      transaction!.getFilesVariables(
          field_name: '${field_name}_transaction', variables: variables);
    }

    if (state != null) {
      state!.getFilesVariables(
          field_name: '${field_name}_state', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (metadata != null) {
      metadata!.getFilesVariables(
          field_name: '${field_name}_metadata', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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
      if (AND != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'AND'),
            value: ast.ListValueNode(values: [
              ...AND!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_AND_$i')
                  ];
                },
              )
            ])),
      if (OR != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'OR'),
            value: ast.ListValueNode(values: [
              ...OR!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_OR_$i')
                  ];
                },
              )
            ])),
      if (NOT != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'NOT'),
            value: ast.ListValueNode(values: [
              ...NOT!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_NOT_$i')
                  ];
                },
              )
            ])),
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (transId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transId'),
          value: transId!.toValueNode(field_name: '${field_name}_transId'),
        ),
      if (amount != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'amount'),
          value: amount!.toValueNode(field_name: '${field_name}_amount'),
        ),
      if (msisdn != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'msisdn'),
          value: msisdn!.toValueNode(field_name: '${field_name}_msisdn'),
        ),
      if (operator$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'operator'),
          value: operator$!.toValueNode(field_name: '${field_name}_operator'),
        ),
      if (reference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reference'),
          value: reference!.toValueNode(field_name: '${field_name}_reference'),
        ),
      if (resultCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'resultCode'),
          value:
              resultCode!.toValueNode(field_name: '${field_name}_resultCode'),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: status!.toValueNode(field_name: '${field_name}_status'),
        ),
      if (utilityref != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'utilityref'),
          value:
              utilityref!.toValueNode(field_name: '${field_name}_utilityref'),
        ),
      if (validation != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'validation'),
          value:
              validation!.toValueNode(field_name: '${field_name}_validation'),
        ),
      if (transaction != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transaction'),
          value:
              transaction!.toValueNode(field_name: '${field_name}_transaction'),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: state!.toValueNode(field_name: '${field_name}_state'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
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
        )
    ]);
  }

  SelcomPaymentWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.transId,
      this.amount,
      this.msisdn,
      this.operator$,
      this.reference,
      this.resultCode,
      this.status,
      this.utilityref,
      this.validation,
      this.transaction,
      this.state,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static SelcomPaymentWhereInput fromJson(Map<dynamic, dynamic> json) {
    return SelcomPaymentWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => SelcomPaymentWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => SelcomPaymentWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => SelcomPaymentWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      transId: json['transId'] != null
          ? StringFilter.fromJson(json['transId'])
          : null,
      amount:
          json['amount'] != null ? IntFilter.fromJson(json['amount']) : null,
      msisdn:
          json['msisdn'] != null ? StringFilter.fromJson(json['msisdn']) : null,
      operator$: json['operator'] != null
          ? StringNullableFilter.fromJson(json['operator'])
          : null,
      reference: json['reference'] != null
          ? StringNullableFilter.fromJson(json['reference'])
          : null,
      resultCode: json['resultCode'] != null
          ? StringNullableFilter.fromJson(json['resultCode'])
          : null,
      status: json['status'] != null
          ? EnumPaymentStatusFilter.fromJson(json['status'])
          : null,
      utilityref: json['utilityref'] != null
          ? IntFilter.fromJson(json['utilityref'])
          : null,
      validation: json['validation'] != null
          ? EnumPaymentStatusFilter.fromJson(json['validation'])
          : null,
      transaction: json['transaction'] != null
          ? TransactionRelationFilter.fromJson(json['transaction'])
          : null,
      state: json['state'] != null
          ? EnumPaymentStatusFilter.fromJson(json['state'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JsonNullableFilter.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (AND != null)
      _data['AND'] =
          List.generate(AND?.length ?? 0, (index) => AND![index].toJson());
    if (OR != null)
      _data['OR'] =
          List.generate(OR?.length ?? 0, (index) => OR![index].toJson());
    if (NOT != null)
      _data['NOT'] =
          List.generate(NOT?.length ?? 0, (index) => NOT![index].toJson());
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
    if (transaction != null) _data['transaction'] = transaction!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  SelcomPaymentWhereInput copyWith(
      {List<SelcomPaymentWhereInput>? AND,
      List<SelcomPaymentWhereInput>? OR,
      List<SelcomPaymentWhereInput>? NOT,
      StringFilter? id,
      StringFilter? transId,
      IntFilter? amount,
      StringFilter? msisdn,
      StringNullableFilter? operator$,
      StringNullableFilter? reference,
      StringNullableFilter? resultCode,
      EnumPaymentStatusFilter? status,
      IntFilter? utilityref,
      EnumPaymentStatusFilter? validation,
      TransactionRelationFilter? transaction,
      EnumPaymentStatusFilter? state,
      EnumRecordStatusFilter? recordStatus,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return SelcomPaymentWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
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
        transaction: transaction ?? this.transaction,
        state: state ?? this.state,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
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
        transaction,
        state,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
