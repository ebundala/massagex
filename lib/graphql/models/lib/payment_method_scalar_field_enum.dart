enum PaymentMethodScalarFieldEnum {
  id,
  name,
  description,
  attachmentId,
  code,
  recordStatus,
  status,
  metadata,
  createdAt,
  updatedAt
}

extension PaymentMethodScalarFieldEnumExt on PaymentMethodScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case PaymentMethodScalarFieldEnum.id:
        return "id";
      case PaymentMethodScalarFieldEnum.name:
        return "name";
      case PaymentMethodScalarFieldEnum.description:
        return "description";
      case PaymentMethodScalarFieldEnum.attachmentId:
        return "attachmentId";
      case PaymentMethodScalarFieldEnum.code:
        return "code";
      case PaymentMethodScalarFieldEnum.recordStatus:
        return "recordStatus";
      case PaymentMethodScalarFieldEnum.status:
        return "status";
      case PaymentMethodScalarFieldEnum.metadata:
        return "metadata";
      case PaymentMethodScalarFieldEnum.createdAt:
        return "createdAt";
      case PaymentMethodScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static PaymentMethodScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return PaymentMethodScalarFieldEnum.id;
      case "name":
        return PaymentMethodScalarFieldEnum.name;
      case "description":
        return PaymentMethodScalarFieldEnum.description;
      case "attachmentId":
        return PaymentMethodScalarFieldEnum.attachmentId;
      case "code":
        return PaymentMethodScalarFieldEnum.code;
      case "recordStatus":
        return PaymentMethodScalarFieldEnum.recordStatus;
      case "status":
        return PaymentMethodScalarFieldEnum.status;
      case "metadata":
        return PaymentMethodScalarFieldEnum.metadata;
      case "createdAt":
        return PaymentMethodScalarFieldEnum.createdAt;
      case "updatedAt":
        return PaymentMethodScalarFieldEnum.updatedAt;
      default:
        return PaymentMethodScalarFieldEnum.id;
    }
    //return PaymentMethodScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
