import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_selcom_utility_code_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_payment_method_status_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';
import 'transaction_unchecked_update_many_without_payment_method_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodUncheckedUpdateInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? name;
  final NullableStringFieldUpdateOperationsInput? description;
  final StringFieldUpdateOperationsInput? attachmentId;
  final EnumSelcomUtilityCodeFieldUpdateOperationsInput? code;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumPaymentMethodStatusFieldUpdateOperationsInput? status;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final TransactionUncheckedUpdateManyWithoutPaymentMethodInput? transactions;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (name != null) {
      name!.getFilesVariables(
          field_name: '${field_name}_name', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (attachmentId != null) {
      attachmentId!.getFilesVariables(
          field_name: '${field_name}_attachmentId', variables: variables);
    }

    if (code != null) {
      code!.getFilesVariables(
          field_name: '${field_name}_code', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (transactions != null) {
      transactions!.getFilesVariables(
          field_name: '${field_name}_transactions', variables: variables);
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
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: name!.toValueNode(field_name: '${field_name}_name'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (attachmentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachmentId'),
          value: attachmentId!
              .toValueNode(field_name: '${field_name}_attachmentId'),
        ),
      if (code != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'code'),
          value: code!.toValueNode(field_name: '${field_name}_code'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: status!.toValueNode(field_name: '${field_name}_status'),
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
      if (transactions != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transactions'),
          value: transactions!
              .toValueNode(field_name: '${field_name}_transactions'),
        )
    ]);
  }

  PaymentMethodUncheckedUpdateInput(
      {this.id,
      this.name,
      this.description,
      this.attachmentId,
      this.code,
      this.recordStatus,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.transactions});

  static PaymentMethodUncheckedUpdateInput fromJson(
      Map<dynamic, dynamic> json) {
    return PaymentMethodUncheckedUpdateInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      name: json['name'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['name'])
          : null,
      description: json['description'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['description'])
          : null,
      attachmentId: json['attachmentId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['attachmentId'])
          : null,
      code: json['code'] != null
          ? EnumSelcomUtilityCodeFieldUpdateOperationsInput.fromJson(
              json['code'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      status: json['status'] != null
          ? EnumPaymentMethodStatusFieldUpdateOperationsInput.fromJson(
              json['status'])
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
      transactions: json['transactions'] != null
          ? TransactionUncheckedUpdateManyWithoutPaymentMethodInput.fromJson(
              json['transactions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (attachmentId != null) _data['attachmentId'] = attachmentId!.toJson();
    if (code != null) _data['code'] = code!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (transactions != null) _data['transactions'] = transactions!.toJson();
    return _data;
  }

  PaymentMethodUncheckedUpdateInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? name,
      NullableStringFieldUpdateOperationsInput? description,
      StringFieldUpdateOperationsInput? attachmentId,
      EnumSelcomUtilityCodeFieldUpdateOperationsInput? code,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumPaymentMethodStatusFieldUpdateOperationsInput? status,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      TransactionUncheckedUpdateManyWithoutPaymentMethodInput? transactions}) {
    return PaymentMethodUncheckedUpdateInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        transactions: transactions ?? this.transactions);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        attachmentId,
        code,
        recordStatus,
        status,
        metadata,
        createdAt,
        updatedAt,
        transactions
      ];
}
