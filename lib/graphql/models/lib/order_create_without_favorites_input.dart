import 'record_status.dart';
import 'order_status.dart';
import 'scalars/json_object.dart';
import 'user_create_nested_one_without_ordered_input.dart';
import 'attachment_create_nested_one_without_orders_input.dart';
import 'service_create_nested_one_without_orders_input.dart';
import 'transaction_create_nested_many_without_order_input.dart';
import 'business_create_nested_one_without_orders_input.dart';
import 'abuse_report_create_nested_many_without_order_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderCreateWithoutFavoritesInput extends Equatable {
  final String? id;
  final int quantity;
  final RecordStatus? recordStatus;
  final OrderStatus? orderStatus;
  final String? notes;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedOneWithoutOrderedInput owner;
  final AttachmentCreateNestedOneWithoutOrdersInput? receipt;
  final ServiceCreateNestedOneWithoutOrdersInput service;
  final TransactionCreateNestedManyWithoutOrderInput? transactions;
  final BusinessCreateNestedOneWithoutOrdersInput? business;
  final AbuseReportCreateNestedManyWithoutOrderInput? abuseReports;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      owner.getFilesVariables(
          field_name: '${field_name}_owner', variables: variables);
    }

    if (receipt != null) {
      receipt!.getFilesVariables(
          field_name: '${field_name}_receipt', variables: variables);
    }

    {
      service.getFilesVariables(
          field_name: '${field_name}_service', variables: variables);
    }

    if (transactions != null) {
      transactions!.getFilesVariables(
          field_name: '${field_name}_transactions', variables: variables);
    }

    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
    }

    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
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
        name: ast.NameNode(value: 'quantity'),
        value: ast.IntValueNode(value: '${quantity}'),
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
          value: ast.StringValueNode(value: '${notes!}', isBlock: false),
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
        name: ast.NameNode(value: 'owner'),
        value: owner.toValueNode(field_name: '${field_name}_owner'),
      ),
      if (receipt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'receipt'),
          value: receipt!.toValueNode(field_name: '${field_name}_receipt'),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'service'),
        value: service.toValueNode(field_name: '${field_name}_service'),
      ),
      if (transactions != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transactions'),
          value: transactions!
              .toValueNode(field_name: '${field_name}_transactions'),
        ),
      if (business != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'business'),
          value: business!.toValueNode(field_name: '${field_name}_business'),
        ),
      if (abuseReports != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReports'),
          value: abuseReports!
              .toValueNode(field_name: '${field_name}_abuseReports'),
        )
    ]);
  }

  OrderCreateWithoutFavoritesInput(
      {this.id,
      required this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      required this.owner,
      this.receipt,
      required this.service,
      this.transactions,
      this.business,
      this.abuseReports});

  static OrderCreateWithoutFavoritesInput fromJson(Map<dynamic, dynamic> json) {
    return OrderCreateWithoutFavoritesInput(
      id: json['id'],
      quantity: json['quantity'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? OrderStatusExt.fromJson(json['orderStatus'])
          : null,
      notes: json['notes'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      owner: UserCreateNestedOneWithoutOrderedInput.fromJson(json['owner']),
      receipt: json['receipt'] != null
          ? AttachmentCreateNestedOneWithoutOrdersInput.fromJson(
              json['receipt'])
          : null,
      service:
          ServiceCreateNestedOneWithoutOrdersInput.fromJson(json['service']),
      transactions: json['transactions'] != null
          ? TransactionCreateNestedManyWithoutOrderInput.fromJson(
              json['transactions'])
          : null,
      business: json['business'] != null
          ? BusinessCreateNestedOneWithoutOrdersInput.fromJson(json['business'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportCreateNestedManyWithoutOrderInput.fromJson(
              json['abuseReports'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['quantity'] = quantity;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (orderStatus != null) _data['orderStatus'] = orderStatus!.toJson();
    if (notes != null) _data['notes'] = notes;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['owner'] = owner.toJson();
    if (receipt != null) _data['receipt'] = receipt!.toJson();

    _data['service'] = service.toJson();
    if (transactions != null) _data['transactions'] = transactions!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    return _data;
  }

  OrderCreateWithoutFavoritesInput copyWith(
      {String? id,
      int? quantity,
      RecordStatus? recordStatus,
      OrderStatus? orderStatus,
      String? notes,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedOneWithoutOrderedInput? owner,
      AttachmentCreateNestedOneWithoutOrdersInput? receipt,
      ServiceCreateNestedOneWithoutOrdersInput? service,
      TransactionCreateNestedManyWithoutOrderInput? transactions,
      BusinessCreateNestedOneWithoutOrdersInput? business,
      AbuseReportCreateNestedManyWithoutOrderInput? abuseReports}) {
    return OrderCreateWithoutFavoritesInput(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        recordStatus: recordStatus ?? this.recordStatus,
        orderStatus: orderStatus ?? this.orderStatus,
        notes: notes ?? this.notes,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        owner: owner ?? this.owner,
        receipt: receipt ?? this.receipt,
        service: service ?? this.service,
        transactions: transactions ?? this.transactions,
        business: business ?? this.business,
        abuseReports: abuseReports ?? this.abuseReports);
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
        owner,
        receipt,
        service,
        transactions,
        business,
        abuseReports
      ];
}
