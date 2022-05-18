import "package:equatable/equatable.dart";

class AttachmentCountAggregateOutputType extends Equatable {
  final int? id;
  final int? path;
  final int? filename;
  final int? mimetype;
  final int? encoding;
  final int? recordStatus;
  final int? duration;
  final int? size;
  final int? attachmentType;
  final int? downloadable;
  final int? placement;
  final int? createdAt;
  final int? updatedAt;
  final int? commentId;
  final int? helpStepId;
  final int? reviewId;
  final int? userId;
  final int? businessId;
  final int? $all;
  AttachmentCountAggregateOutputType(
      {this.id,
      this.path,
      this.filename,
      this.mimetype,
      this.encoding,
      this.recordStatus,
      this.duration,
      this.size,
      this.attachmentType,
      this.downloadable,
      this.placement,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.helpStepId,
      this.reviewId,
      this.userId,
      this.businessId,
      this.$all});

  static AttachmentCountAggregateOutputType fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentCountAggregateOutputType(
      id: json['id'],
      path: json['path'],
      filename: json['filename'],
      mimetype: json['mimetype'],
      encoding: json['encoding'],
      recordStatus: json['recordStatus'],
      duration: json['duration'],
      size: json['size'],
      attachmentType: json['attachmentType'],
      downloadable: json['downloadable'],
      placement: json['placement'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      commentId: json['commentId'],
      helpStepId: json['helpStepId'],
      reviewId: json['reviewId'],
      userId: json['userId'],
      businessId: json['businessId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (path != null) _data['path'] = path;
    if (filename != null) _data['filename'] = filename;
    if (mimetype != null) _data['mimetype'] = mimetype;
    if (encoding != null) _data['encoding'] = encoding;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (duration != null) _data['duration'] = duration;
    if (size != null) _data['size'] = size;
    if (attachmentType != null) _data['attachmentType'] = attachmentType;
    if (downloadable != null) _data['downloadable'] = downloadable;
    if (placement != null) _data['placement'] = placement;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (commentId != null) _data['commentId'] = commentId;
    if (helpStepId != null) _data['helpStepId'] = helpStepId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (userId != null) _data['userId'] = userId;
    if (businessId != null) _data['businessId'] = businessId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  AttachmentCountAggregateOutputType copyWith(
      {int? id,
      int? path,
      int? filename,
      int? mimetype,
      int? encoding,
      int? recordStatus,
      int? duration,
      int? size,
      int? attachmentType,
      int? downloadable,
      int? placement,
      int? createdAt,
      int? updatedAt,
      int? commentId,
      int? helpStepId,
      int? reviewId,
      int? userId,
      int? businessId,
      int? $all}) {
    return AttachmentCountAggregateOutputType(
        id: id ?? this.id,
        path: path ?? this.path,
        filename: filename ?? this.filename,
        mimetype: mimetype ?? this.mimetype,
        encoding: encoding ?? this.encoding,
        recordStatus: recordStatus ?? this.recordStatus,
        duration: duration ?? this.duration,
        size: size ?? this.size,
        attachmentType: attachmentType ?? this.attachmentType,
        downloadable: downloadable ?? this.downloadable,
        placement: placement ?? this.placement,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId,
        helpStepId: helpStepId ?? this.helpStepId,
        reviewId: reviewId ?? this.reviewId,
        userId: userId ?? this.userId,
        businessId: businessId ?? this.businessId,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
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
        businessId,
        $all
      ];
}
