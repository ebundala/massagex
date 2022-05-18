import "package:equatable/equatable.dart";

class AbuseReportCountAggregateOutputType extends Equatable {
  final int? id;
  final int? number;
  final int? report;
  final int? authorId;
  final int? typeId;
  final int? recordStatus;
  final int? state;
  final int? createdAt;
  final int? updatedAt;
  final int? userId;
  final int? reviewId;
  final int? commentId;
  final int? businessId;
  final int? serviceId;
  final int? orderId;
  final int? $all;
  AbuseReportCountAggregateOutputType(
      {this.id,
      this.number,
      this.report,
      this.authorId,
      this.typeId,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId,
      this.$all});

  static AbuseReportCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportCountAggregateOutputType(
      id: json['id'],
      number: json['number'],
      report: json['report'],
      authorId: json['authorId'],
      typeId: json['typeId'],
      recordStatus: json['recordStatus'],
      state: json['state'],
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
    if (number != null) _data['number'] = number;
    if (report != null) _data['report'] = report;
    if (authorId != null) _data['authorId'] = authorId;
    if (typeId != null) _data['typeId'] = typeId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (state != null) _data['state'] = state;
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

  AbuseReportCountAggregateOutputType copyWith(
      {int? id,
      int? number,
      int? report,
      int? authorId,
      int? typeId,
      int? recordStatus,
      int? state,
      int? createdAt,
      int? updatedAt,
      int? userId,
      int? reviewId,
      int? commentId,
      int? businessId,
      int? serviceId,
      int? orderId,
      int? $all}) {
    return AbuseReportCountAggregateOutputType(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
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
        orderId,
        $all
      ];
}
