enum ReviewScalarFieldEnum {
  id,
  authorId,
  revieweeId,
  value,
  content,
  recordStatus,
  createdAt,
  updatedAt
}

extension ReviewScalarFieldEnumExt on ReviewScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case ReviewScalarFieldEnum.id:
        return "id";
      case ReviewScalarFieldEnum.authorId:
        return "authorId";
      case ReviewScalarFieldEnum.revieweeId:
        return "revieweeId";
      case ReviewScalarFieldEnum.value:
        return "value";
      case ReviewScalarFieldEnum.content:
        return "content";
      case ReviewScalarFieldEnum.recordStatus:
        return "recordStatus";
      case ReviewScalarFieldEnum.createdAt:
        return "createdAt";
      case ReviewScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static ReviewScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return ReviewScalarFieldEnum.id;
      case "authorId":
        return ReviewScalarFieldEnum.authorId;
      case "revieweeId":
        return ReviewScalarFieldEnum.revieweeId;
      case "value":
        return ReviewScalarFieldEnum.value;
      case "content":
        return ReviewScalarFieldEnum.content;
      case "recordStatus":
        return ReviewScalarFieldEnum.recordStatus;
      case "createdAt":
        return ReviewScalarFieldEnum.createdAt;
      case "updatedAt":
        return ReviewScalarFieldEnum.updatedAt;
      default:
        return ReviewScalarFieldEnum.id;
    }
    //return ReviewScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
