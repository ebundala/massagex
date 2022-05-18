enum CommentScalarFieldEnum {
  id,
  authorId,
  reviewId,
  commentsEnabled,
  content,
  recordStatus,
  createdAt,
  updatedAt,
  commentId
}

extension CommentScalarFieldEnumExt on CommentScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case CommentScalarFieldEnum.id:
        return "id";
      case CommentScalarFieldEnum.authorId:
        return "authorId";
      case CommentScalarFieldEnum.reviewId:
        return "reviewId";
      case CommentScalarFieldEnum.commentsEnabled:
        return "commentsEnabled";
      case CommentScalarFieldEnum.content:
        return "content";
      case CommentScalarFieldEnum.recordStatus:
        return "recordStatus";
      case CommentScalarFieldEnum.createdAt:
        return "createdAt";
      case CommentScalarFieldEnum.updatedAt:
        return "updatedAt";
      case CommentScalarFieldEnum.commentId:
        return "commentId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static CommentScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return CommentScalarFieldEnum.id;
      case "authorId":
        return CommentScalarFieldEnum.authorId;
      case "reviewId":
        return CommentScalarFieldEnum.reviewId;
      case "commentsEnabled":
        return CommentScalarFieldEnum.commentsEnabled;
      case "content":
        return CommentScalarFieldEnum.content;
      case "recordStatus":
        return CommentScalarFieldEnum.recordStatus;
      case "createdAt":
        return CommentScalarFieldEnum.createdAt;
      case "updatedAt":
        return CommentScalarFieldEnum.updatedAt;
      case "commentId":
        return CommentScalarFieldEnum.commentId;
      default:
        return CommentScalarFieldEnum.id;
    }
    //return CommentScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
