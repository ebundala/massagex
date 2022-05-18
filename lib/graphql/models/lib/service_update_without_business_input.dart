import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'float_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'category_update_one_without_services_input.dart';
import 'attachment_update_one_without_services_input.dart';
import 'order_update_many_without_service_input.dart';
import 'abuse_report_update_many_without_service_input.dart';
import 'favorite_update_many_without_service_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUpdateWithoutBusinessInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? name;
  final NullableStringFieldUpdateOperationsInput? description;
  final FloatFieldUpdateOperationsInput? price;
  final JSONObject? metadata;
  final StringFieldUpdateOperationsInput? currency;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final CategoryUpdateOneWithoutServicesInput? category;
  final AttachmentUpdateOneWithoutServicesInput? image;
  final OrderUpdateManyWithoutServiceInput? orders;
  final AbuseReportUpdateManyWithoutServiceInput? abuseReports;
  final FavoriteUpdateManyWithoutServiceInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (name != null) {
      name!.getFilesVariables(
          field_name: '${field_name}_name', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (price != null) {
      price!.getFilesVariables(
          field_name: '${field_name}_price', variables: variables);
    }

    if (currency != null) {
      currency!.getFilesVariables(
          field_name: '${field_name}_currency', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (category != null) {
      category!.getFilesVariables(
          field_name: '${field_name}_category', variables: variables);
    }

    if (image != null) {
      image!.getFilesVariables(
          field_name: '${field_name}_image', variables: variables);
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
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: name!.toValueNode(field_name: '${field_name}_name'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (price != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'price'),
          value: price!.toValueNode(field_name: '${field_name}_price'),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'currency'),
          value: currency!.toValueNode(field_name: '${field_name}_currency'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: createdAt!.toValueNode(field_name: '${field_name}_createdAt'),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: updatedAt!.toValueNode(field_name: '${field_name}_updatedAt'),
        ),
      if (category != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'category'),
          value: category!.toValueNode(field_name: '${field_name}_category'),
        ),
      if (image != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'image'),
          value: image!.toValueNode(field_name: '${field_name}_image'),
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

  ServiceUpdateWithoutBusinessInput(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.metadata,
      this.currency,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.image,
      this.orders,
      this.abuseReports,
      this.favorites});

  static ServiceUpdateWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return ServiceUpdateWithoutBusinessInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      name: json['name'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['name'])
          : null,
      description: json['description'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['description'])
          : null,
      price: json['price'] != null
          ? FloatFieldUpdateOperationsInput.fromJson(json['price'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      currency: json['currency'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['currency'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      category: json['category'] != null
          ? CategoryUpdateOneWithoutServicesInput.fromJson(json['category'])
          : null,
      image: json['image'] != null
          ? AttachmentUpdateOneWithoutServicesInput.fromJson(json['image'])
          : null,
      orders: json['orders'] != null
          ? OrderUpdateManyWithoutServiceInput.fromJson(json['orders'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUpdateManyWithoutServiceInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUpdateManyWithoutServiceInput.fromJson(json['favorites'])
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
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (category != null) _data['category'] = category!.toJson();
    if (image != null) _data['image'] = image!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ServiceUpdateWithoutBusinessInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? name,
      NullableStringFieldUpdateOperationsInput? description,
      FloatFieldUpdateOperationsInput? price,
      JSONObject? metadata,
      StringFieldUpdateOperationsInput? currency,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      CategoryUpdateOneWithoutServicesInput? category,
      AttachmentUpdateOneWithoutServicesInput? image,
      OrderUpdateManyWithoutServiceInput? orders,
      AbuseReportUpdateManyWithoutServiceInput? abuseReports,
      FavoriteUpdateManyWithoutServiceInput? favorites}) {
    return ServiceUpdateWithoutBusinessInput(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        metadata: metadata ?? this.metadata,
        currency: currency ?? this.currency,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
        image: image ?? this.image,
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
        createdAt,
        updatedAt,
        category,
        image,
        orders,
        abuseReports,
        favorites
      ];
}
