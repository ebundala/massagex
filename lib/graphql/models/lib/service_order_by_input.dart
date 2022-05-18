import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? name;
  final SortOrder? description;
  final SortOrder? price;
  final SortOrder? metadata;
  final SortOrder? currency;
  final SortOrder? recordStatus;
  final SortOrder? categoryId;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? imageId;
  final SortOrder? businessId;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }

    return variables;
  }

  List<ast.VariableDefinitionNode> getVariableDefinitionsNodes({
    required Map<String, dynamic> variables,
  }) {
    final List<ast.VariableDefinitionNode> vars = [];
    variables.forEach((key, value) {
      vars.add(ast.VariableDefinitionNode(
        variable: ast.VariableNode(name: ast.NameNode(value: key)),
        type: ast.NamedTypeNode(
            name: ast.NameNode(value: 'Upload'), isNonNull: true),
        defaultValue: ast.DefaultValueNode(value: null),
        directives: [],
      ));
    });
    return vars;
  }

  ast.ObjectValueNode toValueNode({required String field_name}) {
    return ast.ObjectValueNode(fields: [
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.EnumValueNode(name: ast.NameNode(value: name!.toJson())),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: description!.toJson())),
        ),
      if (price != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'price'),
          value: ast.EnumValueNode(name: ast.NameNode(value: price!.toJson())),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: metadata!.toJson())),
        ),
      if (currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'currency'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: currency!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (categoryId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categoryId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: categoryId!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        ),
      if (imageId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'imageId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: imageId!.toJson())),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: businessId!.toJson())),
        )
    ]);
  }

  ServiceOrderByInput(
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
      this.businessId});

  static ServiceOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return ServiceOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      name: json['name'] != null ? SortOrderExt.fromJson(json['name']) : null,
      description: json['description'] != null
          ? SortOrderExt.fromJson(json['description'])
          : null,
      price:
          json['price'] != null ? SortOrderExt.fromJson(json['price']) : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      currency: json['currency'] != null
          ? SortOrderExt.fromJson(json['currency'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      categoryId: json['categoryId'] != null
          ? SortOrderExt.fromJson(json['categoryId'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      imageId: json['imageId'] != null
          ? SortOrderExt.fromJson(json['imageId'])
          : null,
      businessId: json['businessId'] != null
          ? SortOrderExt.fromJson(json['businessId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (price != null) _data['price'] = price!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (currency != null) _data['currency'] = currency!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (categoryId != null) _data['categoryId'] = categoryId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (imageId != null) _data['imageId'] = imageId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    return _data;
  }

  ServiceOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? name,
      SortOrder? description,
      SortOrder? price,
      SortOrder? metadata,
      SortOrder? currency,
      SortOrder? recordStatus,
      SortOrder? categoryId,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? imageId,
      SortOrder? businessId}) {
    return ServiceOrderByInput(
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
        businessId: businessId ?? this.businessId);
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
        businessId
      ];
}
