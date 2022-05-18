import 'string_filter.dart';
import 'int_filter.dart';
import 'enum_record_status_filter.dart';
import 'enum_order_status_filter.dart';
import 'string_nullable_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';
import 'user_relation_filter.dart';
import 'attachment_relation_filter.dart';
import 'service_relation_filter.dart';
import 'transaction_list_relation_filter.dart';
import 'business_relation_filter.dart';
import 'abuse_report_list_relation_filter.dart';
import 'favorite_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderWhereInput extends Equatable {
  final List<OrderWhereInput>? AND;
  final List<OrderWhereInput>? OR;
  final List<OrderWhereInput>? NOT;
  final StringFilter? id;
  final IntFilter? quantity;
  final EnumRecordStatusFilter? recordStatus;
  final EnumOrderStatusFilter? orderStatus;
  final StringNullableFilter? notes;
  final JsonNullableFilter? metadata;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final StringFilter? ownerId;
  final StringNullableFilter? receiptId;
  final UserRelationFilter? owner;
  final AttachmentRelationFilter? receipt;
  final ServiceRelationFilter? service;
  final StringFilter? serviceId;
  final TransactionListRelationFilter? transactions;
  final BusinessRelationFilter? business;
  final StringNullableFilter? businessId;
  final AbuseReportListRelationFilter? abuseReports;
  final FavoriteListRelationFilter? favorites;

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

    if (ownerId != null) {
      ownerId!.getFilesVariables(
          field_name: '${field_name}_ownerId', variables: variables);
    }

    if (receiptId != null) {
      receiptId!.getFilesVariables(
          field_name: '${field_name}_receiptId', variables: variables);
    }

    if (owner != null) {
      owner!.getFilesVariables(
          field_name: '${field_name}_owner', variables: variables);
    }

    if (receipt != null) {
      receipt!.getFilesVariables(
          field_name: '${field_name}_receipt', variables: variables);
    }

    if (service != null) {
      service!.getFilesVariables(
          field_name: '${field_name}_service', variables: variables);
    }

    if (serviceId != null) {
      serviceId!.getFilesVariables(
          field_name: '${field_name}_serviceId', variables: variables);
    }

    if (transactions != null) {
      transactions!.getFilesVariables(
          field_name: '${field_name}_transactions', variables: variables);
    }

    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
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
      if (receiptId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'receiptId'),
          value: receiptId!.toValueNode(field_name: '${field_name}_receiptId'),
        ),
      if (owner != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'owner'),
          value: owner!.toValueNode(field_name: '${field_name}_owner'),
        ),
      if (receipt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'receipt'),
          value: receipt!.toValueNode(field_name: '${field_name}_receipt'),
        ),
      if (service != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'service'),
          value: service!.toValueNode(field_name: '${field_name}_service'),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: serviceId!.toValueNode(field_name: '${field_name}_serviceId'),
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
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
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

  OrderWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.quantity,
      this.recordStatus,
      this.orderStatus,
      this.notes,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.ownerId,
      this.receiptId,
      this.owner,
      this.receipt,
      this.service,
      this.serviceId,
      this.transactions,
      this.business,
      this.businessId,
      this.abuseReports,
      this.favorites});

  static OrderWhereInput fromJson(Map<dynamic, dynamic> json) {
    return OrderWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => OrderWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => OrderWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => OrderWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      quantity: json['quantity'] != null
          ? IntFilter.fromJson(json['quantity'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      orderStatus: json['orderStatus'] != null
          ? EnumOrderStatusFilter.fromJson(json['orderStatus'])
          : null,
      notes: json['notes'] != null
          ? StringNullableFilter.fromJson(json['notes'])
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
      ownerId: json['ownerId'] != null
          ? StringFilter.fromJson(json['ownerId'])
          : null,
      receiptId: json['receiptId'] != null
          ? StringNullableFilter.fromJson(json['receiptId'])
          : null,
      owner: json['owner'] != null
          ? UserRelationFilter.fromJson(json['owner'])
          : null,
      receipt: json['receipt'] != null
          ? AttachmentRelationFilter.fromJson(json['receipt'])
          : null,
      service: json['service'] != null
          ? ServiceRelationFilter.fromJson(json['service'])
          : null,
      serviceId: json['serviceId'] != null
          ? StringFilter.fromJson(json['serviceId'])
          : null,
      transactions: json['transactions'] != null
          ? TransactionListRelationFilter.fromJson(json['transactions'])
          : null,
      business: json['business'] != null
          ? BusinessRelationFilter.fromJson(json['business'])
          : null,
      businessId: json['businessId'] != null
          ? StringNullableFilter.fromJson(json['businessId'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportListRelationFilter.fromJson(json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteListRelationFilter.fromJson(json['favorites'])
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
    if (quantity != null) _data['quantity'] = quantity!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (orderStatus != null) _data['orderStatus'] = orderStatus!.toJson();
    if (notes != null) _data['notes'] = notes!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (ownerId != null) _data['ownerId'] = ownerId!.toJson();
    if (receiptId != null) _data['receiptId'] = receiptId!.toJson();
    if (owner != null) _data['owner'] = owner!.toJson();
    if (receipt != null) _data['receipt'] = receipt!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId!.toJson();
    if (transactions != null) _data['transactions'] = transactions!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  OrderWhereInput copyWith(
      {List<OrderWhereInput>? AND,
      List<OrderWhereInput>? OR,
      List<OrderWhereInput>? NOT,
      StringFilter? id,
      IntFilter? quantity,
      EnumRecordStatusFilter? recordStatus,
      EnumOrderStatusFilter? orderStatus,
      StringNullableFilter? notes,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      StringFilter? ownerId,
      StringNullableFilter? receiptId,
      UserRelationFilter? owner,
      AttachmentRelationFilter? receipt,
      ServiceRelationFilter? service,
      StringFilter? serviceId,
      TransactionListRelationFilter? transactions,
      BusinessRelationFilter? business,
      StringNullableFilter? businessId,
      AbuseReportListRelationFilter? abuseReports,
      FavoriteListRelationFilter? favorites}) {
    return OrderWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
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
        owner: owner ?? this.owner,
        receipt: receipt ?? this.receipt,
        service: service ?? this.service,
        serviceId: serviceId ?? this.serviceId,
        transactions: transactions ?? this.transactions,
        business: business ?? this.business,
        businessId: businessId ?? this.businessId,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
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
        owner,
        receipt,
        service,
        serviceId,
        transactions,
        business,
        businessId,
        abuseReports,
        favorites
      ];
}
