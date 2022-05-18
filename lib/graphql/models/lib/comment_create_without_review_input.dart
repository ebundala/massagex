import 'record_status.dart';
import 'user_create_nested_one_without_comments_input.dart';
import 'attachment_create_nested_many_without_comment_input.dart';
import 'comment_create_nested_many_without_comment_input.dart';
import 'comment_create_nested_one_without_comments_input.dart';
import 'abuse_report_create_nested_many_without_comment_input.dart';
import 'favorite_create_nested_many_without_comment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentCreateWithoutReviewInput extends Equatable {
  final String? id;
  final bool? commentsEnabled;
  final String content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedOneWithoutCommentsInput author;
  final AttachmentCreateNestedManyWithoutCommentInput? attachments;
  final CommentCreateNestedManyWithoutCommentInput? comments;
  final CommentCreateNestedOneWithoutCommentsInput? comment;
  final AbuseReportCreateNestedManyWithoutCommentInput? abuseReports;
  final FavoriteCreateNestedManyWithoutCommentInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      author.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
    }

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'author'),
        value: author.toValueNode(field_name: '${field_name}_author'),
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
      if (comment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comment'),
          value: comment!.toValueNode(field_name: '${field_name}_comment'),
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

  CommentCreateWithoutReviewInput(
      {this.id,
      this.commentsEnabled,
      required this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      required this.author,
      this.attachments,
      this.comments,
      this.comment,
      this.abuseReports,
      this.favorites});

  static CommentCreateWithoutReviewInput fromJson(Map<dynamic, dynamic> json) {
    return CommentCreateWithoutReviewInput(
      id: json['id'],
      commentsEnabled: json['commentsEnabled'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      author: UserCreateNestedOneWithoutCommentsInput.fromJson(json['author']),
      attachments: json['attachments'] != null
          ? AttachmentCreateNestedManyWithoutCommentInput.fromJson(
              json['attachments'])
          : null,
      comments: json['comments'] != null
          ? CommentCreateNestedManyWithoutCommentInput.fromJson(
              json['comments'])
          : null,
      comment: json['comment'] != null
          ? CommentCreateNestedOneWithoutCommentsInput.fromJson(json['comment'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportCreateNestedManyWithoutCommentInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteCreateNestedManyWithoutCommentInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (commentsEnabled != null) _data['commentsEnabled'] = commentsEnabled;

    _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['author'] = author.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  CommentCreateWithoutReviewInput copyWith(
      {String? id,
      bool? commentsEnabled,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedOneWithoutCommentsInput? author,
      AttachmentCreateNestedManyWithoutCommentInput? attachments,
      CommentCreateNestedManyWithoutCommentInput? comments,
      CommentCreateNestedOneWithoutCommentsInput? comment,
      AbuseReportCreateNestedManyWithoutCommentInput? abuseReports,
      FavoriteCreateNestedManyWithoutCommentInput? favorites}) {
    return CommentCreateWithoutReviewInput(
        id: id ?? this.id,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        author: author ?? this.author,
        attachments: attachments ?? this.attachments,
        comments: comments ?? this.comments,
        comment: comment ?? this.comment,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        author,
        attachments,
        comments,
        comment,
        abuseReports,
        favorites
      ];
}
