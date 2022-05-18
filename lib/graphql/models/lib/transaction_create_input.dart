import 'transaction_type.dart';
import 'transaction_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';
import 'payment_method_create_nested_one_without_transactions_input.dart';
import 'order_create_nested_one_without_transactions_input.dart';
import 'mpesa_payment_create_nested_one_without_transaction_input.dart';
import 'selcom_payment_create_nested_one_without_transaction_input.dart';
import 'selcom_disbursement_create_nested_one_without_transaction_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionCreateInput extends Equatable {
  final String? id;
  final TransactionType type;
  final TransactionStatus? status;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PaymentMethodCreateNestedOneWithoutTransactionsInput paymentMethod;
  final OrderCreateNestedOneWithoutTransactionsInput order;
  final MpesaPaymentCreateNestedOneWithoutTransactionInput? mpesaPayment;
  final SelcomPaymentCreateNestedOneWithoutTransactionInput? selcomPayment;
  final SelcomDisbursementCreateNestedOneWithoutTransactionInput?
      selcomDisbursement;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      paymentMethod.getFilesVariables(
          field_name: '${field_name}_paymentMethod', variables: variables);
    }

    {
      order.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
    }

    if (mpesaPayment != null) {
      mpesaPayment!.getFilesVariables(
          field_name: '${field_name}_mpesaPayment', variables: variables);
    }

    if (selcomPayment != null) {
      selcomPayment!.getFilesVariables(
          field_name: '${field_name}_selcomPayment', variables: variables);
    }

    if (selcomDisbursement != null) {
      selcomDisbursement!.getFilesVariables(
          field_name: '${field_name}_selcomDisbursement', variables: variables);
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
        name: ast.NameNode(value: 'type'),
        value: ast.EnumValueNode(name: ast.NameNode(value: type.toJson())),
      ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: ast.EnumValueNode(name: ast.NameNode(value: status!.toJson())),
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'paymentMethod'),
        value: paymentMethod.toValueNode(
            field_name: '${field_name}_paymentMethod'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'order'),
        value: order.toValueNode(field_name: '${field_name}_order'),
      ),
      if (mpesaPayment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPayment'),
          value: mpesaPayment!
              .toValueNode(field_name: '${field_name}_mpesaPayment'),
        ),
      if (selcomPayment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPayment'),
          value: selcomPayment!
              .toValueNode(field_name: '${field_name}_selcomPayment'),
        ),
      if (selcomDisbursement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursement'),
          value: selcomDisbursement!
              .toValueNode(field_name: '${field_name}_selcomDisbursement'),
        )
    ]);
  }

  TransactionCreateInput(
      {this.id,
      required this.type,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      required this.paymentMethod,
      required this.order,
      this.mpesaPayment,
      this.selcomPayment,
      this.selcomDisbursement});

  static TransactionCreateInput fromJson(Map<dynamic, dynamic> json) {
    return TransactionCreateInput(
      id: json['id'],
      type: TransactionTypeExt.fromJson(json['type']),
      status: json['status'] != null
          ? TransactionStatusExt.fromJson(json['status'])
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
      paymentMethod:
          PaymentMethodCreateNestedOneWithoutTransactionsInput.fromJson(
              json['paymentMethod']),
      order:
          OrderCreateNestedOneWithoutTransactionsInput.fromJson(json['order']),
      mpesaPayment: json['mpesaPayment'] != null
          ? MpesaPaymentCreateNestedOneWithoutTransactionInput.fromJson(
              json['mpesaPayment'])
          : null,
      selcomPayment: json['selcomPayment'] != null
          ? SelcomPaymentCreateNestedOneWithoutTransactionInput.fromJson(
              json['selcomPayment'])
          : null,
      selcomDisbursement: json['selcomDisbursement'] != null
          ? SelcomDisbursementCreateNestedOneWithoutTransactionInput.fromJson(
              json['selcomDisbursement'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['type'] = type.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['paymentMethod'] = paymentMethod.toJson();

    _data['order'] = order.toJson();
    if (mpesaPayment != null) _data['mpesaPayment'] = mpesaPayment!.toJson();
    if (selcomPayment != null) _data['selcomPayment'] = selcomPayment!.toJson();
    if (selcomDisbursement != null)
      _data['selcomDisbursement'] = selcomDisbursement!.toJson();
    return _data;
  }

  TransactionCreateInput copyWith(
      {String? id,
      TransactionType? type,
      TransactionStatus? status,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      PaymentMethodCreateNestedOneWithoutTransactionsInput? paymentMethod,
      OrderCreateNestedOneWithoutTransactionsInput? order,
      MpesaPaymentCreateNestedOneWithoutTransactionInput? mpesaPayment,
      SelcomPaymentCreateNestedOneWithoutTransactionInput? selcomPayment,
      SelcomDisbursementCreateNestedOneWithoutTransactionInput?
          selcomDisbursement}) {
    return TransactionCreateInput(
        id: id ?? this.id,
        type: type ?? this.type,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        order: order ?? this.order,
        mpesaPayment: mpesaPayment ?? this.mpesaPayment,
        selcomPayment: selcomPayment ?? this.selcomPayment,
        selcomDisbursement: selcomDisbursement ?? this.selcomDisbursement);
  }

  List<Object?> get props => [
        id,
        type,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt,
        paymentMethod,
        order,
        mpesaPayment,
        selcomPayment,
        selcomDisbursement
      ];
}
