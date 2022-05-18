import 'string_with_aggregates_filter.dart';
import 'enum_transaction_type_with_aggregates_filter.dart';
import 'string_nullable_with_aggregates_filter.dart';
import 'enum_transaction_status_with_aggregates_filter.dart';
import 'enum_record_status_with_aggregates_filter.dart';
import 'json_nullable_with_aggregates_filter.dart';
import 'date_time_with_aggregates_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionScalarWhereWithAggregatesInput extends Equatable {
  final List<TransactionScalarWhereWithAggregatesInput>? AND;
  final List<TransactionScalarWhereWithAggregatesInput>? OR;
  final List<TransactionScalarWhereWithAggregatesInput>? NOT;
  final StringWithAggregatesFilter? id;
  final StringWithAggregatesFilter? paymentMethodId;
  final EnumTransactionTypeWithAggregatesFilter? type;
  final StringWithAggregatesFilter? orderId;
  final StringNullableWithAggregatesFilter? mpesaPaymentId;
  final StringNullableWithAggregatesFilter? selcomPaymentId;
  final StringNullableWithAggregatesFilter? selcomDisbursementId;
  final EnumTransactionStatusWithAggregatesFilter? status;
  final EnumRecordStatusWithAggregatesFilter? recordStatus;
  final JsonNullableWithAggregatesFilter? metadata;
  final DateTimeWithAggregatesFilter? createdAt;
  final DateTimeWithAggregatesFilter? updatedAt;

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

    if (paymentMethodId != null) {
      paymentMethodId!.getFilesVariables(
          field_name: '${field_name}_paymentMethodId', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (orderId != null) {
      orderId!.getFilesVariables(
          field_name: '${field_name}_orderId', variables: variables);
    }

    if (mpesaPaymentId != null) {
      mpesaPaymentId!.getFilesVariables(
          field_name: '${field_name}_mpesaPaymentId', variables: variables);
    }

    if (selcomPaymentId != null) {
      selcomPaymentId!.getFilesVariables(
          field_name: '${field_name}_selcomPaymentId', variables: variables);
    }

    if (selcomDisbursementId != null) {
      selcomDisbursementId!.getFilesVariables(
          field_name: '${field_name}_selcomDisbursementId',
          variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
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
      if (paymentMethodId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethodId'),
          value: paymentMethodId!
              .toValueNode(field_name: '${field_name}_paymentMethodId'),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value: orderId!.toValueNode(field_name: '${field_name}_orderId'),
        ),
      if (mpesaPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPaymentId'),
          value: mpesaPaymentId!
              .toValueNode(field_name: '${field_name}_mpesaPaymentId'),
        ),
      if (selcomPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPaymentId'),
          value: selcomPaymentId!
              .toValueNode(field_name: '${field_name}_selcomPaymentId'),
        ),
      if (selcomDisbursementId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursementId'),
          value: selcomDisbursementId!
              .toValueNode(field_name: '${field_name}_selcomDisbursementId'),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: status!.toValueNode(field_name: '${field_name}_status'),
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

  TransactionScalarWhereWithAggregatesInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.paymentMethodId,
      this.type,
      this.orderId,
      this.mpesaPaymentId,
      this.selcomPaymentId,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static TransactionScalarWhereWithAggregatesInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionScalarWhereWithAggregatesInput(
      AND: json['AND'] != null
          ? List.generate(
              json['AND'].length,
              (index) => TransactionScalarWhereWithAggregatesInput.fromJson(
                  json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(
              json['OR'].length,
              (index) => TransactionScalarWhereWithAggregatesInput.fromJson(
                  json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(
              json['NOT'].length,
              (index) => TransactionScalarWhereWithAggregatesInput.fromJson(
                  json['NOT'][index]))
          : null,
      id: json['id'] != null
          ? StringWithAggregatesFilter.fromJson(json['id'])
          : null,
      paymentMethodId: json['paymentMethodId'] != null
          ? StringWithAggregatesFilter.fromJson(json['paymentMethodId'])
          : null,
      type: json['type'] != null
          ? EnumTransactionTypeWithAggregatesFilter.fromJson(json['type'])
          : null,
      orderId: json['orderId'] != null
          ? StringWithAggregatesFilter.fromJson(json['orderId'])
          : null,
      mpesaPaymentId: json['mpesaPaymentId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['mpesaPaymentId'])
          : null,
      selcomPaymentId: json['selcomPaymentId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['selcomPaymentId'])
          : null,
      selcomDisbursementId: json['selcomDisbursementId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(
              json['selcomDisbursementId'])
          : null,
      status: json['status'] != null
          ? EnumTransactionStatusWithAggregatesFilter.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusWithAggregatesFilter.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JsonNullableWithAggregatesFilter.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['updatedAt'])
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
    if (paymentMethodId != null)
      _data['paymentMethodId'] = paymentMethodId!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (orderId != null) _data['orderId'] = orderId!.toJson();
    if (mpesaPaymentId != null)
      _data['mpesaPaymentId'] = mpesaPaymentId!.toJson();
    if (selcomPaymentId != null)
      _data['selcomPaymentId'] = selcomPaymentId!.toJson();
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  TransactionScalarWhereWithAggregatesInput copyWith(
      {List<TransactionScalarWhereWithAggregatesInput>? AND,
      List<TransactionScalarWhereWithAggregatesInput>? OR,
      List<TransactionScalarWhereWithAggregatesInput>? NOT,
      StringWithAggregatesFilter? id,
      StringWithAggregatesFilter? paymentMethodId,
      EnumTransactionTypeWithAggregatesFilter? type,
      StringWithAggregatesFilter? orderId,
      StringNullableWithAggregatesFilter? mpesaPaymentId,
      StringNullableWithAggregatesFilter? selcomPaymentId,
      StringNullableWithAggregatesFilter? selcomDisbursementId,
      EnumTransactionStatusWithAggregatesFilter? status,
      EnumRecordStatusWithAggregatesFilter? recordStatus,
      JsonNullableWithAggregatesFilter? metadata,
      DateTimeWithAggregatesFilter? createdAt,
      DateTimeWithAggregatesFilter? updatedAt}) {
    return TransactionScalarWhereWithAggregatesInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
        type: type ?? this.type,
        orderId: orderId ?? this.orderId,
        mpesaPaymentId: mpesaPaymentId ?? this.mpesaPaymentId,
        selcomPaymentId: selcomPaymentId ?? this.selcomPaymentId,
        selcomDisbursementId: selcomDisbursementId ?? this.selcomDisbursementId,
        status: status ?? this.status,
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
        paymentMethodId,
        type,
        orderId,
        mpesaPaymentId,
        selcomPaymentId,
        selcomDisbursementId,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
