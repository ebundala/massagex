import "package:equatable/equatable.dart";

class HelpCountAggregateOutputType extends Equatable {
  final int? id;
  final int? topic;
  final int? description;
  final int? recordStatus;
  final int? audience;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  HelpCountAggregateOutputType(
      {this.id,
      this.topic,
      this.description,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static HelpCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return HelpCountAggregateOutputType(
      id: json['id'],
      topic: json['topic'],
      description: json['description'],
      recordStatus: json['recordStatus'],
      audience: json['audience'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (topic != null) _data['topic'] = topic;
    if (description != null) _data['description'] = description;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (audience != null) _data['audience'] = audience;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  HelpCountAggregateOutputType copyWith(
      {int? id,
      int? topic,
      int? description,
      int? recordStatus,
      int? audience,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return HelpCountAggregateOutputType(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        audience: audience ?? this.audience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        topic,
        description,
        recordStatus,
        audience,
        createdAt,
        updatedAt,
        $all
      ];
}
