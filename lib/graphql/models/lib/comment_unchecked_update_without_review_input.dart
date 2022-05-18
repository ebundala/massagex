import 'string_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'attachment_unchecked_update_many_without_comment_input.dart';
import 'comment_unchecked_update_many_without_comment_input.dart';
import 'abuse_report_unchecked_update_many_without_comment_input.dart';
import 'favorite_unchecked_update_many_without_comment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentUncheckedUpdateWithoutReviewInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? authorId;
  final BoolFieldUpdateOperationsInput? commentsEnabled;
  final StringFieldUpdateOperationsInput? content;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? commentId;
  final AttachmentUncheckedUpdateManyWithoutCommentInput? attachments;
  final CommentUncheckedUpdateManyWithoutCommentInput? comments;
  final AbuseReportUncheckedUpdateManyWithoutCommentInput? abuseReports;
  final FavoriteUncheckedUpdateManyWithoutCommentInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
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

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
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
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
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
        ),
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
        ),
      if (comments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comments'),
          value: comments!.toValueNode(field_name: '${field_name}_comments'),
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

  CommentUncheckedUpdateWithoutReviewInput(
      {this.id,
      this.authorId,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.attachments,
      this.comments,
      this.abuseReports,
      this.favorites});

  static CommentUncheckedUpdateWithoutReviewInput fromJson(
      Map<dynamic, dynamic> json) {
    return CommentUncheckedUpdateWithoutReviewInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      authorId: json['authorId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['authorId'])
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
      attachments: json['attachments'] != null
          ? AttachmentUncheckedUpdateManyWithoutCommentInput.fromJson(
              json['attachments'])
          : null,
      comments: json['comments'] != null
          ? CommentUncheckedUpdateManyWithoutCommentInput.fromJson(
              json['comments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedUpdateManyWithoutCommentInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedUpdateManyWithoutCommentInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (commentsEnabled != null)
      _data['commentsEnabled'] = commentsEnabled!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  CommentUncheckedUpdateWithoutReviewInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? authorId,
      BoolFieldUpdateOperationsInput? commentsEnabled,
      StringFieldUpdateOperationsInput? content,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? commentId,
      AttachmentUncheckedUpdateManyWithoutCommentInput? attachments,
      CommentUncheckedUpdateManyWithoutCommentInput? comments,
      AbuseReportUncheckedUpdateManyWithoutCommentInput? abuseReports,
      FavoriteUncheckedUpdateManyWithoutCommentInput? favorites}) {
    return CommentUncheckedUpdateWithoutReviewInput(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId,
        attachments: attachments ?? this.attachments,
        comments: comments ?? this.comments,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        authorId,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        commentId,
        attachments,
        comments,
        abuseReports,
        favorites
      ];
}
