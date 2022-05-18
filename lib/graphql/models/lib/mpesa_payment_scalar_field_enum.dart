enum MpesaPaymentScalarFieldEnum {
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
}

extension MpesaPaymentScalarFieldEnumExt on MpesaPaymentScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case MpesaPaymentScalarFieldEnum.id:
        return "id";
      case MpesaPaymentScalarFieldEnum.input$Amount:
        return "input_Amount";
      case MpesaPaymentScalarFieldEnum.input$Country:
        return "input_Country";
      case MpesaPaymentScalarFieldEnum.input$Currency:
        return "input_Currency";
      case MpesaPaymentScalarFieldEnum.input$CustomerMSISDN:
        return "input_CustomerMSISDN";
      case MpesaPaymentScalarFieldEnum.input$ServiceProviderCode:
        return "input_ServiceProviderCode";
      case MpesaPaymentScalarFieldEnum.input$ThirdPartyConversationID:
        return "input_ThirdPartyConversationID";
      case MpesaPaymentScalarFieldEnum.input$TransactionReference:
        return "input_TransactionReference";
      case MpesaPaymentScalarFieldEnum.input$PurchasedItemsDesc:
        return "input_PurchasedItemsDesc";
      case MpesaPaymentScalarFieldEnum.output$ConversationID:
        return "output_ConversationID";
      case MpesaPaymentScalarFieldEnum.output$ResponseCode:
        return "output_ResponseCode";
      case MpesaPaymentScalarFieldEnum.output$ResponseDesc:
        return "output_ResponseDesc";
      case MpesaPaymentScalarFieldEnum.output$ThirdPartyConversationID:
        return "output_ThirdPartyConversationID";
      case MpesaPaymentScalarFieldEnum.output$TransactionID:
        return "output_TransactionID";
      case MpesaPaymentScalarFieldEnum.status:
        return "status";
      case MpesaPaymentScalarFieldEnum.recordStatus:
        return "recordStatus";
      case MpesaPaymentScalarFieldEnum.metadata:
        return "metadata";
      case MpesaPaymentScalarFieldEnum.createdAt:
        return "createdAt";
      case MpesaPaymentScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static MpesaPaymentScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return MpesaPaymentScalarFieldEnum.id;
      case "input_Amount":
        return MpesaPaymentScalarFieldEnum.input$Amount;
      case "input_Country":
        return MpesaPaymentScalarFieldEnum.input$Country;
      case "input_Currency":
        return MpesaPaymentScalarFieldEnum.input$Currency;
      case "input_CustomerMSISDN":
        return MpesaPaymentScalarFieldEnum.input$CustomerMSISDN;
      case "input_ServiceProviderCode":
        return MpesaPaymentScalarFieldEnum.input$ServiceProviderCode;
      case "input_ThirdPartyConversationID":
        return MpesaPaymentScalarFieldEnum.input$ThirdPartyConversationID;
      case "input_TransactionReference":
        return MpesaPaymentScalarFieldEnum.input$TransactionReference;
      case "input_PurchasedItemsDesc":
        return MpesaPaymentScalarFieldEnum.input$PurchasedItemsDesc;
      case "output_ConversationID":
        return MpesaPaymentScalarFieldEnum.output$ConversationID;
      case "output_ResponseCode":
        return MpesaPaymentScalarFieldEnum.output$ResponseCode;
      case "output_ResponseDesc":
        return MpesaPaymentScalarFieldEnum.output$ResponseDesc;
      case "output_ThirdPartyConversationID":
        return MpesaPaymentScalarFieldEnum.output$ThirdPartyConversationID;
      case "output_TransactionID":
        return MpesaPaymentScalarFieldEnum.output$TransactionID;
      case "status":
        return MpesaPaymentScalarFieldEnum.status;
      case "recordStatus":
        return MpesaPaymentScalarFieldEnum.recordStatus;
      case "metadata":
        return MpesaPaymentScalarFieldEnum.metadata;
      case "createdAt":
        return MpesaPaymentScalarFieldEnum.createdAt;
      case "updatedAt":
        return MpesaPaymentScalarFieldEnum.updatedAt;
      default:
        return MpesaPaymentScalarFieldEnum.id;
    }
    //return MpesaPaymentScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
