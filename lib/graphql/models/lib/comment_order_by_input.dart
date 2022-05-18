import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? authorId;
  final SortOrder? reviewId;
  final SortOrder? commentsEnabled;
  final SortOrder? content;
  final SortOrder? recordStatus;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? commentId;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: authorId!.toJson())),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: reviewId!.toJson())),
        ),
      if (commentsEnabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentsEnabled'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: commentsEnabled!.toJson())),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: content!.toJson())),
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
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: commentId!.toJson())),
        )
    ]);
  }

  CommentOrderByInput(
      {this.id,
      this.authorId,
      this.reviewId,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId});

  static CommentOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return CommentOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      authorId: json['authorId'] != null
          ? SortOrderExt.fromJson(json['authorId'])
          : null,
      reviewId: json['reviewId'] != null
          ? SortOrderExt.fromJson(json['reviewId'])
          : null,
      commentsEnabled: json['commentsEnabled'] != null
          ? SortOrderExt.fromJson(json['commentsEnabled'])
          : null,
      content: json['content'] != null
          ? SortOrderExt.fromJson(json['content'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      commentId: json['commentId'] != null
          ? SortOrderExt.fromJson(json['commentId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
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

  CommentOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? authorId,
      SortOrder? reviewId,
      SortOrder? commentsEnabled,
      SortOrder? content,
      SortOrder? recordStatus,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? commentId}) {
    return CommentOrderByInput(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
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
        authorId,
        reviewId,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        commentId
      ];
}
