import 'record_status.dart';
import 'user_create_nested_one_without_reviews_input.dart';
import 'attachment_create_nested_many_without_reviews_input.dart';
import 'comment_create_nested_many_without_review_input.dart';
import 'abuse_report_create_nested_many_without_review_input.dart';
import 'favorite_create_nested_many_without_review_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewCreateWithoutAuthorInput extends Equatable {
  final String? id;
  final int? value;
  final String? content;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedOneWithoutReviewsInput reviewee;
  final AttachmentCreateNestedManyWithoutReviewsInput? attachments;
  final CommentCreateNestedManyWithoutReviewInput? comments;
  final AbuseReportCreateNestedManyWithoutReviewInput? abuseReports;
  final FavoriteCreateNestedManyWithoutReviewInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      reviewee.getFilesVariables(
          field_name: '${field_name}_reviewee', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'reviewee'),
        value: reviewee.toValueNode(field_name: '${field_name}_reviewee'),
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

  ReviewCreateWithoutAuthorInput(
      {this.id,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      required this.reviewee,
      this.attachments,
      this.comments,
      this.abuseReports,
      this.favorites});

  static ReviewCreateWithoutAuthorInput fromJson(Map<dynamic, dynamic> json) {
    return ReviewCreateWithoutAuthorInput(
      id: json['id'],
      value: json['value'],
      content: json['content'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      reviewee:
          UserCreateNestedOneWithoutReviewsInput.fromJson(json['reviewee']),
      attachments: json['attachments'] != null
          ? AttachmentCreateNestedManyWithoutReviewsInput.fromJson(
              json['attachments'])
          : null,
      comments: json['comments'] != null
          ? CommentCreateNestedManyWithoutReviewInput.fromJson(json['comments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportCreateNestedManyWithoutReviewInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteCreateNestedManyWithoutReviewInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (value != null) _data['value'] = value;
    if (content != null) _data['content'] = content;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['reviewee'] = reviewee.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ReviewCreateWithoutAuthorInput copyWith(
      {String? id,
      int? value,
      String? content,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedOneWithoutReviewsInput? reviewee,
      AttachmentCreateNestedManyWithoutReviewsInput? attachments,
      CommentCreateNestedManyWithoutReviewInput? comments,
      AbuseReportCreateNestedManyWithoutReviewInput? abuseReports,
      FavoriteCreateNestedManyWithoutReviewInput? favorites}) {
    return ReviewCreateWithoutAuthorInput(
        id: id ?? this.id,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        reviewee: reviewee ?? this.reviewee,
        attachments: attachments ?? this.attachments,
        comments: comments ?? this.comments,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        value,
        content,
        recordStatus,
        createdAt,
        updatedAt,
        reviewee,
        attachments,
        comments,
        abuseReports,
        favorites
      ];
}
