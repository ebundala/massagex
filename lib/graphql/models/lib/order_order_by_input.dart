import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? quantity;
  final SortOrder? recordStatus;
  final SortOrder? orderStatus;
  final SortOrder? notes;
  final SortOrder? metadata;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? ownerId;
  final SortOrder? receiptId;
  final SortOrder? serviceId;
  final SortOrder? businessId;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (quantity != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'quantity'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: quantity!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (orderStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: orderStatus!.toJson())),
        ),
      if (notes != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'notes'),
          value: ast.EnumValueNode(name: ast.NameNode(value: notes!.toJson())),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: metadata!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        ),
      if (ownerId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ownerId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: ownerId!.toJson())),
        ),
      if (receiptId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'receiptId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: receiptId!.toJson())),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: serviceId!.toJson())),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: businessId!.toJson())),
        )
    ]);
  }

  OrderOrderByInput(
      {this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.receiptId,
      this.serviceId,
      this.businessId});

  static OrderOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return OrderOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      quantity: json['quantity'] != null
          ? SortOrderExt.fromJson(json['quantity'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? SortOrderExt.fromJson(json['orderStatus'])
          : null,
      notes:
          json['notes'] != null ? SortOrderExt.fromJson(json['notes']) : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      ownerId: json['ownerId'] != null
          ? SortOrderExt.fromJson(json['ownerId'])
          : null,
      receiptId: json['receiptId'] != null
          ? SortOrderExt.fromJson(json['receiptId'])
          : null,
      serviceId: json['serviceId'] != null
          ? SortOrderExt.fromJson(json['serviceId'])
          : null,
      businessId: json['businessId'] != null
          ? SortOrderExt.fromJson(json['businessId'])
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
    if (receiptId != null) _data['receiptId'] = receiptId!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    return _data;
  }

  OrderOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? quantity,
      SortOrder? recordStatus,
      SortOrder? orderStatus,
      SortOrder? notes,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? ownerId,
      SortOrder? receiptId,
      SortOrder? serviceId,
      SortOrder? businessId}) {
    return OrderOrderByInput(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ownerId: ownerId ?? this.ownerId,
        receiptId: receiptId ?? this.receiptId,
        serviceId: serviceId ?? this.serviceId,
        businessId: businessId ?? this.businessId);
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
        receiptId,
        serviceId,
        businessId
      ];
}
