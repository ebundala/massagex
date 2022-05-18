enum ServiceScalarFieldEnum {
  id,
  name,
  description,
  price,
  metadata,
  currency,
  recordStatus,
  categoryId,
  createdAt,
  updatedAt,
  imageId,
  businessId
}

extension ServiceScalarFieldEnumExt on ServiceScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case ServiceScalarFieldEnum.id:
        return "id";
      case ServiceScalarFieldEnum.name:
        return "name";
      case ServiceScalarFieldEnum.description:
        return "description";
      case ServiceScalarFieldEnum.price:
        return "price";
      case ServiceScalarFieldEnum.metadata:
        return "metadata";
      case ServiceScalarFieldEnum.currency:
        return "currency";
      case ServiceScalarFieldEnum.recordStatus:
        return "recordStatus";
      case ServiceScalarFieldEnum.categoryId:
        return "categoryId";
      case ServiceScalarFieldEnum.createdAt:
        return "createdAt";
      case ServiceScalarFieldEnum.updatedAt:
        return "updatedAt";
      case ServiceScalarFieldEnum.imageId:
        return "imageId";
      case ServiceScalarFieldEnum.businessId:
        return "businessId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static ServiceScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return ServiceScalarFieldEnum.id;
      case "name":
        return ServiceScalarFieldEnum.name;
      case "description":
        return ServiceScalarFieldEnum.description;
      case "price":
        return ServiceScalarFieldEnum.price;
      case "metadata":
        return ServiceScalarFieldEnum.metadata;
      case "currency":
        return ServiceScalarFieldEnum.currency;
      case "recordStatus":
        return ServiceScalarFieldEnum.recordStatus;
      case "categoryId":
        return ServiceScalarFieldEnum.categoryId;
      case "createdAt":
        return ServiceScalarFieldEnum.createdAt;
      case "updatedAt":
        return ServiceScalarFieldEnum.updatedAt;
      case "imageId":
        return ServiceScalarFieldEnum.imageId;
      case "businessId":
        return ServiceScalarFieldEnum.businessId;
      default:
        return ServiceScalarFieldEnum.id;
    }
    //return ServiceScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
