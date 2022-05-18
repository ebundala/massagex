import "package:equatable/equatable.dart";

class ServiceCountAggregateOutputType extends Equatable {
  final int? id;
  final int? name;
  final int? description;
  final int? price;
  final int? metadata;
  final int? currency;
  final int? recordStatus;
  final int? categoryId;
  final int? createdAt;
  final int? updatedAt;
  final int? imageId;
  final int? businessId;
  final int? $all;
  ServiceCountAggregateOutputType(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.metadata,
      this.currency,
      this.recordStatus,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.businessId,
      this.$all});

  static ServiceCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return ServiceCountAggregateOutputType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      metadata: json['metadata'],
      currency: json['currency'],
      recordStatus: json['recordStatus'],
      categoryId: json['categoryId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      imageId: json['imageId'],
      businessId: json['businessId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    if (description != null) _data['description'] = description;
    if (price != null) _data['price'] = price;
    if (metadata != null) _data['metadata'] = metadata;
    if (currency != null) _data['currency'] = currency;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (categoryId != null) _data['categoryId'] = categoryId;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (imageId != null) _data['imageId'] = imageId;
    if (businessId != null) _data['businessId'] = businessId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  ServiceCountAggregateOutputType copyWith(
      {int? id,
      int? name,
      int? description,
      int? price,
      int? metadata,
      int? currency,
      int? recordStatus,
      int? categoryId,
      int? createdAt,
      int? updatedAt,
      int? imageId,
      int? businessId,
      int? $all}) {
    return ServiceCountAggregateOutputType(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        metadata: metadata ?? this.metadata,
        currency: currency ?? this.currency,
        recordStatus: recordStatus ?? this.recordStatus,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        imageId: imageId ?? this.imageId,
        businessId: businessId ?? this.businessId,
        $all: $all ?? this.$all);
  }

  List<Object?> get props => [
        id,
        name,
        description,
        price,
        metadata,
        currency,
        recordStatus,
        categoryId,
        createdAt,
        updatedAt,
        imageId,
        businessId,
        $all
      ];
}
