enum TransactionScalarFieldEnum {
  id,
  paymentMethodId,
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
}

extension TransactionScalarFieldEnumExt on TransactionScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TransactionScalarFieldEnum.id:
        return "id";
      case TransactionScalarFieldEnum.paymentMethodId:
        return "paymentMethodId";
      case TransactionScalarFieldEnum.type:
        return "type";
      case TransactionScalarFieldEnum.orderId:
        return "orderId";
      case TransactionScalarFieldEnum.mpesaPaymentId:
        return "mpesaPaymentId";
      case TransactionScalarFieldEnum.selcomPaymentId:
        return "selcomPaymentId";
      case TransactionScalarFieldEnum.selcomDisbursementId:
        return "selcomDisbursementId";
      case TransactionScalarFieldEnum.status:
        return "status";
      case TransactionScalarFieldEnum.recordStatus:
        return "recordStatus";
      case TransactionScalarFieldEnum.metadata:
        return "metadata";
      case TransactionScalarFieldEnum.createdAt:
        return "createdAt";
      case TransactionScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TransactionScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return TransactionScalarFieldEnum.id;
      case "paymentMethodId":
        return TransactionScalarFieldEnum.paymentMethodId;
      case "type":
        return TransactionScalarFieldEnum.type;
      case "orderId":
        return TransactionScalarFieldEnum.orderId;
      case "mpesaPaymentId":
        return TransactionScalarFieldEnum.mpesaPaymentId;
      case "selcomPaymentId":
        return TransactionScalarFieldEnum.selcomPaymentId;
      case "selcomDisbursementId":
        return TransactionScalarFieldEnum.selcomDisbursementId;
      case "status":
        return TransactionScalarFieldEnum.status;
      case "recordStatus":
        return TransactionScalarFieldEnum.recordStatus;
      case "metadata":
        return TransactionScalarFieldEnum.metadata;
      case "createdAt":
        return TransactionScalarFieldEnum.createdAt;
      case "updatedAt":
        return TransactionScalarFieldEnum.updatedAt;
      default:
        return TransactionScalarFieldEnum.id;
    }
    //return TransactionScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
