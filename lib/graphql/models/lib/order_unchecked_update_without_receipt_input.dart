import 'string_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_order_status_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';
import 'transaction_unchecked_update_many_without_order_input.dart';
import 'abuse_report_unchecked_update_many_without_order_input.dart';
import 'favorite_unchecked_update_many_without_order_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderUncheckedUpdateWithoutReceiptInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final IntFieldUpdateOperationsInput? quantity;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumOrderStatusFieldUpdateOperationsInput? orderStatus;
  final NullableStringFieldUpdateOperationsInput? notes;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final StringFieldUpdateOperationsInput? ownerId;
  final StringFieldUpdateOperationsInput? serviceId;
  final NullableStringFieldUpdateOperationsInput? businessId;
  final TransactionUncheckedUpdateManyWithoutOrderInput? transactions;
  final AbuseReportUncheckedUpdateManyWithoutOrderInput? abuseReports;
  final FavoriteUncheckedUpdateManyWithoutOrderInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (quantity != null) {
      quantity!.getFilesVariables(
          field_name: '${field_name}_quantity', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (orderStatus != null) {
      orderStatus!.getFilesVariables(
          field_name: '${field_name}_orderStatus', variables: variables);
    }

    if (notes != null) {
      notes!.getFilesVariables(
          field_name: '${field_name}_notes', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (ownerId != null) {
      ownerId!.getFilesVariables(
          field_name: '${field_name}_ownerId', variables: variables);
    }

    if (serviceId != null) {
      serviceId!.getFilesVariables(
          field_name: '${field_name}_serviceId', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
    }

    if (transactions != null) {
      transactions!.getFilesVariables(
          field_name: '${field_name}_transactions', variables: variables);
    }

    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
    }

    if (favorites != null) {
      favorites!.getFilesVariables(
          field_name: '${field_name}_favorites', variables: variables);
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
      if (quantity != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'quantity'),
          value: quantity!.toValueNode(field_name: '${field_name}_quantity'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (orderStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderStatus'),
          value:
              orderStatus!.toValueNode(field_name: '${field_name}_orderStatus'),
        ),
      if (notes != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'notes'),
          value: notes!.toValueNode(field_name: '${field_name}_notes'),
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
      if (ownerId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ownerId'),
          value: ownerId!.toValueNode(field_name: '${field_name}_ownerId'),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: serviceId!.toValueNode(field_name: '${field_name}_serviceId'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        ),
      if (transactions != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transactions'),
          value: transactions!
              .toValueNode(field_name: '${field_name}_transactions'),
        ),
      if (abuseReports != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReports'),
          value: abuseReports!
              .toValueNode(field_name: '${field_name}_abuseReports'),
        ),
      if (favorites != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favorites'),
          value: favorites!.toValueNode(field_name: '${field_name}_favorites'),
        )
    ]);
  }

  OrderUncheckedUpdateWithoutReceiptInput(
      {this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.serviceId,
      this.businessId,
      this.transactions,
      this.abuseReports,
      this.favorites});

  static OrderUncheckedUpdateWithoutReceiptInput fromJson(
      Map<dynamic, dynamic> json) {
    return OrderUncheckedUpdateWithoutReceiptInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      quantity: json['quantity'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['quantity'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? EnumOrderStatusFieldUpdateOperationsInput.fromJson(
              json['orderStatus'])
          : null,
      notes: json['notes'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['notes'])
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
      ownerId: json['ownerId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['ownerId'])
          : null,
      serviceId: json['serviceId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['serviceId'])
          : null,
      businessId: json['businessId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['businessId'])
          : null,
      transactions: json['transactions'] != null
          ? TransactionUncheckedUpdateManyWithoutOrderInput.fromJson(
              json['transactions'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedUpdateManyWithoutOrderInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedUpdateManyWithoutOrderInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (quantity != null) _data['quantity'] = quantity!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (orderStatus != null) _data['orderStatus'] = orderStatus!.toJson();
    if (notes != null) _data['notes'] = notes!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (ownerId != null) _data['ownerId'] = ownerId!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    if (transactions != null) _data['transactions'] = transactions!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  OrderUncheckedUpdateWithoutReceiptInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      IntFieldUpdateOperationsInput? quantity,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumOrderStatusFieldUpdateOperationsInput? orderStatus,
      NullableStringFieldUpdateOperationsInput? notes,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      StringFieldUpdateOperationsInput? ownerId,
      StringFieldUpdateOperationsInput? serviceId,
      NullableStringFieldUpdateOperationsInput? businessId,
      TransactionUncheckedUpdateManyWithoutOrderInput? transactions,
      AbuseReportUncheckedUpdateManyWithoutOrderInput? abuseReports,
      FavoriteUncheckedUpdateManyWithoutOrderInput? favorites}) {
    return OrderUncheckedUpdateWithoutReceiptInput(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        serviceId: serviceId ?? this.serviceId,
        businessId: businessId ?? this.businessId,
        transactions: transactions ?? this.transactions,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        quantity,
        recordStatus,
        orderStatus,
        notes,
        metadata,
        createdAt,
        updatedAt,
        ownerId,
        serviceId,
        businessId,
        transactions,
        abuseReports,
        favorites
      ];
}
