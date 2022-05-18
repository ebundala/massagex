import 'string_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_update_one_required_without_reviewed_input.dart';
import 'user_update_one_required_without_reviews_input.dart';
import 'attachment_update_many_without_reviews_input.dart';
import 'abuse_report_update_many_without_review_input.dart';
import 'favorite_update_many_without_review_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewUpdateWithoutCommentsInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final IntFieldUpdateOperationsInput? value;
  final NullableStringFieldUpdateOperationsInput? content;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final UserUpdateOneRequiredWithoutReviewedInput? author;
  final UserUpdateOneRequiredWithoutReviewsInput? reviewee;
  final AttachmentUpdateManyWithoutReviewsInput? attachments;
  final AbuseReportUpdateManyWithoutReviewInput? abuseReports;
  final FavoriteUpdateManyWithoutReviewInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (value != null) {
      value!.getFilesVariables(
          field_name: '${field_name}_value', variables: variables);
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

    if (author != null) {
      author!.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    if (reviewee != null) {
      reviewee!.getFilesVariables(
          field_name: '${field_name}_reviewee', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
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
      if (author != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'author'),
          value: author!.toValueNode(field_name: '${field_name}_author'),
        ),
      if (reviewee != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewee'),
          value: reviewee!.toValueNode(field_name: '${field_name}_reviewee'),
        ),
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
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

  ReviewUpdateWithoutCommentsInput(
      {this.id,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.author,
      this.reviewee,
      this.attachments,
      this.abuseReports,
      this.favorites});

  static ReviewUpdateWithoutCommentsInput fromJson(Map<dynamic, dynamic> json) {
    return ReviewUpdateWithoutCommentsInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      value: json['value'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['value'])
          : null,
      content: json['content'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['content'])
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
      author: json['author'] != null
          ? UserUpdateOneRequiredWithoutReviewedInput.fromJson(json['author'])
          : null,
      reviewee: json['reviewee'] != null
          ? UserUpdateOneRequiredWithoutReviewsInput.fromJson(json['reviewee'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentUpdateManyWithoutReviewsInput.fromJson(
              json['attachments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUpdateManyWithoutReviewInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUpdateManyWithoutReviewInput.fromJson(json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (value != null) _data['value'] = value!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (author != null) _data['author'] = author!.toJson();
    if (reviewee != null) _data['reviewee'] = reviewee!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  ReviewUpdateWithoutCommentsInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      IntFieldUpdateOperationsInput? value,
      NullableStringFieldUpdateOperationsInput? content,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      UserUpdateOneRequiredWithoutReviewedInput? author,
      UserUpdateOneRequiredWithoutReviewsInput? reviewee,
      AttachmentUpdateManyWithoutReviewsInput? attachments,
      AbuseReportUpdateManyWithoutReviewInput? abuseReports,
      FavoriteUpdateManyWithoutReviewInput? favorites}) {
    return ReviewUpdateWithoutCommentsInput(
        id: id ?? this.id,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        author: author ?? this.author,
        reviewee: reviewee ?? this.reviewee,
        attachments: attachments ?? this.attachments,
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
        author,
        reviewee,
        attachments,
        abuseReports,
        favorites
      ];
}
