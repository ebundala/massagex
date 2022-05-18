import 'string_filter.dart';
import 'user_relation_filter.dart';
import 'int_filter.dart';
import 'string_nullable_filter.dart';
import 'attachment_list_relation_filter.dart';
import 'enum_record_status_filter.dart';
import 'comment_list_relation_filter.dart';
import 'date_time_filter.dart';
import 'abuse_report_list_relation_filter.dart';
import 'favorite_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewWhereInput extends Equatable {
  final List<ReviewWhereInput>? AND;
  final List<ReviewWhereInput>? OR;
  final List<ReviewWhereInput>? NOT;
  final StringFilter? id;
  final UserRelationFilter? author;
  final StringFilter? authorId;
  final UserRelationFilter? reviewee;
  final StringFilter? revieweeId;
  final IntFilter? value;
  final StringNullableFilter? content;
  final AttachmentListRelationFilter? attachments;
  final EnumRecordStatusFilter? recordStatus;
  final CommentListRelationFilter? comments;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
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

    if (reviewee != null) {
      reviewee!.getFilesVariables(
          field_name: '${field_name}_reviewee', variables: variables);
    }

    if (revieweeId != null) {
      revieweeId!.getFilesVariables(
          field_name: '${field_name}_revieweeId', variables: variables);
    }

    if (value != null) {
      value!.getFilesVariables(
          field_name: '${field_name}_value', variables: variables);
    }

    if (content != null) {
      content!.getFilesVariables(
          field_name: '${field_name}_content', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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
      if (reviewee != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewee'),
          value: reviewee!.toValueNode(field_name: '${field_name}_reviewee'),
        ),
      if (revieweeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'revieweeId'),
          value:
              revieweeId!.toValueNode(field_name: '${field_name}_revieweeId'),
        ),
      if (value != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'value'),
          value: value!.toValueNode(field_name: '${field_name}_value'),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value: content!.toValueNode(field_name: '${field_name}_content'),
        ),
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (comments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comments'),
          value: comments!.toValueNode(field_name: '${field_name}_comments'),
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

  ReviewWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.author,
      this.authorId,
      this.reviewee,
      this.revieweeId,
      this.value,
      this.content,
      this.attachments,
      this.recordStatus,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.abuseReports,
      this.favorites});

  static ReviewWhereInput fromJson(Map<dynamic, dynamic> json) {
    return ReviewWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => ReviewWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => ReviewWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => ReviewWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      author: json['author'] != null
          ? UserRelationFilter.fromJson(json['author'])
          : null,
      authorId: json['authorId'] != null
          ? StringFilter.fromJson(json['authorId'])
          : null,
      reviewee: json['reviewee'] != null
          ? UserRelationFilter.fromJson(json['reviewee'])
          : null,
      revieweeId: json['revieweeId'] != null
          ? StringFilter.fromJson(json['revieweeId'])
          : null,
      value: json['value'] != null ? IntFilter.fromJson(json['value']) : null,
      content: json['content'] != null
          ? StringNullableFilter.fromJson(json['content'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentListRelationFilter.fromJson(json['attachments'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      comments: json['comments'] != null
          ? CommentListRelationFilter.fromJson(json['comments'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
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
    if (reviewee != null) _data['reviewee'] = reviewee!.toJson();
    if (revieweeId != null) _data['revieweeId'] = revieweeId!.toJson();
    if (value != null) _data['value'] = value!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ReviewWhereInput copyWith(
      {List<ReviewWhereInput>? AND,
      List<ReviewWhereInput>? OR,
      List<ReviewWhereInput>? NOT,
      StringFilter? id,
      UserRelationFilter? author,
      StringFilter? authorId,
      UserRelationFilter? reviewee,
      StringFilter? revieweeId,
      IntFilter? value,
      StringNullableFilter? content,
      AttachmentListRelationFilter? attachments,
      EnumRecordStatusFilter? recordStatus,
      CommentListRelationFilter? comments,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      AbuseReportListRelationFilter? abuseReports,
      FavoriteListRelationFilter? favorites}) {
    return ReviewWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        reviewee: reviewee ?? this.reviewee,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        attachments: attachments ?? this.attachments,
        recordStatus: recordStatus ?? this.recordStatus,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
        reviewee,
        revieweeId,
        value,
        content,
        attachments,
        recordStatus,
        comments,
        createdAt,
        updatedAt,
        abuseReports,
        favorites
      ];
}
