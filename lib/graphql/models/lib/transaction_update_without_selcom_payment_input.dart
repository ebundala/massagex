import 'string_field_update_operations_input.dart';
import 'enum_transaction_type_field_update_operations_input.dart';
import 'enum_transaction_status_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';
import 'payment_method_update_one_required_without_transactions_input.dart';
import 'order_update_one_required_without_transactions_input.dart';
import 'mpesa_payment_update_one_without_transaction_input.dart';
import 'selcom_disbursement_update_one_without_transaction_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionUpdateWithoutSelcomPaymentInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final EnumTransactionTypeFieldUpdateOperationsInput? type;
  final EnumTransactionStatusFieldUpdateOperationsInput? status;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final PaymentMethodUpdateOneRequiredWithoutTransactionsInput? paymentMethod;
  final OrderUpdateOneRequiredWithoutTransactionsInput? order;
  final MpesaPaymentUpdateOneWithoutTransactionInput? mpesaPayment;
  final SelcomDisbursementUpdateOneWithoutTransactionInput? selcomDisbursement;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (paymentMethod != null) {
      paymentMethod!.getFilesVariables(
          field_name: '${field_name}_paymentMethod', variables: variables);
    }

    if (order != null) {
      order!.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
    }

    if (mpesaPayment != null) {
      mpesaPayment!.getFilesVariables(
          field_name: '${field_name}_mpesaPayment', variables: variables);
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
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
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
        ),
      if (paymentMethod != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethod'),
          value: paymentMethod!
              .toValueNode(field_name: '${field_name}_paymentMethod'),
        ),
      if (order != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'order'),
          value: order!.toValueNode(field_name: '${field_name}_order'),
        ),
      if (mpesaPayment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPayment'),
          value: mpesaPayment!
              .toValueNode(field_name: '${field_name}_mpesaPayment'),
        ),
      if (selcomDisbursement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursement'),
          value: selcomDisbursement!
              .toValueNode(field_name: '${field_name}_selcomDisbursement'),
        )
    ]);
  }

  TransactionUpdateWithoutSelcomPaymentInput(
      {this.id,
      this.type,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.paymentMethod,
      this.order,
      this.mpesaPayment,
      this.selcomDisbursement});

  static TransactionUpdateWithoutSelcomPaymentInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionUpdateWithoutSelcomPaymentInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      type: json['type'] != null
          ? EnumTransactionTypeFieldUpdateOperationsInput.fromJson(json['type'])
          : null,
      status: json['status'] != null
          ? EnumTransactionStatusFieldUpdateOperationsInput.fromJson(
              json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      paymentMethod: json['paymentMethod'] != null
          ? PaymentMethodUpdateOneRequiredWithoutTransactionsInput.fromJson(
              json['paymentMethod'])
          : null,
      order: json['order'] != null
          ? OrderUpdateOneRequiredWithoutTransactionsInput.fromJson(
              json['order'])
          : null,
      mpesaPayment: json['mpesaPayment'] != null
          ? MpesaPaymentUpdateOneWithoutTransactionInput.fromJson(
              json['mpesaPayment'])
          : null,
      selcomDisbursement: json['selcomDisbursement'] != null
          ? SelcomDisbursementUpdateOneWithoutTransactionInput.fromJson(
              json['selcomDisbursement'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (paymentMethod != null) _data['paymentMethod'] = paymentMethod!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    if (mpesaPayment != null) _data['mpesaPayment'] = mpesaPayment!.toJson();
    if (selcomDisbursement != null)
      _data['selcomDisbursement'] = selcomDisbursement!.toJson();
    return _data;
  }

  TransactionUpdateWithoutSelcomPaymentInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      EnumTransactionTypeFieldUpdateOperationsInput? type,
      EnumTransactionStatusFieldUpdateOperationsInput? status,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      PaymentMethodUpdateOneRequiredWithoutTransactionsInput? paymentMethod,
      OrderUpdateOneRequiredWithoutTransactionsInput? order,
      MpesaPaymentUpdateOneWithoutTransactionInput? mpesaPayment,
      SelcomDisbursementUpdateOneWithoutTransactionInput? selcomDisbursement}) {
    return TransactionUpdateWithoutSelcomPaymentInput(
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
        selcomDisbursement
      ];
}
