import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? paymentMethodId;
  final SortOrder? type;
  final SortOrder? orderId;
  final SortOrder? mpesaPaymentId;
  final SortOrder? selcomPaymentId;
  final SortOrder? selcomDisbursementId;
  final SortOrder? status;
  final SortOrder? recordStatus;
  final SortOrder? metadata;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

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
      if (paymentMethodId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethodId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: paymentMethodId!.toJson())),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: ast.EnumValueNode(name: ast.NameNode(value: type!.toJson())),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: orderId!.toJson())),
        ),
      if (mpesaPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPaymentId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: mpesaPaymentId!.toJson())),
        ),
      if (selcomPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPaymentId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: selcomPaymentId!.toJson())),
        ),
      if (selcomDisbursementId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursementId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: selcomDisbursementId!.toJson())),
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
        )
    ]);
  }

  TransactionOrderByInput(
      {this.id,
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

  static TransactionOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return TransactionOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      paymentMethodId: json['paymentMethodId'] != null
          ? SortOrderExt.fromJson(json['paymentMethodId'])
          : null,
      type: json['type'] != null ? SortOrderExt.fromJson(json['type']) : null,
      orderId: json['orderId'] != null
          ? SortOrderExt.fromJson(json['orderId'])
          : null,
      mpesaPaymentId: json['mpesaPaymentId'] != null
          ? SortOrderExt.fromJson(json['mpesaPaymentId'])
          : null,
      selcomPaymentId: json['selcomPaymentId'] != null
          ? SortOrderExt.fromJson(json['selcomPaymentId'])
          : null,
      selcomDisbursementId: json['selcomDisbursementId'] != null
          ? SortOrderExt.fromJson(json['selcomDisbursementId'])
          : null,
      status:
          json['status'] != null ? SortOrderExt.fromJson(json['status']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
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

  TransactionOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? paymentMethodId,
      SortOrder? type,
      SortOrder? orderId,
      SortOrder? mpesaPaymentId,
      SortOrder? selcomPaymentId,
      SortOrder? selcomDisbursementId,
      SortOrder? status,
      SortOrder? recordStatus,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return TransactionOrderByInput(
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
