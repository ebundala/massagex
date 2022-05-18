import 'string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_update_one_required_without_favorited_input.dart';
import 'favorite_record_type_update_one_required_without_favorites_input.dart';
import 'user_update_one_without_favorites_input.dart';
import 'review_update_one_without_favorites_input.dart';
import 'comment_update_one_without_favorites_input.dart';
import 'service_update_one_without_favorites_input.dart';
import 'order_update_one_without_favorites_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteUpdateWithoutBusinessInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? favId;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final UserUpdateOneRequiredWithoutFavoritedInput? author;
  final FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput? type;
  final UserUpdateOneWithoutFavoritesInput? user;
  final ReviewUpdateOneWithoutFavoritesInput? review;
  final CommentUpdateOneWithoutFavoritesInput? comment;
  final ServiceUpdateOneWithoutFavoritesInput? service;
  final OrderUpdateOneWithoutFavoritesInput? order;

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

    if (author != null) {
      author!.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (user != null) {
      user!.getFilesVariables(
          field_name: '${field_name}_user', variables: variables);
    }

    if (review != null) {
      review!.getFilesVariables(
          field_name: '${field_name}_review', variables: variables);
    }

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
    }

    if (service != null) {
      service!.getFilesVariables(
          field_name: '${field_name}_service', variables: variables);
    }

    if (order != null) {
      order!.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
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
      if (author != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'author'),
          value: author!.toValueNode(field_name: '${field_name}_author'),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
        ),
      if (user != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'user'),
          value: user!.toValueNode(field_name: '${field_name}_user'),
        ),
      if (review != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'review'),
          value: review!.toValueNode(field_name: '${field_name}_review'),
        ),
      if (comment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comment'),
          value: comment!.toValueNode(field_name: '${field_name}_comment'),
        ),
      if (service != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'service'),
          value: service!.toValueNode(field_name: '${field_name}_service'),
        ),
      if (order != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'order'),
          value: order!.toValueNode(field_name: '${field_name}_order'),
        )
    ]);
  }

  FavoriteUpdateWithoutBusinessInput(
      {this.id,
      this.favId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.author,
      this.type,
      this.user,
      this.review,
      this.comment,
      this.service,
      this.order});

  static FavoriteUpdateWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteUpdateWithoutBusinessInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      favId: json['favId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['favId'])
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
      author: json['author'] != null
          ? UserUpdateOneRequiredWithoutFavoritedInput.fromJson(json['author'])
          : null,
      type: json['type'] != null
          ? FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput.fromJson(
              json['type'])
          : null,
      user: json['user'] != null
          ? UserUpdateOneWithoutFavoritesInput.fromJson(json['user'])
          : null,
      review: json['review'] != null
          ? ReviewUpdateOneWithoutFavoritesInput.fromJson(json['review'])
          : null,
      comment: json['comment'] != null
          ? CommentUpdateOneWithoutFavoritesInput.fromJson(json['comment'])
          : null,
      service: json['service'] != null
          ? ServiceUpdateOneWithoutFavoritesInput.fromJson(json['service'])
          : null,
      order: json['order'] != null
          ? OrderUpdateOneWithoutFavoritesInput.fromJson(json['order'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (favId != null) _data['favId'] = favId!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (author != null) _data['author'] = author!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    return _data;
  }

  FavoriteUpdateWithoutBusinessInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? favId,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      UserUpdateOneRequiredWithoutFavoritedInput? author,
      FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput? type,
      UserUpdateOneWithoutFavoritesInput? user,
      ReviewUpdateOneWithoutFavoritesInput? review,
      CommentUpdateOneWithoutFavoritesInput? comment,
      ServiceUpdateOneWithoutFavoritesInput? service,
      OrderUpdateOneWithoutFavoritesInput? order}) {
    return FavoriteUpdateWithoutBusinessInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        author: author ?? this.author,
        type: type ?? this.type,
        user: user ?? this.user,
        review: review ?? this.review,
        comment: comment ?? this.comment,
        service: service ?? this.service,
        order: order ?? this.order);
  }

  List<Object?> get props => [
        id,
        favId,
        recordStatus,
        createdAt,
        updatedAt,
        author,
        type,
        user,
        review,
        comment,
        service,
        order
      ];
}
