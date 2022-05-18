import 'record_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentCreateManyAuthorInput extends Equatable {
  final String? id;
  final String reviewId;
  final bool? commentsEnabled;
  final String content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? commentId;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'reviewId'),
        value: ast.StringValueNode(value: '${reviewId}', isBlock: false),
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
        )
    ]);
  }

  CommentCreateManyAuthorInput(
      {this.id,
      required this.reviewId,
      this.commentsEnabled,
      required this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.commentId});

  static CommentCreateManyAuthorInput fromJson(Map<dynamic, dynamic> json) {
    return CommentCreateManyAuthorInput(
      id: json['id'],
      reviewId: json['reviewId'],
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
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['reviewId'] = reviewId;
    if (commentsEnabled != null) _data['commentsEnabled'] = commentsEnabled;

    _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (commentId != null) _data['commentId'] = commentId;
    return _data;
  }

  CommentCreateManyAuthorInput copyWith(
      {String? id,
      String? reviewId,
      bool? commentsEnabled,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? commentId}) {
    return CommentCreateManyAuthorInput(
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
