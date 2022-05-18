import 'payment_status.dart';
import 'record_status.dart';
import 'scalars/json_object.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class MpesaPaymentCreateWithoutTransactionInput extends Equatable {
  final String? id;
  final String input$Amount;
  final String? input$Country;
  final String? input$Currency;
  final String input$CustomerMSISDN;
  final String input$ServiceProviderCode;
  final String input$ThirdPartyConversationID;
  final String input$TransactionReference;
  final String input$PurchasedItemsDesc;
  final String? output$ConversationID;
  final String? output$ResponseCode;
  final String? output$ResponseDesc;
  final String? output$ThirdPartyConversationID;
  final String? output$TransactionID;
  final PaymentStatus? status;
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
        name: ast.NameNode(value: 'input_Amount'),
        value: ast.StringValueNode(value: '${input$Amount}', isBlock: false),
      ),
      if (input$Country != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Country'),
          value:
              ast.StringValueNode(value: '${input$Country!}', isBlock: false),
        ),
      if (input$Currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'input_Currency'),
          value:
              ast.StringValueNode(value: '${input$Currency!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input_CustomerMSISDN'),
        value: ast.StringValueNode(
            value: '${input$CustomerMSISDN}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input_ServiceProviderCode'),
        value: ast.StringValueNode(
            value: '${input$ServiceProviderCode}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input_ThirdPartyConversationID'),
        value: ast.StringValueNode(
            value: '${input$ThirdPartyConversationID}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input_TransactionReference'),
        value: ast.StringValueNode(
            value: '${input$TransactionReference}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'input_PurchasedItemsDesc'),
        value: ast.StringValueNode(
            value: '${input$PurchasedItemsDesc}', isBlock: false),
      ),
      if (output$ConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ConversationID'),
          value: ast.StringValueNode(
              value: '${output$ConversationID!}', isBlock: false),
        ),
      if (output$ResponseCode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseCode'),
          value: ast.StringValueNode(
              value: '${output$ResponseCode!}', isBlock: false),
        ),
      if (output$ResponseDesc != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ResponseDesc'),
          value: ast.StringValueNode(
              value: '${output$ResponseDesc!}', isBlock: false),
        ),
      if (output$ThirdPartyConversationID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_ThirdPartyConversationID'),
          value: ast.StringValueNode(
              value: '${output$ThirdPartyConversationID!}', isBlock: false),
        ),
      if (output$TransactionID != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'output_TransactionID'),
          value: ast.StringValueNode(
              value: '${output$TransactionID!}', isBlock: false),
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

  MpesaPaymentCreateWithoutTransactionInput(
      {this.id,
      required this.input$Amount,
      this.input$Country,
      this.input$Currency,
      required this.input$CustomerMSISDN,
      required this.input$ServiceProviderCode,
      required this.input$ThirdPartyConversationID,
      required this.input$TransactionReference,
      required this.input$PurchasedItemsDesc,
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

  static MpesaPaymentCreateWithoutTransactionInput fromJson(
      Map<dynamic, dynamic> json) {
    return MpesaPaymentCreateWithoutTransactionInput(
      id: json['id'],
      input$Amount: json['input_Amount'],
      input$Country: json['input_Country'],
      input$Currency: json['input_Currency'],
      input$CustomerMSISDN: json['input_CustomerMSISDN'],
      input$ServiceProviderCode: json['input_ServiceProviderCode'],
      input$ThirdPartyConversationID: json['input_ThirdPartyConversationID'],
      input$TransactionReference: json['input_TransactionReference'],
      input$PurchasedItemsDesc: json['input_PurchasedItemsDesc'],
      output$ConversationID: json['output_ConversationID'],
      output$ResponseCode: json['output_ResponseCode'],
      output$ResponseDesc: json['output_ResponseDesc'],
      output$ThirdPartyConversationID: json['output_ThirdPartyConversationID'],
      output$TransactionID: json['output_TransactionID'],
      status: json['status'] != null
          ? PaymentStatusExt.fromJson(json['status'])
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

    _data['input_Amount'] = input$Amount;
    if (input$Country != null) _data['input_Country'] = input$Country;
    if (input$Currency != null) _data['input_Currency'] = input$Currency;

    _data['input_CustomerMSISDN'] = input$CustomerMSISDN;

    _data['input_ServiceProviderCode'] = input$ServiceProviderCode;

    _data['input_ThirdPartyConversationID'] = input$ThirdPartyConversationID;

    _data['input_TransactionReference'] = input$TransactionReference;

    _data['input_PurchasedItemsDesc'] = input$PurchasedItemsDesc;
    if (output$ConversationID != null)
      _data['output_ConversationID'] = output$ConversationID;
    if (output$ResponseCode != null)
      _data['output_ResponseCode'] = output$ResponseCode;
    if (output$ResponseDesc != null)
      _data['output_ResponseDesc'] = output$ResponseDesc;
    if (output$ThirdPartyConversationID != null)
      _data['output_ThirdPartyConversationID'] =
          output$ThirdPartyConversationID;
    if (output$TransactionID != null)
      _data['output_TransactionID'] = output$TransactionID;
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  MpesaPaymentCreateWithoutTransactionInput copyWith(
      {String? id,
      String? input$Amount,
      String? input$Country,
      String? input$Currency,
      String? input$CustomerMSISDN,
      String? input$ServiceProviderCode,
      String? input$ThirdPartyConversationID,
      String? input$TransactionReference,
      String? input$PurchasedItemsDesc,
      String? output$ConversationID,
      String? output$ResponseCode,
      String? output$ResponseDesc,
      String? output$ThirdPartyConversationID,
      String? output$TransactionID,
      PaymentStatus? status,
      RecordStatus? recordStatus,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return MpesaPaymentCreateWithoutTransactionInput(
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
