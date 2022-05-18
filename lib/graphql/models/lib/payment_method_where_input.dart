import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'attachment_relation_filter.dart';
import 'enum_selcom_utility_code_filter.dart';
import 'transaction_list_relation_filter.dart';
import 'enum_record_status_filter.dart';
import 'enum_payment_method_status_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodWhereInput extends Equatable {
  final List<PaymentMethodWhereInput>? AND;
  final List<PaymentMethodWhereInput>? OR;
  final List<PaymentMethodWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? name;
  final StringNullableFilter? description;
  final AttachmentRelationFilter? logo;
  final StringFilter? attachmentId;
  final EnumSelcomUtilityCodeFilter? code;
  final TransactionListRelationFilter? transactions;
  final EnumRecordStatusFilter? recordStatus;
  final EnumPaymentMethodStatusFilter? status;
  final JsonNullableFilter? metadata;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;

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

    if (name != null) {
      name!.getFilesVariables(
          field_name: '${field_name}_name', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (logo != null) {
      logo!.getFilesVariables(
          field_name: '${field_name}_logo', variables: variables);
    }

    if (attachmentId != null) {
      attachmentId!.getFilesVariables(
          field_name: '${field_name}_attachmentId', variables: variables);
    }

    if (code != null) {
      code!.getFilesVariables(
          field_name: '${field_name}_code', variables: variables);
    }

    if (transactions != null) {
      transactions!.getFilesVariables(
          field_name: '${field_name}_transactions', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
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
      if (logo != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'logo'),
          value: logo!.toValueNode(field_name: '${field_name}_logo'),
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
      if (transactions != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transactions'),
          value: transactions!
              .toValueNode(field_name: '${field_name}_transactions'),
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
        )
    ]);
  }

  PaymentMethodWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.name,
      this.description,
      this.logo,
      this.attachmentId,
      this.code,
      this.transactions,
      this.recordStatus,
      this.status,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static PaymentMethodWhereInput fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => PaymentMethodWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => PaymentMethodWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => PaymentMethodWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      name: json['name'] != null ? StringFilter.fromJson(json['name']) : null,
      description: json['description'] != null
          ? StringNullableFilter.fromJson(json['description'])
          : null,
      logo: json['logo'] != null
          ? AttachmentRelationFilter.fromJson(json['logo'])
          : null,
      attachmentId: json['attachmentId'] != null
          ? StringFilter.fromJson(json['attachmentId'])
          : null,
      code: json['code'] != null
          ? EnumSelcomUtilityCodeFilter.fromJson(json['code'])
          : null,
      transactions: json['transactions'] != null
          ? TransactionListRelationFilter.fromJson(json['transactions'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      status: json['status'] != null
          ? EnumPaymentMethodStatusFilter.fromJson(json['status'])
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
    if (name != null) _data['name'] = name!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (logo != null) _data['logo'] = logo!.toJson();
    if (attachmentId != null) _data['attachmentId'] = attachmentId!.toJson();
    if (code != null) _data['code'] = code!.toJson();
    if (transactions != null) _data['transactions'] = transactions!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  PaymentMethodWhereInput copyWith(
      {List<PaymentMethodWhereInput>? AND,
      List<PaymentMethodWhereInput>? OR,
      List<PaymentMethodWhereInput>? NOT,
      StringFilter? id,
      StringFilter? name,
      StringNullableFilter? description,
      AttachmentRelationFilter? logo,
      StringFilter? attachmentId,
      EnumSelcomUtilityCodeFilter? code,
      TransactionListRelationFilter? transactions,
      EnumRecordStatusFilter? recordStatus,
      EnumPaymentMethodStatusFilter? status,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return PaymentMethodWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        attachmentId: attachmentId ?? this.attachmentId,
        code: code ?? this.code,
        transactions: transactions ?? this.transactions,
        recordStatus: recordStatus ?? this.recordStatus,
        status: status ?? this.status,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        name,
        description,
        logo,
        attachmentId,
        code,
        transactions,
        recordStatus,
        status,
        metadata,
        createdAt,
        updatedAt
      ];
}
