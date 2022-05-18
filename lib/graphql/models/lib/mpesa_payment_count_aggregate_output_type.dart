import "package:equatable/equatable.dart";

class MpesaPaymentCountAggregateOutputType extends Equatable {
  final int? id;
  final int? input$Amount;
  final int? input$Country;
  final int? input$Currency;
  final int? input$CustomerMSISDN;
  final int? input$ServiceProviderCode;
  final int? input$ThirdPartyConversationID;
  final int? input$TransactionReference;
  final int? input$PurchasedItemsDesc;
  final int? output$ConversationID;
  final int? output$ResponseCode;
  final int? output$ResponseDesc;
  final int? output$ThirdPartyConversationID;
  final int? output$TransactionID;
  final int? status;
  final int? recordStatus;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  MpesaPaymentCountAggregateOutputType(
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
      this.updatedAt,
      this.$all});

  static MpesaPaymentCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return MpesaPaymentCountAggregateOutputType(
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
      status: json['status'],
      recordStatus: json['recordStatus'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (input$Amount != null) _data['input_Amount'] = input$Amount;
    if (input$Country != null) _data['input_Country'] = input$Country;
    if (input$Currency != null) _data['input_Currency'] = input$Currency;
    if (input$CustomerMSISDN != null)
      _data['input_CustomerMSISDN'] = input$CustomerMSISDN;
    if (input$ServiceProviderCode != null)
      _data['input_ServiceProviderCode'] = input$ServiceProviderCode;
    if (input$ThirdPartyConversationID != null)
      _data['input_ThirdPartyConversationID'] = input$ThirdPartyConversationID;
    if (input$TransactionReference != null)
      _data['input_TransactionReference'] = input$TransactionReference;
    if (input$PurchasedItemsDesc != null)
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
    if (status != null) _data['status'] = status;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  MpesaPaymentCountAggregateOutputType copyWith(
      {int? id,
      int? input$Amount,
      int? input$Country,
      int? input$Currency,
      int? input$CustomerMSISDN,
      int? input$ServiceProviderCode,
      int? input$ThirdPartyConversationID,
      int? input$TransactionReference,
      int? input$PurchasedItemsDesc,
      int? output$ConversationID,
      int? output$ResponseCode,
      int? output$ResponseDesc,
      int? output$ThirdPartyConversationID,
      int? output$TransactionID,
      int? status,
      int? recordStatus,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return MpesaPaymentCountAggregateOutputType(
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
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
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
        updatedAt,
        $all
      ];
}
