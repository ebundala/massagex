import "package:equatable/equatable.dart";

class ReviewCountAggregateOutputType extends Equatable {
  final int? id;
  final int? authorId;
  final int? revieweeId;
  final int? value;
  final int? content;
  final int? recordStatus;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  ReviewCountAggregateOutputType(
      {this.id,
      this.authorId,
      this.revieweeId,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static ReviewCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ReviewCountAggregateOutputType(
      id: json['id'],
      authorId: json['authorId'],
      revieweeId: json['revieweeId'],
      value: json['value'],
      content: json['content'],
      recordStatus: json['recordStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (authorId != null) _data['authorId'] = authorId;
    if (revieweeId != null) _data['revieweeId'] = revieweeId;
    if (value != null) _data['value'] = value;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  ReviewCountAggregateOutputType copyWith(
      {int? id,
      int? authorId,
      int? revieweeId,
      int? value,
      int? content,
      int? recordStatus,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return ReviewCountAggregateOutputType(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        authorId,
        revieweeId,
        value,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        $all
      ];
}
