enum HelpScalarFieldEnum {
  id,
  topic,
  description,
  recordStatus,
  audience,
  createdAt,
  updatedAt
}

extension HelpScalarFieldEnumExt on HelpScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case HelpScalarFieldEnum.id:
        return "id";
      case HelpScalarFieldEnum.topic:
        return "topic";
      case HelpScalarFieldEnum.description:
        return "description";
      case HelpScalarFieldEnum.recordStatus:
        return "recordStatus";
      case HelpScalarFieldEnum.audience:
        return "audience";
      case HelpScalarFieldEnum.createdAt:
        return "createdAt";
      case HelpScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static HelpScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return HelpScalarFieldEnum.id;
      case "topic":
        return HelpScalarFieldEnum.topic;
      case "description":
        return HelpScalarFieldEnum.description;
      case "recordStatus":
        return HelpScalarFieldEnum.recordStatus;
      case "audience":
        return HelpScalarFieldEnum.audience;
      case "createdAt":
        return HelpScalarFieldEnum.createdAt;
      case "updatedAt":
        return HelpScalarFieldEnum.updatedAt;
      default:
        return HelpScalarFieldEnum.id;
    }
    //return HelpScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
