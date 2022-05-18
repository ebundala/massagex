enum HelpStepScalarFieldEnum {
  id,
  stepNumber,
  title,
  description,
  recordStatus,
  helpId,
  createdAt,
  updatedAt
}

extension HelpStepScalarFieldEnumExt on HelpStepScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case HelpStepScalarFieldEnum.id:
        return "id";
      case HelpStepScalarFieldEnum.stepNumber:
        return "stepNumber";
      case HelpStepScalarFieldEnum.title:
        return "title";
      case HelpStepScalarFieldEnum.description:
        return "description";
      case HelpStepScalarFieldEnum.recordStatus:
        return "recordStatus";
      case HelpStepScalarFieldEnum.helpId:
        return "helpId";
      case HelpStepScalarFieldEnum.createdAt:
        return "createdAt";
      case HelpStepScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static HelpStepScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return HelpStepScalarFieldEnum.id;
      case "stepNumber":
        return HelpStepScalarFieldEnum.stepNumber;
      case "title":
        return HelpStepScalarFieldEnum.title;
      case "description":
        return HelpStepScalarFieldEnum.description;
      case "recordStatus":
        return HelpStepScalarFieldEnum.recordStatus;
      case "helpId":
        return HelpStepScalarFieldEnum.helpId;
      case "createdAt":
        return HelpStepScalarFieldEnum.createdAt;
      case "updatedAt":
        return HelpStepScalarFieldEnum.updatedAt;
      default:
        return HelpStepScalarFieldEnum.id;
    }
    //return HelpStepScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
