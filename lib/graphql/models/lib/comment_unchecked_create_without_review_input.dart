import 'record_status.dart';
import 'attachment_unchecked_create_nested_many_without_comment_input.dart';
import 'comment_unchecked_create_nested_many_without_comment_input.dart';
import 'abuse_report_unchecked_create_nested_many_without_comment_input.dart';
import 'favorite_unchecked_create_nested_many_without_comment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentUncheckedCreateWithoutReviewInput extends Equatable {
  final String? id;
  final String authorId;
  final bool? commentsEnabled;
  final String content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? commentId;
  final AttachmentUncheckedCreateNestedManyWithoutCommentInput? attachments;
  final CommentUncheckedCreateNestedManyWithoutCommentInput? comments;
  final AbuseReportUncheckedCreateNestedManyWithoutCommentInput? abuseReports;
  final FavoriteUncheckedCreateNestedManyWithoutCommentInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'authorId'),
        value: ast.StringValueNode(value: '${authorId}', isBlock: false),
      ),
      if (commentsEnabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentsEnabled'),
          value: ast.BooleanValueNode(value: commentsEnabled!),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'content'),
        value: ast.StringValueNode(value: '${content}', isBlock: false),
      ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
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
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: ast.StringValueNode(value: '${commentId!}', isBlock: false),
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

  CommentUncheckedCreateWithoutReviewInput(
      {this.id,
      required this.authorId,
      this.commentsEnabled,
      required this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.attachments,
      this.comments,
      this.abuseReports,
      this.favorites});

  static CommentUncheckedCreateWithoutReviewInput fromJson(
      Map<dynamic, dynamic> json) {
    return CommentUncheckedCreateWithoutReviewInput(
      id: json['id'],
      authorId: json['authorId'],
      commentsEnabled: json['commentsEnabled'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      commentId: json['commentId'],
      attachments: json['attachments'] != null
          ? AttachmentUncheckedCreateNestedManyWithoutCommentInput.fromJson(
              json['attachments'])
          : null,
      comments: json['comments'] != null
          ? CommentUncheckedCreateNestedManyWithoutCommentInput.fromJson(
              json['comments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutCommentInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedCreateNestedManyWithoutCommentInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['authorId'] = authorId;
    if (commentsEnabled != null) _data['commentsEnabled'] = commentsEnabled;

    _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (commentId != null) _data['commentId'] = commentId;
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  CommentUncheckedCreateWithoutReviewInput copyWith(
      {String? id,
      String? authorId,
      bool? commentsEnabled,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? commentId,
      AttachmentUncheckedCreateNestedManyWithoutCommentInput? attachments,
      CommentUncheckedCreateNestedManyWithoutCommentInput? comments,
      AbuseReportUncheckedCreateNestedManyWithoutCommentInput? abuseReports,
      FavoriteUncheckedCreateNestedManyWithoutCommentInput? favorites}) {
    return CommentUncheckedCreateWithoutReviewInput(
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
