import 'string_field_update_operations_input.dart';
import 'enum_transaction_type_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_transaction_status_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionUncheckedUpdateWithoutPaymentMethodInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final EnumTransactionTypeFieldUpdateOperationsInput? type;
  final StringFieldUpdateOperationsInput? orderId;
  final NullableStringFieldUpdateOperationsInput? mpesaPaymentId;
  final NullableStringFieldUpdateOperationsInput? selcomPaymentId;
  final NullableStringFieldUpdateOperationsInput? selcomDisbursementId;
  final EnumTransactionStatusFieldUpdateOperationsInput? status;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;

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

  TransactionUncheckedUpdateWithoutPaymentMethodInput(
      {this.id,
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

  static TransactionUncheckedUpdateWithoutPaymentMethodInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionUncheckedUpdateWithoutPaymentMethodInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      type: json['type'] != null
          ? EnumTransactionTypeFieldUpdateOperationsInput.fromJson(json['type'])
          : null,
      orderId: json['orderId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['orderId'])
          : null,
      mpesaPaymentId: json['mpesaPaymentId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['mpesaPaymentId'])
          : null,
      selcomPaymentId: json['selcomPaymentId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['selcomPaymentId'])
          : null,
      selcomDisbursementId: json['selcomDisbursementId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['selcomDisbursementId'])
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
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
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

  TransactionUncheckedUpdateWithoutPaymentMethodInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      EnumTransactionTypeFieldUpdateOperationsInput? type,
      StringFieldUpdateOperationsInput? orderId,
      NullableStringFieldUpdateOperationsInput? mpesaPaymentId,
      NullableStringFieldUpdateOperationsInput? selcomPaymentId,
      NullableStringFieldUpdateOperationsInput? selcomDisbursementId,
      EnumTransactionStatusFieldUpdateOperationsInput? status,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt}) {
    return TransactionUncheckedUpdateWithoutPaymentMethodInput(
        id: id ?? this.id,
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
        id,
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
