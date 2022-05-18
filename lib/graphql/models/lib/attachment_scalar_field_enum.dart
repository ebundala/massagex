enum AttachmentScalarFieldEnum {
  id,
  path,
  filename,
  mimetype,
  encoding,
  recordStatus,
  duration,
  size,
  attachmentType,
  downloadable,
  placement,
  createdAt,
  updatedAt,
  commentId,
  helpStepId,
  reviewId,
  userId,
  businessId
}

extension AttachmentScalarFieldEnumExt on AttachmentScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AttachmentScalarFieldEnum.id:
        return "id";
      case AttachmentScalarFieldEnum.path:
        return "path";
      case AttachmentScalarFieldEnum.filename:
        return "filename";
      case AttachmentScalarFieldEnum.mimetype:
        return "mimetype";
      case AttachmentScalarFieldEnum.encoding:
        return "encoding";
      case AttachmentScalarFieldEnum.recordStatus:
        return "recordStatus";
      case AttachmentScalarFieldEnum.duration:
        return "duration";
      case AttachmentScalarFieldEnum.size:
        return "size";
      case AttachmentScalarFieldEnum.attachmentType:
        return "attachmentType";
      case AttachmentScalarFieldEnum.downloadable:
        return "downloadable";
      case AttachmentScalarFieldEnum.placement:
        return "placement";
      case AttachmentScalarFieldEnum.createdAt:
        return "createdAt";
      case AttachmentScalarFieldEnum.updatedAt:
        return "updatedAt";
      case AttachmentScalarFieldEnum.commentId:
        return "commentId";
      case AttachmentScalarFieldEnum.helpStepId:
        return "helpStepId";
      case AttachmentScalarFieldEnum.reviewId:
        return "reviewId";
      case AttachmentScalarFieldEnum.userId:
        return "userId";
      case AttachmentScalarFieldEnum.businessId:
        return "businessId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AttachmentScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return AttachmentScalarFieldEnum.id;
      case "path":
        return AttachmentScalarFieldEnum.path;
      case "filename":
        return AttachmentScalarFieldEnum.filename;
      case "mimetype":
        return AttachmentScalarFieldEnum.mimetype;
      case "encoding":
        return AttachmentScalarFieldEnum.encoding;
      case "recordStatus":
        return AttachmentScalarFieldEnum.recordStatus;
      case "duration":
        return AttachmentScalarFieldEnum.duration;
      case "size":
        return AttachmentScalarFieldEnum.size;
      case "attachmentType":
        return AttachmentScalarFieldEnum.attachmentType;
      case "downloadable":
        return AttachmentScalarFieldEnum.downloadable;
      case "placement":
        return AttachmentScalarFieldEnum.placement;
      case "createdAt":
        return AttachmentScalarFieldEnum.createdAt;
      case "updatedAt":
        return AttachmentScalarFieldEnum.updatedAt;
      case "commentId":
        return AttachmentScalarFieldEnum.commentId;
      case "helpStepId":
        return AttachmentScalarFieldEnum.helpStepId;
      case "reviewId":
        return AttachmentScalarFieldEnum.reviewId;
      case "userId":
        return AttachmentScalarFieldEnum.userId;
      case "businessId":
        return AttachmentScalarFieldEnum.businessId;
      default:
        return AttachmentScalarFieldEnum.id;
    }
    //return AttachmentScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
