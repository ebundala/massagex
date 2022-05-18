import 'transaction_type.dart';
import 'transaction_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionCreateManyPaymentMethodInput extends Equatable {
  final String? id;
  final TransactionType type;
  final String orderId;
  final String? mpesaPaymentId;
  final String? selcomPaymentId;
  final String? selcomDisbursementId;
  final TransactionStatus? status;
  final RecordStatus? recordStatus;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'type'),
        value: ast.EnumValueNode(name: ast.NameNode(value: type.toJson())),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'orderId'),
        value: ast.StringValueNode(value: '${orderId}', isBlock: false),
      ),
      if (mpesaPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mpesaPaymentId'),
          value:
              ast.StringValueNode(value: '${mpesaPaymentId!}', isBlock: false),
        ),
      if (selcomPaymentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomPaymentId'),
          value:
              ast.StringValueNode(value: '${selcomPaymentId!}', isBlock: false),
        ),
      if (selcomDisbursementId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'selcomDisbursementId'),
          value: ast.StringValueNode(
              value: '${selcomDisbursementId!}', isBlock: false),
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
        )
    ]);
  }

  TransactionCreateManyPaymentMethodInput(
      {this.id,
      required this.type,
      required this.orderId,
      this.mpesaPaymentId,
      this.selcomPaymentId,
      this.selcomDisbursementId,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static TransactionCreateManyPaymentMethodInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionCreateManyPaymentMethodInput(
      id: json['id'],
      type: TransactionTypeExt.fromJson(json['type']),
      orderId: json['orderId'],
      mpesaPaymentId: json['mpesaPaymentId'],
      selcomPaymentId: json['selcomPaymentId'],
      selcomDisbursementId: json['selcomDisbursementId'],
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
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['type'] = type.toJson();

    _data['orderId'] = orderId;
    if (mpesaPaymentId != null) _data['mpesaPaymentId'] = mpesaPaymentId;
    if (selcomPaymentId != null) _data['selcomPaymentId'] = selcomPaymentId;
    if (selcomDisbursementId != null)
      _data['selcomDisbursementId'] = selcomDisbursementId;
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  TransactionCreateManyPaymentMethodInput copyWith(
      {String? id,
      TransactionType? type,
      String? orderId,
      String? mpesaPaymentId,
      String? selcomPaymentId,
      String? selcomDisbursementId,
      TransactionStatus? status,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return TransactionCreateManyPaymentMethodInput(
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
