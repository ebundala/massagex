import 'record_status.dart';
import 'order_status.dart';
import 'scalars/json_object.dart';
import 'abuse_report_unchecked_create_nested_many_without_order_input.dart';
import 'favorite_unchecked_create_nested_many_without_order_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderUncheckedCreateWithoutTransactionsInput extends Equatable {
  final String? id;
  final int quantity;
  final RecordStatus? recordStatus;
  final OrderStatus? orderStatus;
  final String? notes;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String ownerId;
  final String? receiptId;
  final String serviceId;
  final String? businessId;
  final AbuseReportUncheckedCreateNestedManyWithoutOrderInput? abuseReports;
  final FavoriteUncheckedCreateNestedManyWithoutOrderInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
        name: ast.NameNode(value: 'ownerId'),
        value: ast.StringValueNode(value: '${ownerId}', isBlock: false),
      ),
      if (receiptId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'receiptId'),
          value: ast.StringValueNode(value: '${receiptId!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'serviceId'),
        value: ast.StringValueNode(value: '${serviceId}', isBlock: false),
      ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.StringValueNode(value: '${businessId!}', isBlock: false),
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

  OrderUncheckedCreateWithoutTransactionsInput(
      {this.id,
      required this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      required this.ownerId,
      this.receiptId,
      required this.serviceId,
      this.businessId,
      this.abuseReports,
      this.favorites});

  static OrderUncheckedCreateWithoutTransactionsInput fromJson(
      Map<dynamic, dynamic> json) {
    return OrderUncheckedCreateWithoutTransactionsInput(
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
      ownerId: json['ownerId'],
      receiptId: json['receiptId'],
      serviceId: json['serviceId'],
      businessId: json['businessId'],
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutOrderInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedCreateNestedManyWithoutOrderInput.fromJson(
              json['favorites'])
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

    _data['ownerId'] = ownerId;
    if (receiptId != null) _data['receiptId'] = receiptId;

    _data['serviceId'] = serviceId;
    if (businessId != null) _data['businessId'] = businessId;
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  OrderUncheckedCreateWithoutTransactionsInput copyWith(
      {String? id,
      int? quantity,
      RecordStatus? recordStatus,
      OrderStatus? orderStatus,
      String? notes,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? ownerId,
      String? receiptId,
      String? serviceId,
      String? businessId,
      AbuseReportUncheckedCreateNestedManyWithoutOrderInput? abuseReports,
      FavoriteUncheckedCreateNestedManyWithoutOrderInput? favorites}) {
    return OrderUncheckedCreateWithoutTransactionsInput(
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
        businessId: businessId ?? this.businessId,
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
        receiptId,
        serviceId,
        businessId,
        abuseReports,
        favorites
      ];
}
