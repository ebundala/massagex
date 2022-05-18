enum CategoryScalarFieldEnum {
  id,
  name,
  description,
  pictureId,
  metadata,
  createdAt,
  updatedAt
}

extension CategoryScalarFieldEnumExt on CategoryScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case CategoryScalarFieldEnum.id:
        return "id";
      case CategoryScalarFieldEnum.name:
        return "name";
      case CategoryScalarFieldEnum.description:
        return "description";
      case CategoryScalarFieldEnum.pictureId:
        return "pictureId";
      case CategoryScalarFieldEnum.metadata:
        return "metadata";
      case CategoryScalarFieldEnum.createdAt:
        return "createdAt";
      case CategoryScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static CategoryScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return CategoryScalarFieldEnum.id;
      case "name":
        return CategoryScalarFieldEnum.name;
      case "description":
        return CategoryScalarFieldEnum.description;
      case "pictureId":
        return CategoryScalarFieldEnum.pictureId;
      case "metadata":
        return CategoryScalarFieldEnum.metadata;
      case "createdAt":
        return CategoryScalarFieldEnum.createdAt;
      case "updatedAt":
        return CategoryScalarFieldEnum.updatedAt;
      default:
        return CategoryScalarFieldEnum.id;
    }
    //return CategoryScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
