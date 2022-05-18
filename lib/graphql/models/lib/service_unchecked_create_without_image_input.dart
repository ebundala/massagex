import 'scalars/json_object.dart';
import 'record_status.dart';
import 'order_unchecked_create_nested_many_without_service_input.dart';
import 'abuse_report_unchecked_create_nested_many_without_service_input.dart';
import 'favorite_unchecked_create_nested_many_without_service_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUncheckedCreateWithoutImageInput extends Equatable {
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
  final String businessId;
  final OrderUncheckedCreateNestedManyWithoutServiceInput? orders;
  final AbuseReportUncheckedCreateNestedManyWithoutServiceInput? abuseReports;
  final FavoriteUncheckedCreateNestedManyWithoutServiceInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (orders != null) {
      orders!.getFilesVariables(
          field_name: '${field_name}_orders', variables: variables);
    }

    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
    }

    if (favorites != null) {
      favorites!.getFilesVariables(
          field_name: '${field_name}_favorites', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'businessId'),
        value: ast.StringValueNode(value: '${businessId}', isBlock: false),
      ),
      if (orders != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orders'),
          value: orders!.toValueNode(field_name: '${field_name}_orders'),
        ),
      if (abuseReports != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReports'),
          value: abuseReports!
              .toValueNode(field_name: '${field_name}_abuseReports'),
        ),
      if (favorites != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favorites'),
          value: favorites!.toValueNode(field_name: '${field_name}_favorites'),
        )
    ]);
  }

  ServiceUncheckedCreateWithoutImageInput(
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
      required this.businessId,
      this.orders,
      this.abuseReports,
      this.favorites});

  static ServiceUncheckedCreateWithoutImageInput fromJson(
      Map<dynamic, dynamic> json) {
    return ServiceUncheckedCreateWithoutImageInput(
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
      businessId: json['businessId'],
      orders: json['orders'] != null
          ? OrderUncheckedCreateNestedManyWithoutServiceInput.fromJson(
              json['orders'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutServiceInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedCreateNestedManyWithoutServiceInput.fromJson(
              json['favorites'])
          : null,
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

    _data['businessId'] = businessId;
    if (orders != null) _data['orders'] = orders!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ServiceUncheckedCreateWithoutImageInput copyWith(
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
      String? businessId,
      OrderUncheckedCreateNestedManyWithoutServiceInput? orders,
      AbuseReportUncheckedCreateNestedManyWithoutServiceInput? abuseReports,
      FavoriteUncheckedCreateNestedManyWithoutServiceInput? favorites}) {
    return ServiceUncheckedCreateWithoutImageInput(
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
        businessId: businessId ?? this.businessId,
        orders: orders ?? this.orders,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
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
        businessId,
        orders,
        abuseReports,
        favorites
      ];
}
