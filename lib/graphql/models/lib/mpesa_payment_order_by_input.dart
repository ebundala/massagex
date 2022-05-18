import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class MpesaPaymentOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? input$Amount;
  final SortOrder? input$Country;
  final SortOrder? input$Currency;
  final SortOrder? input$CustomerMSISDN;
  final SortOrder? input$ServiceProviderCode;
  final SortOrder? input$ThirdPartyConversationID;
  final SortOrder? input$TransactionReference;
  final SortOrder? input$PurchasedItemsDesc;
  final SortOrder? output$ConversationID;
  final SortOrder? output$ResponseCode;
  final SortOrder? output$ResponseDesc;
  final SortOrder? output$ThirdPartyConversationID;
  final SortOrder? output$TransactionID;
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
      if (input$Amount != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Amount'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$Amount!.toJson())),
        ),
      if (input$Country != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Country'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$Country!.toJson())),
        ),
      if (input$Currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Currency'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$Currency!.toJson())),
        ),
      if (input$CustomerMSISDN != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_CustomerMSISDN'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$CustomerMSISDN!.toJson())),
        ),
      if (input$ServiceProviderCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_ServiceProviderCode'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$ServiceProviderCode!.toJson())),
        ),
      if (input$ThirdPartyConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_ThirdPartyConversationID'),
          value: ast.EnumValueNode(
              name: ast.NameNode(
                  value: input$ThirdPartyConversationID!.toJson())),
        ),
      if (input$TransactionReference != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_TransactionReference'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$TransactionReference!.toJson())),
        ),
      if (input$PurchasedItemsDesc != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_PurchasedItemsDesc'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: input$PurchasedItemsDesc!.toJson())),
        ),
      if (output$ConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ConversationID'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: output$ConversationID!.toJson())),
        ),
      if (output$ResponseCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseCode'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: output$ResponseCode!.toJson())),
        ),
      if (output$ResponseDesc != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseDesc'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: output$ResponseDesc!.toJson())),
        ),
      if (output$ThirdPartyConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ThirdPartyConversationID'),
          value: ast.EnumValueNode(
              name: ast.NameNode(
                  value: output$ThirdPartyConversationID!.toJson())),
        ),
      if (output$TransactionID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_TransactionID'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: output$TransactionID!.toJson())),
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

  MpesaPaymentOrderByInput(
      {this.id,
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
      this.status,
      this.recordStatus,
      this.metadata,
      this.createdAt,
      this.updatedAt});

  static MpesaPaymentOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return MpesaPaymentOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      input$Amount: json['input_Amount'] != null
          ? SortOrderExt.fromJson(json['input_Amount'])
          : null,
      input$Country: json['input_Country'] != null
          ? SortOrderExt.fromJson(json['input_Country'])
          : null,
      input$Currency: json['input_Currency'] != null
          ? SortOrderExt.fromJson(json['input_Currency'])
          : null,
      input$CustomerMSISDN: json['input_CustomerMSISDN'] != null
          ? SortOrderExt.fromJson(json['input_CustomerMSISDN'])
          : null,
      input$ServiceProviderCode: json['input_ServiceProviderCode'] != null
          ? SortOrderExt.fromJson(json['input_ServiceProviderCode'])
          : null,
      input$ThirdPartyConversationID:
          json['input_ThirdPartyConversationID'] != null
              ? SortOrderExt.fromJson(json['input_ThirdPartyConversationID'])
              : null,
      input$TransactionReference: json['input_TransactionReference'] != null
          ? SortOrderExt.fromJson(json['input_TransactionReference'])
          : null,
      input$PurchasedItemsDesc: json['input_PurchasedItemsDesc'] != null
          ? SortOrderExt.fromJson(json['input_PurchasedItemsDesc'])
          : null,
      output$ConversationID: json['output_ConversationID'] != null
          ? SortOrderExt.fromJson(json['output_ConversationID'])
          : null,
      output$ResponseCode: json['output_ResponseCode'] != null
          ? SortOrderExt.fromJson(json['output_ResponseCode'])
          : null,
      output$ResponseDesc: json['output_ResponseDesc'] != null
          ? SortOrderExt.fromJson(json['output_ResponseDesc'])
          : null,
      output$ThirdPartyConversationID:
          json['output_ThirdPartyConversationID'] != null
              ? SortOrderExt.fromJson(json['output_ThirdPartyConversationID'])
              : null,
      output$TransactionID: json['output_TransactionID'] != null
          ? SortOrderExt.fromJson(json['output_TransactionID'])
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
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  MpesaPaymentOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? input$Amount,
      SortOrder? input$Country,
      SortOrder? input$Currency,
      SortOrder? input$CustomerMSISDN,
      SortOrder? input$ServiceProviderCode,
      SortOrder? input$ThirdPartyConversationID,
      SortOrder? input$TransactionReference,
      SortOrder? input$PurchasedItemsDesc,
      SortOrder? output$ConversationID,
      SortOrder? output$ResponseCode,
      SortOrder? output$ResponseDesc,
      SortOrder? output$ThirdPartyConversationID,
      SortOrder? output$TransactionID,
      SortOrder? status,
      SortOrder? recordStatus,
      SortOrder? metadata,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return MpesaPaymentOrderByInput(
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
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
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
        status,
        recordStatus,
        metadata,
        createdAt,
        updatedAt
      ];
}
