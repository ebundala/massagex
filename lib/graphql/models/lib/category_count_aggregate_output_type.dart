import "package:equatable/equatable.dart";

class CategoryCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? description;
  final int? pictureId;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? $all;
  CategoryCountAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.$all});

  static CategoryCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return CategoryCountAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (pictureId != null) _data['pictureId'] = pictureId;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  CategoryCountAggregateOutputType copyWith(
      {int? id,
      int? name,
      int? description,
      int? pictureId,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? $all}) {
    return CategoryCountAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        pictureId: pictureId ?? this.pictureId,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        $all: $all ?? this.$all);
  }

  List<Object?> get props =>
      [id, name, description, pictureId, metadata, createdAt, updatedAt, $all];
}
