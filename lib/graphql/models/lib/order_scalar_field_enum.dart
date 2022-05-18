enum OrderScalarFieldEnum {
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
  serviceId,
  businessId
}

extension OrderScalarFieldEnumExt on OrderScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case OrderScalarFieldEnum.id:
        return "id";
      case OrderScalarFieldEnum.quantity:
        return "quantity";
      case OrderScalarFieldEnum.recordStatus:
        return "recordStatus";
      case OrderScalarFieldEnum.orderStatus:
        return "orderStatus";
      case OrderScalarFieldEnum.notes:
        return "notes";
      case OrderScalarFieldEnum.metadata:
        return "metadata";
      case OrderScalarFieldEnum.createdAt:
        return "createdAt";
      case OrderScalarFieldEnum.updatedAt:
        return "updatedAt";
      case OrderScalarFieldEnum.ownerId:
        return "ownerId";
      case OrderScalarFieldEnum.receiptId:
        return "receiptId";
      case OrderScalarFieldEnum.serviceId:
        return "serviceId";
      case OrderScalarFieldEnum.businessId:
        return "businessId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static OrderScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return OrderScalarFieldEnum.id;
      case "quantity":
        return OrderScalarFieldEnum.quantity;
      case "recordStatus":
        return OrderScalarFieldEnum.recordStatus;
      case "orderStatus":
        return OrderScalarFieldEnum.orderStatus;
      case "notes":
        return OrderScalarFieldEnum.notes;
      case "metadata":
        return OrderScalarFieldEnum.metadata;
      case "createdAt":
        return OrderScalarFieldEnum.createdAt;
      case "updatedAt":
        return OrderScalarFieldEnum.updatedAt;
      case "ownerId":
        return OrderScalarFieldEnum.ownerId;
      case "receiptId":
        return OrderScalarFieldEnum.receiptId;
      case "serviceId":
        return OrderScalarFieldEnum.serviceId;
      case "businessId":
        return OrderScalarFieldEnum.businessId;
      default:
        return OrderScalarFieldEnum.id;
    }
    //return OrderScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
