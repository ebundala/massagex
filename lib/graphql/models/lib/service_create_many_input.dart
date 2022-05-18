import 'scalars/json_object.dart';
import 'record_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceCreateManyInput extends Equatable {
  final String? id;
  final String name;
  final String? description;
  final double price;
  final JSONObject? metadata;
  final String? currency;
  final RecordStatus? recordStatus;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageId;
  final String businessId;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'name'),
        value: ast.StringValueNode(value: '${name}', isBlock: false),
      ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.StringValueNode(value: '${description!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'price'),
        value: ast.FloatValueNode(value: '${price}'),
      ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'currency'),
          value: ast.StringValueNode(value: '${currency!}', isBlock: false),
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
          value: ast.StringValueNode(value: '${categoryId!}', isBlock: false),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        ),
      if (imageId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'imageId'),
          value: ast.StringValueNode(value: '${imageId!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'businessId'),
        value: ast.StringValueNode(value: '${businessId}', isBlock: false),
      )
    ]);
  }

  ServiceCreateManyInput(
      {this.id,
      required this.name,
      this.description,
      required this.price,
      this.metadata,
      this.currency,
      this.recordStatus,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      required this.businessId});

  static ServiceCreateManyInput fromJson(Map<dynamic, dynamic> json) {
    return ServiceCreateManyInput(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      currency: json['currency'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      categoryId: json['categoryId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      imageId: json['imageId'],
      businessId: json['businessId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    if (description != null) _data['description'] = description;

    _data['price'] = price;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (currency != null) _data['currency'] = currency;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (categoryId != null) _data['categoryId'] = categoryId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (imageId != null) _data['imageId'] = imageId;

    _data['businessId'] = businessId;
    return _data;
  }

  ServiceCreateManyInput copyWith(
      {String? id,
      String? name,
      String? description,
      double? price,
      JSONObject? metadata,
      String? currency,
      RecordStatus? recordStatus,
      String? categoryId,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? imageId,
      String? businessId}) {
    return ServiceCreateManyInput(
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
