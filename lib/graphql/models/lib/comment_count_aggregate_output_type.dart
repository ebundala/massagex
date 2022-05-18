import "package:equatable/equatable.dart";

class CommentCountAggregateOutputType extends Equatable {
  final int? id;
  final int? authorId;
  final int? reviewId;
  final int? commentsEnabled;
  final int? content;
  final int? recordStatus;
  final int? createdAt;
  final int? updatedAt;
  final int? commentId;
  final int? $all;
  CommentCountAggregateOutputType(
      {this.id,
      this.authorId,
      this.reviewId,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.$all});

  static CommentCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CommentCountAggregateOutputType(
      id: json['id'],
      authorId: json['authorId'],
      reviewId: json['reviewId'],
      commentsEnabled: json['commentsEnabled'],
      content: json['content'],
      recordStatus: json['recordStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      commentId: json['commentId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (authorId != null) _data['authorId'] = authorId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentsEnabled != null) _data['commentsEnabled'] = commentsEnabled;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (commentId != null) _data['commentId'] = commentId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  CommentCountAggregateOutputType copyWith(
      {int? id,
      int? authorId,
      int? reviewId,
      int? commentsEnabled,
      int? content,
      int? recordStatus,
      int? createdAt,
      int? updatedAt,
      int? commentId,
      int? $all}) {
    return CommentCountAggregateOutputType(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        reviewId: reviewId ?? this.reviewId,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        authorId,
        reviewId,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        commentId,
        $all
      ];
}
