enum AbuseReportScalarFieldEnum {
  id,
  number,
  report,
  authorId,
  typeId,
  recordStatus,
  state,
  createdAt,
  updatedAt,
  userId,
  reviewId,
  commentId,
  businessId,
  serviceId,
  orderId
}

extension AbuseReportScalarFieldEnumExt on AbuseReportScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AbuseReportScalarFieldEnum.id:
        return "id";
      case AbuseReportScalarFieldEnum.number:
        return "number";
      case AbuseReportScalarFieldEnum.report:
        return "report";
      case AbuseReportScalarFieldEnum.authorId:
        return "authorId";
      case AbuseReportScalarFieldEnum.typeId:
        return "typeId";
      case AbuseReportScalarFieldEnum.recordStatus:
        return "recordStatus";
      case AbuseReportScalarFieldEnum.state:
        return "state";
      case AbuseReportScalarFieldEnum.createdAt:
        return "createdAt";
      case AbuseReportScalarFieldEnum.updatedAt:
        return "updatedAt";
      case AbuseReportScalarFieldEnum.userId:
        return "userId";
      case AbuseReportScalarFieldEnum.reviewId:
        return "reviewId";
      case AbuseReportScalarFieldEnum.commentId:
        return "commentId";
      case AbuseReportScalarFieldEnum.businessId:
        return "businessId";
      case AbuseReportScalarFieldEnum.serviceId:
        return "serviceId";
      case AbuseReportScalarFieldEnum.orderId:
        return "orderId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AbuseReportScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return AbuseReportScalarFieldEnum.id;
      case "number":
        return AbuseReportScalarFieldEnum.number;
      case "report":
        return AbuseReportScalarFieldEnum.report;
      case "authorId":
        return AbuseReportScalarFieldEnum.authorId;
      case "typeId":
        return AbuseReportScalarFieldEnum.typeId;
      case "recordStatus":
        return AbuseReportScalarFieldEnum.recordStatus;
      case "state":
        return AbuseReportScalarFieldEnum.state;
      case "createdAt":
        return AbuseReportScalarFieldEnum.createdAt;
      case "updatedAt":
        return AbuseReportScalarFieldEnum.updatedAt;
      case "userId":
        return AbuseReportScalarFieldEnum.userId;
      case "reviewId":
        return AbuseReportScalarFieldEnum.reviewId;
      case "commentId":
        return AbuseReportScalarFieldEnum.commentId;
      case "businessId":
        return AbuseReportScalarFieldEnum.businessId;
      case "serviceId":
        return AbuseReportScalarFieldEnum.serviceId;
      case "orderId":
        return AbuseReportScalarFieldEnum.orderId;
      default:
        return AbuseReportScalarFieldEnum.id;
    }
    //return AbuseReportScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
