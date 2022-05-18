import 'string_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentUncheckedUpdateManyWithoutCommentsInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? reviewId;
  final BoolFieldUpdateOperationsInput? commentsEnabled;
  final StringFieldUpdateOperationsInput? content;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? commentId;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (reviewId != null) {
      reviewId!.getFilesVariables(
          field_name: '${field_name}_reviewId', variables: variables);
    }

    if (commentsEnabled != null) {
      commentsEnabled!.getFilesVariables(
          field_name: '${field_name}_commentsEnabled', variables: variables);
    }

    if (content != null) {
      content!.getFilesVariables(
          field_name: '${field_name}_content', variables: variables);
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

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
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
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: reviewId!.toValueNode(field_name: '${field_name}_reviewId'),
        ),
      if (commentsEnabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentsEnabled'),
          value: commentsEnabled!
              .toValueNode(field_name: '${field_name}_commentsEnabled'),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value: content!.toValueNode(field_name: '${field_name}_content'),
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
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
        )
    ]);
  }

  CommentUncheckedUpdateManyWithoutCommentsInput(
      {this.id,
      this.reviewId,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId});

  static CommentUncheckedUpdateManyWithoutCommentsInput fromJson(
      Map<dynamic, dynamic> json) {
    return CommentUncheckedUpdateManyWithoutCommentsInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['reviewId'])
          : null,
      commentsEnabled: json['commentsEnabled'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['commentsEnabled'])
          : null,
      content: json['content'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['content'])
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
      commentId: json['commentId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['commentId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId!.toJson();
    if (commentsEnabled != null)
      _data['commentsEnabled'] = commentsEnabled!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    return _data;
  }

  CommentUncheckedUpdateManyWithoutCommentsInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? reviewId,
      BoolFieldUpdateOperationsInput? commentsEnabled,
      StringFieldUpdateOperationsInput? content,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? commentId}) {
    return CommentUncheckedUpdateManyWithoutCommentsInput(
        id: id ?? this.id,
        reviewId: reviewId ?? this.reviewId,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId);
  }

  List<Object?> get props => [
        id,
        reviewId,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        commentId
      ];
}
