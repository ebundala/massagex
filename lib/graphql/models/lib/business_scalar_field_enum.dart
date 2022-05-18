enum BusinessScalarFieldEnum {
  id,
  ownerId,
  mode,
  coverId,
  about,
  businessName,
  metadata,
  status,
  recordStatus,
  locationId,
  createdAt,
  updatedAt
}

extension BusinessScalarFieldEnumExt on BusinessScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case BusinessScalarFieldEnum.id:
        return "id";
      case BusinessScalarFieldEnum.ownerId:
        return "ownerId";
      case BusinessScalarFieldEnum.mode:
        return "mode";
      case BusinessScalarFieldEnum.coverId:
        return "coverId";
      case BusinessScalarFieldEnum.about:
        return "about";
      case BusinessScalarFieldEnum.businessName:
        return "businessName";
      case BusinessScalarFieldEnum.metadata:
        return "metadata";
      case BusinessScalarFieldEnum.status:
        return "status";
      case BusinessScalarFieldEnum.recordStatus:
        return "recordStatus";
      case BusinessScalarFieldEnum.locationId:
        return "locationId";
      case BusinessScalarFieldEnum.createdAt:
        return "createdAt";
      case BusinessScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static BusinessScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return BusinessScalarFieldEnum.id;
      case "ownerId":
        return BusinessScalarFieldEnum.ownerId;
      case "mode":
        return BusinessScalarFieldEnum.mode;
      case "coverId":
        return BusinessScalarFieldEnum.coverId;
      case "about":
        return BusinessScalarFieldEnum.about;
      case "businessName":
        return BusinessScalarFieldEnum.businessName;
      case "metadata":
        return BusinessScalarFieldEnum.metadata;
      case "status":
        return BusinessScalarFieldEnum.status;
      case "recordStatus":
        return BusinessScalarFieldEnum.recordStatus;
      case "locationId":
        return BusinessScalarFieldEnum.locationId;
      case "createdAt":
        return BusinessScalarFieldEnum.createdAt;
      case "updatedAt":
        return BusinessScalarFieldEnum.updatedAt;
      default:
        return BusinessScalarFieldEnum.id;
    }
    //return BusinessScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
