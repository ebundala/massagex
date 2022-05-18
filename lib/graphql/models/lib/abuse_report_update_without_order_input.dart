import 'string_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_abuse_report_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_update_one_required_without_abuse_reported_input.dart';
import 'abuse_record_type_update_one_required_without_abuse_reports_input.dart';
import 'user_update_one_without_abuse_reports_input.dart';
import 'review_update_one_without_abuse_reports_input.dart';
import 'comment_update_one_without_abuse_reports_input.dart';
import 'business_update_one_without_abuse_reports_input.dart';
import 'service_update_one_without_abuse_reports_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseReportUpdateWithoutOrderInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final IntFieldUpdateOperationsInput? number;
  final NullableStringFieldUpdateOperationsInput? report;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumAbuseReportStatusFieldUpdateOperationsInput? state;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final UserUpdateOneRequiredWithoutAbuseReportedInput? author;
  final AbuseRecordTypeUpdateOneRequiredWithoutAbuseReportsInput? type;
  final UserUpdateOneWithoutAbuseReportsInput? user;
  final ReviewUpdateOneWithoutAbuseReportsInput? review;
  final CommentUpdateOneWithoutAbuseReportsInput? comment;
  final BusinessUpdateOneWithoutAbuseReportsInput? business;
  final ServiceUpdateOneWithoutAbuseReportsInput? service;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (number != null) {
      number!.getFilesVariables(
          field_name: '${field_name}_number', variables: variables);
    }

    if (report != null) {
      report!.getFilesVariables(
          field_name: '${field_name}_report', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (state != null) {
      state!.getFilesVariables(
          field_name: '${field_name}_state', variables: variables);
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

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (user != null) {
      user!.getFilesVariables(
          field_name: '${field_name}_user', variables: variables);
    }

    if (review != null) {
      review!.getFilesVariables(
          field_name: '${field_name}_review', variables: variables);
    }

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
    }

    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
    }

    if (service != null) {
      service!.getFilesVariables(
          field_name: '${field_name}_service', variables: variables);
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
      if (number != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'number'),
          value: number!.toValueNode(field_name: '${field_name}_number'),
        ),
      if (report != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'report'),
          value: report!.toValueNode(field_name: '${field_name}_report'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: state!.toValueNode(field_name: '${field_name}_state'),
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
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
        ),
      if (user != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'user'),
          value: user!.toValueNode(field_name: '${field_name}_user'),
        ),
      if (review != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'review'),
          value: review!.toValueNode(field_name: '${field_name}_review'),
        ),
      if (comment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comment'),
          value: comment!.toValueNode(field_name: '${field_name}_comment'),
        ),
      if (business != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'business'),
          value: business!.toValueNode(field_name: '${field_name}_business'),
        ),
      if (service != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'service'),
          value: service!.toValueNode(field_name: '${field_name}_service'),
        )
    ]);
  }

  AbuseReportUpdateWithoutOrderInput(
      {this.id,
      this.number,
      this.report,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.author,
      this.type,
      this.user,
      this.review,
      this.comment,
      this.business,
      this.service});

  static AbuseReportUpdateWithoutOrderInput fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportUpdateWithoutOrderInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      number: json['number'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['number'])
          : null,
      report: json['report'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['report'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      state: json['state'] != null
          ? EnumAbuseReportStatusFieldUpdateOperationsInput.fromJson(
              json['state'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      author: json['author'] != null
          ? UserUpdateOneRequiredWithoutAbuseReportedInput.fromJson(
              json['author'])
          : null,
      type: json['type'] != null
          ? AbuseRecordTypeUpdateOneRequiredWithoutAbuseReportsInput.fromJson(
              json['type'])
          : null,
      user: json['user'] != null
          ? UserUpdateOneWithoutAbuseReportsInput.fromJson(json['user'])
          : null,
      review: json['review'] != null
          ? ReviewUpdateOneWithoutAbuseReportsInput.fromJson(json['review'])
          : null,
      comment: json['comment'] != null
          ? CommentUpdateOneWithoutAbuseReportsInput.fromJson(json['comment'])
          : null,
      business: json['business'] != null
          ? BusinessUpdateOneWithoutAbuseReportsInput.fromJson(json['business'])
          : null,
      service: json['service'] != null
          ? ServiceUpdateOneWithoutAbuseReportsInput.fromJson(json['service'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (number != null) _data['number'] = number!.toJson();
    if (report != null) _data['report'] = report!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (author != null) _data['author'] = author!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    return _data;
  }

  AbuseReportUpdateWithoutOrderInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      IntFieldUpdateOperationsInput? number,
      NullableStringFieldUpdateOperationsInput? report,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumAbuseReportStatusFieldUpdateOperationsInput? state,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      UserUpdateOneRequiredWithoutAbuseReportedInput? author,
      AbuseRecordTypeUpdateOneRequiredWithoutAbuseReportsInput? type,
      UserUpdateOneWithoutAbuseReportsInput? user,
      ReviewUpdateOneWithoutAbuseReportsInput? review,
      CommentUpdateOneWithoutAbuseReportsInput? comment,
      BusinessUpdateOneWithoutAbuseReportsInput? business,
      ServiceUpdateOneWithoutAbuseReportsInput? service}) {
    return AbuseReportUpdateWithoutOrderInput(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        author: author ?? this.author,
        type: type ?? this.type,
        user: user ?? this.user,
        review: review ?? this.review,
        comment: comment ?? this.comment,
        business: business ?? this.business,
        service: service ?? this.service);
  }

  List<Object?> get props => [
        id,
        number,
        report,
        recordStatus,
        state,
        createdAt,
        updatedAt,
        author,
        type,
        user,
        review,
        comment,
        business,
        service
      ];
}
