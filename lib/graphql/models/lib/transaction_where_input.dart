import 'string_filter.dart';
import 'payment_method_relation_filter.dart';
import 'enum_transaction_type_filter.dart';
import 'order_relation_filter.dart';
import 'mpesa_payment_relation_filter.dart';
import 'string_nullable_filter.dart';
import 'selcom_payment_relation_filter.dart';
import 'selcom_disbursement_relation_filter.dart';
import 'enum_transaction_status_filter.dart';
import 'enum_record_status_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionWhereInput extends Equatable {
  final List<TransactionWhereInput>? AND;
  final List<TransactionWhereInput>? OR;
  final List<TransactionWhereInput>? NOT;
  final StringFilter? id;
  final PaymentMethodRelationFilter? paymentMethod;
  final StringFilter? paymentMethodId;
  final EnumTransactionTypeFilter? type;
  final OrderRelationFilter? order;
  final StringFilter? orderId;
  final MpesaPaymentRelationFilter? mpesaPayment;
  final StringNullableFilter? mpesaPaymentId;
  final SelcomPaymentRelationFilter? selcomPayment;
  final StringNullableFilter? selcomPaymentId;
  final SelcomDisbursementRelationFilter? selcomDisbursement;
  final StringNullableFilter? selcomDisbursementId;
  final EnumTransactionStatusFilter? status;
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

    if (paymentMethod != null) {
      paymentMethod!.getFilesVariables(
          field_name: '${field_name}_paymentMethod', variables: variables);
    }

    if (paymentMethodId != null) {
      paymentMethodId!.getFilesVariables(
          field_name: '${field_name}_paymentMethodId', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (order != null) {
      order!.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
    }

    if (orderId != null) {
      orderId!.getFilesVariables(
          field_name: '${field_name}_orderId', variables: variables);
    }

    if (mpesaPayment != null) {
      mpesaPayment!.getFilesVariables(
          field_name: '${field_name}_mpesaPayment', variables: variables);
    }

    if (mpesaPaymentId != null) {
      mpesaPaymentId!.getFilesVariables(
          field_name: '${field_name}_mpesaPaymentId', variables: variables);
    }

    if (selcomPayment != null) {
      selcomPayment!.getFilesVariables(
          field_name: '${field_name}_selcomPayment', variables: variables);
    }

    if (selcomPaymentId != null) {
      selcomPaymentId!.getFilesVariables(
          field_name: '${field_name}_selcomPaymentId', variables: variables);
    }

    if (selcomDisbursement != null) {
      selcomDisbursement!.getFilesVariables(
          field_name: '${field_name}_selcomDisbursement', variables: variables);
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
      if (paymentMethod != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethod'),
          value: paymentMethod!
              .toValueNode(field_name: '${field_name}_paymentMethod'),
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
      if (order != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'order'),
          value: order!.toValueNode(field_name: '${field_name}_order'),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value: orderId!.toValueNode(field_name: '${field_name}_orderId'),
        ),
      if (mpesaPayment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPayment'),
          value: mpesaPayment!
              .toValueNode(field_name: '${field_name}_mpesaPayment'),
        ),
      if (mpesaPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPaymentId'),
          value: mpesaPaymentId!
              .toValueNode(field_name: '${field_name}_mpesaPaymentId'),
        ),
      if (selcomPayment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPayment'),
          value: selcomPayment!
              .toValueNode(field_name: '${field_name}_selcomPayment'),
        ),
      if (selcomPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPaymentId'),
          value: selcomPaymentId!
              .toValueNode(field_name: '${field_name}_selcomPaymentId'),
        ),
      if (selcomDisbursement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursement'),
          value: selcomDisbursement!
              .toValueNode(field_name: '${field_name}_selcomDisbursement'),
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

  TransactionWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.paymentMethod,
      this.paymentMethodId,
      this.type,
      this.order,
      this.orderId,
      this.mpesaPayment,
      this.mpesaPaymentId,
      this.selcomPayment,
      this.selcomPaymentId,
      this.selcomDisbursement,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static TransactionWhereInput fromJson(Map<dynamic, dynamic> json) {
    return TransactionWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => TransactionWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => TransactionWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => TransactionWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethodRelationFilter.fromJson(json['paymentMethod'])
          : null,
      paymentMethodId: json['paymentMethodId'] != null
          ? StringFilter.fromJson(json['paymentMethodId'])
          : null,
      type: json['type'] != null
          ? EnumTransactionTypeFilter.fromJson(json['type'])
          : null,
      order: json['order'] != null
          ? OrderRelationFilter.fromJson(json['order'])
          : null,
      orderId: json['orderId'] != null
          ? StringFilter.fromJson(json['orderId'])
          : null,
      mpesaPayment: json['mpesaPayment'] != null
          ? MpesaPaymentRelationFilter.fromJson(json['mpesaPayment'])
          : null,
      mpesaPaymentId: json['mpesaPaymentId'] != null
          ? StringNullableFilter.fromJson(json['mpesaPaymentId'])
          : null,
      selcomPayment: json['selcomPayment'] != null
          ? SelcomPaymentRelationFilter.fromJson(json['selcomPayment'])
          : null,
      selcomPaymentId: json['selcomPaymentId'] != null
          ? StringNullableFilter.fromJson(json['selcomPaymentId'])
          : null,
      selcomDisbursement: json['selcomDisbursement'] != null
          ? SelcomDisbursementRelationFilter.fromJson(
              json['selcomDisbursement'])
          : null,
      selcomDisbursementId: json['selcomDisbursementId'] != null
          ? StringNullableFilter.fromJson(json['selcomDisbursementId'])
          : null,
      status: json['status'] != null
          ? EnumTransactionStatusFilter.fromJson(json['status'])
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
    if (paymentMethod != null) _data['paymentMethod'] = paymentMethod!.toJson();
    if (paymentMethodId != null)
      _data['paymentMethodId'] = paymentMethodId!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    if (orderId != null) _data['orderId'] = orderId!.toJson();
    if (mpesaPayment != null) _data['mpesaPayment'] = mpesaPayment!.toJson();
    if (mpesaPaymentId != null)
      _data['mpesaPaymentId'] = mpesaPaymentId!.toJson();
    if (selcomPayment != null) _data['selcomPayment'] = selcomPayment!.toJson();
    if (selcomPaymentId != null)
      _data['selcomPaymentId'] = selcomPaymentId!.toJson();
    if (selcomDisbursement != null)
      _data['selcomDisbursement'] = selcomDisbursement!.toJson();
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  TransactionWhereInput copyWith(
      {List<TransactionWhereInput>? AND,
      List<TransactionWhereInput>? OR,
      List<TransactionWhereInput>? NOT,
      StringFilter? id,
      PaymentMethodRelationFilter? paymentMethod,
      StringFilter? paymentMethodId,
      EnumTransactionTypeFilter? type,
      OrderRelationFilter? order,
      StringFilter? orderId,
      MpesaPaymentRelationFilter? mpesaPayment,
      StringNullableFilter? mpesaPaymentId,
      SelcomPaymentRelationFilter? selcomPayment,
      StringNullableFilter? selcomPaymentId,
      SelcomDisbursementRelationFilter? selcomDisbursement,
      StringNullableFilter? selcomDisbursementId,
      EnumTransactionStatusFilter? status,
      EnumRecordStatusFilter? recordStatus,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return TransactionWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
        type: type ?? this.type,
        order: order ?? this.order,
        orderId: orderId ?? this.orderId,
        mpesaPayment: mpesaPayment ?? this.mpesaPayment,
        mpesaPaymentId: mpesaPaymentId ?? this.mpesaPaymentId,
        selcomPayment: selcomPayment ?? this.selcomPayment,
        selcomPaymentId: selcomPaymentId ?? this.selcomPaymentId,
        selcomDisbursement: selcomDisbursement ?? this.selcomDisbursement,
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
        paymentMethod,
        paymentMethodId,
        type,
        order,
        orderId,
        mpesaPayment,
        mpesaPaymentId,
        selcomPayment,
        selcomPaymentId,
        selcomDisbursement,
        selcomDisbursementId,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
