import 'string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteUncheckedUpdateWithoutReviewInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? favId;
  final StringFieldUpdateOperationsInput? authorId;
  final StringFieldUpdateOperationsInput? typeId;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? userId;
  final NullableStringFieldUpdateOperationsInput? commentId;
  final NullableStringFieldUpdateOperationsInput? businessId;
  final NullableStringFieldUpdateOperationsInput? serviceId;
  final NullableStringFieldUpdateOperationsInput? orderId;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (favId != null) {
      favId!.getFilesVariables(
          field_name: '${field_name}_favId', variables: variables);
    }

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
    }

    if (typeId != null) {
      typeId!.getFilesVariables(
          field_name: '${field_name}_typeId', variables: variables);
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

    if (userId != null) {
      userId!.getFilesVariables(
          field_name: '${field_name}_userId', variables: variables);
    }

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
    }

    if (serviceId != null) {
      serviceId!.getFilesVariables(
          field_name: '${field_name}_serviceId', variables: variables);
    }

    if (orderId != null) {
      orderId!.getFilesVariables(
          field_name: '${field_name}_orderId', variables: variables);
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
      if (favId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favId'),
          value: favId!.toValueNode(field_name: '${field_name}_favId'),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
        ),
      if (typeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'typeId'),
          value: typeId!.toValueNode(field_name: '${field_name}_typeId'),
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
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: userId!.toValueNode(field_name: '${field_name}_userId'),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: serviceId!.toValueNode(field_name: '${field_name}_serviceId'),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value: orderId!.toValueNode(field_name: '${field_name}_orderId'),
        )
    ]);
  }

  FavoriteUncheckedUpdateWithoutReviewInput(
      {this.id,
      this.favId,
      this.authorId,
      this.typeId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId});

  static FavoriteUncheckedUpdateWithoutReviewInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteUncheckedUpdateWithoutReviewInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      favId: json['favId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['favId'])
          : null,
      authorId: json['authorId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['authorId'])
          : null,
      typeId: json['typeId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['typeId'])
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
      userId: json['userId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['userId'])
          : null,
      commentId: json['commentId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['commentId'])
          : null,
      businessId: json['businessId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['businessId'])
          : null,
      serviceId: json['serviceId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['serviceId'])
          : null,
      orderId: json['orderId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['orderId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (favId != null) _data['favId'] = favId!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (typeId != null) _data['typeId'] = typeId!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId!.toJson();
    if (orderId != null) _data['orderId'] = orderId!.toJson();
    return _data;
  }

  FavoriteUncheckedUpdateWithoutReviewInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? favId,
      StringFieldUpdateOperationsInput? authorId,
      StringFieldUpdateOperationsInput? typeId,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? userId,
      NullableStringFieldUpdateOperationsInput? commentId,
      NullableStringFieldUpdateOperationsInput? businessId,
      NullableStringFieldUpdateOperationsInput? serviceId,
      NullableStringFieldUpdateOperationsInput? orderId}) {
    return FavoriteUncheckedUpdateWithoutReviewInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        commentId: commentId ?? this.commentId,
        businessId: businessId ?? this.businessId,
        serviceId: serviceId ?? this.serviceId,
        orderId: orderId ?? this.orderId);
  }

  List<Object?> get props => [
        id,
        favId,
        authorId,
        typeId,
        recordStatus,
        createdAt,
        updatedAt,
        userId,
        commentId,
        businessId,
        serviceId,
        orderId
      ];
}