enum FavoriteScalarFieldEnum {
  id,
  favId,
  authorId,
  typeId,
  recordStatus,
  createdAt,
  updatedAt,
  userId,
  reviewId,
  commentId,
  businessId,
  serviceId,
  orderId
}

extension FavoriteScalarFieldEnumExt on FavoriteScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case FavoriteScalarFieldEnum.id:
        return "id";
      case FavoriteScalarFieldEnum.favId:
        return "favId";
      case FavoriteScalarFieldEnum.authorId:
        return "authorId";
      case FavoriteScalarFieldEnum.typeId:
        return "typeId";
      case FavoriteScalarFieldEnum.recordStatus:
        return "recordStatus";
      case FavoriteScalarFieldEnum.createdAt:
        return "createdAt";
      case FavoriteScalarFieldEnum.updatedAt:
        return "updatedAt";
      case FavoriteScalarFieldEnum.userId:
        return "userId";
      case FavoriteScalarFieldEnum.reviewId:
        return "reviewId";
      case FavoriteScalarFieldEnum.commentId:
        return "commentId";
      case FavoriteScalarFieldEnum.businessId:
        return "businessId";
      case FavoriteScalarFieldEnum.serviceId:
        return "serviceId";
      case FavoriteScalarFieldEnum.orderId:
        return "orderId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static FavoriteScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return FavoriteScalarFieldEnum.id;
      case "favId":
        return FavoriteScalarFieldEnum.favId;
      case "authorId":
        return FavoriteScalarFieldEnum.authorId;
      case "typeId":
        return FavoriteScalarFieldEnum.typeId;
      case "recordStatus":
        return FavoriteScalarFieldEnum.recordStatus;
      case "createdAt":
        return FavoriteScalarFieldEnum.createdAt;
      case "updatedAt":
        return FavoriteScalarFieldEnum.updatedAt;
      case "userId":
        return FavoriteScalarFieldEnum.userId;
      case "reviewId":
        return FavoriteScalarFieldEnum.reviewId;
      case "commentId":
        return FavoriteScalarFieldEnum.commentId;
      case "businessId":
        return FavoriteScalarFieldEnum.businessId;
      case "serviceId":
        return FavoriteScalarFieldEnum.serviceId;
      case "orderId":
        return FavoriteScalarFieldEnum.orderId;
      default:
        return FavoriteScalarFieldEnum.id;
    }
    //return FavoriteScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
