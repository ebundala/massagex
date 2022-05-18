import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'transaction_relation_filter.dart';
import 'enum_payment_status_filter.dart';
import 'enum_record_status_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class MpesaPaymentWhereInput extends Equatable {
  final List<MpesaPaymentWhereInput>? AND;
  final List<MpesaPaymentWhereInput>? OR;
  final List<MpesaPaymentWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? input$Amount;
  final StringFilter? input$Country;
  final StringFilter? input$Currency;
  final StringFilter? input$CustomerMSISDN;
  final StringFilter? input$ServiceProviderCode;
  final StringFilter? input$ThirdPartyConversationID;
  final StringFilter? input$TransactionReference;
  final StringFilter? input$PurchasedItemsDesc;
  final StringNullableFilter? output$ConversationID;
  final StringNullableFilter? output$ResponseCode;
  final StringNullableFilter? output$ResponseDesc;
  final StringNullableFilter? output$ThirdPartyConversationID;
  final StringNullableFilter? output$TransactionID;
  final TransactionRelationFilter? transaction;
  final EnumPaymentStatusFilter? status;
  final EnumRecordStatusFilter? recordStatus;
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

    if (input$Amount != null) {
      input$Amount!.getFilesVariables(
          field_name: '${field_name}_input_Amount', variables: variables);
    }

    if (input$Country != null) {
      input$Country!.getFilesVariables(
          field_name: '${field_name}_input_Country', variables: variables);
    }

    if (input$Currency != null) {
      input$Currency!.getFilesVariables(
          field_name: '${field_name}_input_Currency', variables: variables);
    }

    if (input$CustomerMSISDN != null) {
      input$CustomerMSISDN!.getFilesVariables(
          field_name: '${field_name}_input_CustomerMSISDN',
          variables: variables);
    }

    if (input$ServiceProviderCode != null) {
      input$ServiceProviderCode!.getFilesVariables(
          field_name: '${field_name}_input_ServiceProviderCode',
          variables: variables);
    }

    if (input$ThirdPartyConversationID != null) {
      input$ThirdPartyConversationID!.getFilesVariables(
          field_name: '${field_name}_input_ThirdPartyConversationID',
          variables: variables);
    }

    if (input$TransactionReference != null) {
      input$TransactionReference!.getFilesVariables(
          field_name: '${field_name}_input_TransactionReference',
          variables: variables);
    }

    if (input$PurchasedItemsDesc != null) {
      input$PurchasedItemsDesc!.getFilesVariables(
          field_name: '${field_name}_input_PurchasedItemsDesc',
          variables: variables);
    }

    if (output$ConversationID != null) {
      output$ConversationID!.getFilesVariables(
          field_name: '${field_name}_output_ConversationID',
          variables: variables);
    }

    if (output$ResponseCode != null) {
      output$ResponseCode!.getFilesVariables(
          field_name: '${field_name}_output_ResponseCode',
          variables: variables);
    }

    if (output$ResponseDesc != null) {
      output$ResponseDesc!.getFilesVariables(
          field_name: '${field_name}_output_ResponseDesc',
          variables: variables);
    }

    if (output$ThirdPartyConversationID != null) {
      output$ThirdPartyConversationID!.getFilesVariables(
          field_name: '${field_name}_output_ThirdPartyConversationID',
          variables: variables);
    }

    if (output$TransactionID != null) {
      output$TransactionID!.getFilesVariables(
          field_name: '${field_name}_output_TransactionID',
          variables: variables);
    }

    if (transaction != null) {
      transaction!.getFilesVariables(
          field_name: '${field_name}_transaction', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
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
      if (input$Amount != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Amount'),
          value: input$Amount!
              .toValueNode(field_name: '${field_name}_input_Amount'),
        ),
      if (input$Country != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Country'),
          value: input$Country!
              .toValueNode(field_name: '${field_name}_input_Country'),
        ),
      if (input$Currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Currency'),
          value: input$Currency!
              .toValueNode(field_name: '${field_name}_input_Currency'),
        ),
      if (input$CustomerMSISDN != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_CustomerMSISDN'),
          value: input$CustomerMSISDN!
              .toValueNode(field_name: '${field_name}_input_CustomerMSISDN'),
        ),
      if (input$ServiceProviderCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_ServiceProviderCode'),
          value: input$ServiceProviderCode!.toValueNode(
              field_name: '${field_name}_input_ServiceProviderCode'),
        ),
      if (input$ThirdPartyConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_ThirdPartyConversationID'),
          value: input$ThirdPartyConversationID!.toValueNode(
              field_name: '${field_name}_input_ThirdPartyConversationID'),
        ),
      if (input$TransactionReference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_TransactionReference'),
          value: input$TransactionReference!.toValueNode(
              field_name: '${field_name}_input_TransactionReference'),
        ),
      if (input$PurchasedItemsDesc != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_PurchasedItemsDesc'),
          value: input$PurchasedItemsDesc!.toValueNode(
              field_name: '${field_name}_input_PurchasedItemsDesc'),
        ),
      if (output$ConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ConversationID'),
          value: output$ConversationID!
              .toValueNode(field_name: '${field_name}_output_ConversationID'),
        ),
      if (output$ResponseCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseCode'),
          value: output$ResponseCode!
              .toValueNode(field_name: '${field_name}_output_ResponseCode'),
        ),
      if (output$ResponseDesc != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseDesc'),
          value: output$ResponseDesc!
              .toValueNode(field_name: '${field_name}_output_ResponseDesc'),
        ),
      if (output$ThirdPartyConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ThirdPartyConversationID'),
          value: output$ThirdPartyConversationID!.toValueNode(
              field_name: '${field_name}_output_ThirdPartyConversationID'),
        ),
      if (output$TransactionID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_TransactionID'),
          value: output$TransactionID!
              .toValueNode(field_name: '${field_name}_output_TransactionID'),
        ),
      if (transaction != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'transaction'),
          value:
              transaction!.toValueNode(field_name: '${field_name}_transaction'),
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

  MpesaPaymentWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.input$Amount,
      this.input$Country,
      this.input$Currency,
      this.input$CustomerMSISDN,
      this.input$ServiceProviderCode,
      this.input$ThirdPartyConversationID,
      this.input$TransactionReference,
      this.input$PurchasedItemsDesc,
      this.output$ConversationID,
      this.output$ResponseCode,
      this.output$ResponseDesc,
      this.output$ThirdPartyConversationID,
      this.output$TransactionID,
      this.transaction,
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static MpesaPaymentWhereInput fromJson(Map<dynamic, dynamic> json) {
    return MpesaPaymentWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => MpesaPaymentWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => MpesaPaymentWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => MpesaPaymentWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      input$Amount: json['input_Amount'] != null
          ? StringFilter.fromJson(json['input_Amount'])
          : null,
      input$Country: json['input_Country'] != null
          ? StringFilter.fromJson(json['input_Country'])
          : null,
      input$Currency: json['input_Currency'] != null
          ? StringFilter.fromJson(json['input_Currency'])
          : null,
      input$CustomerMSISDN: json['input_CustomerMSISDN'] != null
          ? StringFilter.fromJson(json['input_CustomerMSISDN'])
          : null,
      input$ServiceProviderCode: json['input_ServiceProviderCode'] != null
          ? StringFilter.fromJson(json['input_ServiceProviderCode'])
          : null,
      input$ThirdPartyConversationID:
          json['input_ThirdPartyConversationID'] != null
              ? StringFilter.fromJson(json['input_ThirdPartyConversationID'])
              : null,
      input$TransactionReference: json['input_TransactionReference'] != null
          ? StringFilter.fromJson(json['input_TransactionReference'])
          : null,
      input$PurchasedItemsDesc: json['input_PurchasedItemsDesc'] != null
          ? StringFilter.fromJson(json['input_PurchasedItemsDesc'])
          : null,
      output$ConversationID: json['output_ConversationID'] != null
          ? StringNullableFilter.fromJson(json['output_ConversationID'])
          : null,
      output$ResponseCode: json['output_ResponseCode'] != null
          ? StringNullableFilter.fromJson(json['output_ResponseCode'])
          : null,
      output$ResponseDesc: json['output_ResponseDesc'] != null
          ? StringNullableFilter.fromJson(json['output_ResponseDesc'])
          : null,
      output$ThirdPartyConversationID:
          json['output_ThirdPartyConversationID'] != null
              ? StringNullableFilter.fromJson(
                  json['output_ThirdPartyConversationID'])
              : null,
      output$TransactionID: json['output_TransactionID'] != null
          ? StringNullableFilter.fromJson(json['output_TransactionID'])
          : null,
      transaction: json['transaction'] != null
          ? TransactionRelationFilter.fromJson(json['transaction'])
          : null,
      status: json['status'] != null
          ? EnumPaymentStatusFilter.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
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
    if (input$Amount != null) _data['input_Amount'] = input$Amount!.toJson();
    if (input$Country != null) _data['input_Country'] = input$Country!.toJson();
    if (input$Currency != null)
      _data['input_Currency'] = input$Currency!.toJson();
    if (input$CustomerMSISDN != null)
      _data['input_CustomerMSISDN'] = input$CustomerMSISDN!.toJson();
    if (input$ServiceProviderCode != null)
      _data['input_ServiceProviderCode'] = input$ServiceProviderCode!.toJson();
    if (input$ThirdPartyConversationID != null)
      _data['input_ThirdPartyConversationID'] =
          input$ThirdPartyConversationID!.toJson();
    if (input$TransactionReference != null)
      _data['input_TransactionReference'] =
          input$TransactionReference!.toJson();
    if (input$PurchasedItemsDesc != null)
      _data['input_PurchasedItemsDesc'] = input$PurchasedItemsDesc!.toJson();
    if (output$ConversationID != null)
      _data['output_ConversationID'] = output$ConversationID!.toJson();
    if (output$ResponseCode != null)
      _data['output_ResponseCode'] = output$ResponseCode!.toJson();
    if (output$ResponseDesc != null)
      _data['output_ResponseDesc'] = output$ResponseDesc!.toJson();
    if (output$ThirdPartyConversationID != null)
      _data['output_ThirdPartyConversationID'] =
          output$ThirdPartyConversationID!.toJson();
    if (output$TransactionID != null)
      _data['output_TransactionID'] = output$TransactionID!.toJson();
    if (transaction != null) _data['transaction'] = transaction!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  MpesaPaymentWhereInput copyWith(
      {List<MpesaPaymentWhereInput>? AND,
      List<MpesaPaymentWhereInput>? OR,
      List<MpesaPaymentWhereInput>? NOT,
      StringFilter? id,
      StringFilter? input$Amount,
      StringFilter? input$Country,
      StringFilter? input$Currency,
      StringFilter? input$CustomerMSISDN,
      StringFilter? input$ServiceProviderCode,
      StringFilter? input$ThirdPartyConversationID,
      StringFilter? input$TransactionReference,
      StringFilter? input$PurchasedItemsDesc,
      StringNullableFilter? output$ConversationID,
      StringNullableFilter? output$ResponseCode,
      StringNullableFilter? output$ResponseDesc,
      StringNullableFilter? output$ThirdPartyConversationID,
      StringNullableFilter? output$TransactionID,
      TransactionRelationFilter? transaction,
      EnumPaymentStatusFilter? status,
      EnumRecordStatusFilter? recordStatus,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return MpesaPaymentWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        input$Amount: input$Amount ?? this.input$Amount,
        input$Country: input$Country ?? this.input$Country,
        input$Currency: input$Currency ?? this.input$Currency,
        input$CustomerMSISDN: input$CustomerMSISDN ?? this.input$CustomerMSISDN,
        input$ServiceProviderCode:
            input$ServiceProviderCode ?? this.input$ServiceProviderCode,
        input$ThirdPartyConversationID: input$ThirdPartyConversationID ??
            this.input$ThirdPartyConversationID,
        input$TransactionReference:
            input$TransactionReference ?? this.input$TransactionReference,
        input$PurchasedItemsDesc:
            input$PurchasedItemsDesc ?? this.input$PurchasedItemsDesc,
        output$ConversationID:
            output$ConversationID ?? this.output$ConversationID,
        output$ResponseCode: output$ResponseCode ?? this.output$ResponseCode,
        output$ResponseDesc: output$ResponseDesc ?? this.output$ResponseDesc,
        output$ThirdPartyConversationID: output$ThirdPartyConversationID ??
            this.output$ThirdPartyConversationID,
        output$TransactionID: output$TransactionID ?? this.output$TransactionID,
        transaction: transaction ?? this.transaction,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        input$Amount,
        input$Country,
        input$Currency,
        input$CustomerMSISDN,
        input$ServiceProviderCode,
        input$ThirdPartyConversationID,
        input$TransactionReference,
        input$PurchasedItemsDesc,
        output$ConversationID,
        output$ResponseCode,
        output$ResponseDesc,
        output$ThirdPartyConversationID,
        output$TransactionID,
        transaction,
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
