import 'record_status.dart';
import 'comment_unchecked_create_nested_many_without_review_input.dart';
import 'abuse_report_unchecked_create_nested_many_without_review_input.dart';
import 'favorite_unchecked_create_nested_many_without_review_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewUncheckedCreateWithoutAttachmentsInput extends Equatable {
  final String? id;
  final String authorId;
  final String revieweeId;
  final int? value;
  final String? content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CommentUncheckedCreateNestedManyWithoutReviewInput? comments;
  final AbuseReportUncheckedCreateNestedManyWithoutReviewInput? abuseReports;
  final FavoriteUncheckedCreateNestedManyWithoutReviewInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'revieweeId'),
        value: ast.StringValueNode(value: '${revieweeId}', isBlock: false),
      ),
      if (value != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'value'),
          value: ast.IntValueNode(value: '${value!}'),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value: ast.StringValueNode(value: '${content!}', isBlock: false),
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

  ReviewUncheckedCreateWithoutAttachmentsInput(
      {this.id,
      required this.authorId,
      required this.revieweeId,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.comments,
      this.abuseReports,
      this.favorites});

  static ReviewUncheckedCreateWithoutAttachmentsInput fromJson(
      Map<dynamic, dynamic> json) {
    return ReviewUncheckedCreateWithoutAttachmentsInput(
      id: json['id'],
      authorId: json['authorId'],
      revieweeId: json['revieweeId'],
      value: json['value'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      comments: json['comments'] != null
          ? CommentUncheckedCreateNestedManyWithoutReviewInput.fromJson(
              json['comments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutReviewInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedCreateNestedManyWithoutReviewInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['authorId'] = authorId;

    _data['revieweeId'] = revieweeId;
    if (value != null) _data['value'] = value;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ReviewUncheckedCreateWithoutAttachmentsInput copyWith(
      {String? id,
      String? authorId,
      String? revieweeId,
      int? value,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      CommentUncheckedCreateNestedManyWithoutReviewInput? comments,
      AbuseReportUncheckedCreateNestedManyWithoutReviewInput? abuseReports,
      FavoriteUncheckedCreateNestedManyWithoutReviewInput? favorites}) {
    return ReviewUncheckedCreateWithoutAttachmentsInput(
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        comments: comments ?? this.comments,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        authorId,
        revieweeId,
        value,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        comments,
        abuseReports,
        favorites
      ];
}
