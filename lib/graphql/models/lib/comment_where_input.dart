import 'string_filter.dart';
import 'user_relation_filter.dart';
import 'review_relation_filter.dart';
import 'attachment_list_relation_filter.dart';
import 'comment_list_relation_filter.dart';
import 'bool_filter.dart';
import 'enum_record_status_filter.dart';
import 'date_time_filter.dart';
import 'comment_relation_filter.dart';
import 'string_nullable_filter.dart';
import 'abuse_report_list_relation_filter.dart';
import 'favorite_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentWhereInput extends Equatable {
  final List<CommentWhereInput>? AND;
  final List<CommentWhereInput>? OR;
  final List<CommentWhereInput>? NOT;
  final StringFilter? id;
  final UserRelationFilter? author;
  final StringFilter? authorId;
  final ReviewRelationFilter? review;
  final StringFilter? reviewId;
  final AttachmentListRelationFilter? attachments;
  final CommentListRelationFilter? comments;
  final BoolFilter? commentsEnabled;
  final StringFilter? content;
  final EnumRecordStatusFilter? recordStatus;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final CommentRelationFilter? comment;
  final StringNullableFilter? commentId;
  final AbuseReportListRelationFilter? abuseReports;
  final FavoriteListRelationFilter? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (AND != null) {
      int i = -1;
      AND!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_AND_$i', variables: variables);
      });
    }
    if (OR != null) {
      int i = -1;
      OR!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_OR_$i', variables: variables);
      });
    }
    if (NOT != null) {
      int i = -1;
      NOT!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_NOT_$i', variables: variables);
      });
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (author != null) {
      author!.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
    }

    if (review != null) {
      review!.getFilesVariables(
          field_name: '${field_name}_review', variables: variables);
    }

    if (reviewId != null) {
      reviewId!.getFilesVariables(
          field_name: '${field_name}_reviewId', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
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

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
    }

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
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
      if (AND != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'AND'),
            value: ast.ListValueNode(values: [
              ...AND!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_AND_$i')
                  ];
                },
              )
            ])),
      if (OR != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'OR'),
            value: ast.ListValueNode(values: [
              ...OR!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_OR_$i')
                  ];
                },
              )
            ])),
      if (NOT != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'NOT'),
            value: ast.ListValueNode(values: [
              ...NOT!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_NOT_$i')
                  ];
                },
              )
            ])),
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (author != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'author'),
          value: author!.toValueNode(field_name: '${field_name}_author'),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
        ),
      if (review != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'review'),
          value: review!.toValueNode(field_name: '${field_name}_review'),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: reviewId!.toValueNode(field_name: '${field_name}_reviewId'),
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
      if (comment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comment'),
          value: comment!.toValueNode(field_name: '${field_name}_comment'),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
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

  CommentWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.author,
      this.authorId,
      this.review,
      this.reviewId,
      this.attachments,
      this.comments,
      this.commentsEnabled,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.comment,
      this.commentId,
      this.abuseReports,
      this.favorites});

  static CommentWhereInput fromJson(Map<dynamic, dynamic> json) {
    return CommentWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => CommentWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => CommentWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => CommentWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      author: json['author'] != null
          ? UserRelationFilter.fromJson(json['author'])
          : null,
      authorId: json['authorId'] != null
          ? StringFilter.fromJson(json['authorId'])
          : null,
      review: json['review'] != null
          ? ReviewRelationFilter.fromJson(json['review'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringFilter.fromJson(json['reviewId'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentListRelationFilter.fromJson(json['attachments'])
          : null,
      comments: json['comments'] != null
          ? CommentListRelationFilter.fromJson(json['comments'])
          : null,
      commentsEnabled: json['commentsEnabled'] != null
          ? BoolFilter.fromJson(json['commentsEnabled'])
          : null,
      content: json['content'] != null
          ? StringFilter.fromJson(json['content'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      comment: json['comment'] != null
          ? CommentRelationFilter.fromJson(json['comment'])
          : null,
      commentId: json['commentId'] != null
          ? StringNullableFilter.fromJson(json['commentId'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportListRelationFilter.fromJson(json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteListRelationFilter.fromJson(json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (AND != null)
      _data['AND'] =
          List.generate(AND?.length ?? 0, (index) => AND![index].toJson());
    if (OR != null)
      _data['OR'] =
          List.generate(OR?.length ?? 0, (index) => OR![index].toJson());
    if (NOT != null)
      _data['NOT'] =
          List.generate(NOT?.length ?? 0, (index) => NOT![index].toJson());
    if (id != null) _data['id'] = id!.toJson();
    if (author != null) _data['author'] = author!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (commentsEnabled != null)
      _data['commentsEnabled'] = commentsEnabled!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  CommentWhereInput copyWith(
      {List<CommentWhereInput>? AND,
      List<CommentWhereInput>? OR,
      List<CommentWhereInput>? NOT,
      StringFilter? id,
      UserRelationFilter? author,
      StringFilter? authorId,
      ReviewRelationFilter? review,
      StringFilter? reviewId,
      AttachmentListRelationFilter? attachments,
      CommentListRelationFilter? comments,
      BoolFilter? commentsEnabled,
      StringFilter? content,
      EnumRecordStatusFilter? recordStatus,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      CommentRelationFilter? comment,
      StringNullableFilter? commentId,
      AbuseReportListRelationFilter? abuseReports,
      FavoriteListRelationFilter? favorites}) {
    return CommentWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        review: review ?? this.review,
        reviewId: reviewId ?? this.reviewId,
        attachments: attachments ?? this.attachments,
        comments: comments ?? this.comments,
        commentsEnabled: commentsEnabled ?? this.commentsEnabled,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        comment: comment ?? this.comment,
        commentId: commentId ?? this.commentId,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        author,
        authorId,
        review,
        reviewId,
        attachments,
        comments,
        commentsEnabled,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        comment,
        commentId,
        abuseReports,
        favorites
      ];
}
