import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'float_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUncheckedUpdateManyWithoutServicesInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? name;
  final NullableStringFieldUpdateOperationsInput? description;
  final FloatFieldUpdateOperationsInput? price;
  final JSONObject? metadata;
  final StringFieldUpdateOperationsInput? currency;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final NullableStringFieldUpdateOperationsInput? categoryId;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? imageId;

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

    if (categoryId != null) {
      categoryId!.getFilesVariables(
          field_name: '${field_name}_categoryId', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (imageId != null) {
      imageId!.getFilesVariables(
          field_name: '${field_name}_imageId', variables: variables);
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
      if (categoryId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categoryId'),
          value:
              categoryId!.toValueNode(field_name: '${field_name}_categoryId'),
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
      if (imageId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'imageId'),
          value: imageId!.toValueNode(field_name: '${field_name}_imageId'),
        )
    ]);
  }

  ServiceUncheckedUpdateManyWithoutServicesInput(
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
      this.imageId});

  static ServiceUncheckedUpdateManyWithoutServicesInput fromJson(
      Map<dynamic, dynamic> json) {
    return ServiceUncheckedUpdateManyWithoutServicesInput(
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
      categoryId: json['categoryId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['categoryId'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      imageId: json['imageId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['imageId'])
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
    return _data;
  }

  ServiceUncheckedUpdateManyWithoutServicesInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? name,
      NullableStringFieldUpdateOperationsInput? description,
      FloatFieldUpdateOperationsInput? price,
      JSONObject? metadata,
      StringFieldUpdateOperationsInput? currency,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      NullableStringFieldUpdateOperationsInput? categoryId,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? imageId}) {
    return ServiceUncheckedUpdateManyWithoutServicesInput(
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
        imageId: imageId ?? this.imageId);
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
        imageId
      ];
}
