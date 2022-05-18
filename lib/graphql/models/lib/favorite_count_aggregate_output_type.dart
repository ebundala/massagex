import "package:equatable/equatable.dart";

class FavoriteCountAggregateOutputType extends Equatable {
  final int? id;
  final int? favId;
  final int? authorId;
  final int? typeId;
  final int? recordStatus;
  final int? createdAt;
  final int? updatedAt;
  final int? userId;
  final int? reviewId;
  final int? commentId;
  final int? businessId;
  final int? serviceId;
  final int? orderId;
  final int? $all;
  FavoriteCountAggregateOutputType(
      {this.id,
      this.favId,
      this.authorId,
      this.typeId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId,
      this.$all});

  static FavoriteCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return FavoriteCountAggregateOutputType(
      id: json['id'],
      favId: json['favId'],
      authorId: json['authorId'],
      typeId: json['typeId'],
      recordStatus: json['recordStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
      reviewId: json['reviewId'],
      commentId: json['commentId'],
      businessId: json['businessId'],
      serviceId: json['serviceId'],
      orderId: json['orderId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (favId != null) _data['favId'] = favId;
    if (authorId != null) _data['authorId'] = authorId;
    if (typeId != null) _data['typeId'] = typeId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (userId != null) _data['userId'] = userId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentId != null) _data['commentId'] = commentId;
    if (businessId != null) _data['businessId'] = businessId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (orderId != null) _data['orderId'] = orderId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  FavoriteCountAggregateOutputType copyWith(
      {int? id,
      int? favId,
      int? authorId,
      int? typeId,
      int? recordStatus,
      int? createdAt,
      int? updatedAt,
      int? userId,
      int? reviewId,
      int? commentId,
      int? businessId,
      int? serviceId,
      int? orderId,
      int? $all}) {
    return FavoriteCountAggregateOutputType(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        reviewId: reviewId ?? this.reviewId,
        commentId: commentId ?? this.commentId,
        businessId: businessId ?? this.businessId,
        serviceId: serviceId ?? this.serviceId,
        orderId: orderId ?? this.orderId,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
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
        orderId,
        $all
      ];
}
