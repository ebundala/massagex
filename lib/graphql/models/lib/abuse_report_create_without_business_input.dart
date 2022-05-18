import 'record_status.dart';
import 'abuse_report_status.dart';
import 'user_create_nested_one_without_abuse_reported_input.dart';
import 'abuse_record_type_create_nested_one_without_abuse_reports_input.dart';
import 'user_create_nested_one_without_abuse_reports_input.dart';
import 'review_create_nested_one_without_abuse_reports_input.dart';
import 'comment_create_nested_one_without_abuse_reports_input.dart';
import 'service_create_nested_one_without_abuse_reports_input.dart';
import 'order_create_nested_one_without_abuse_reports_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseReportCreateWithoutBusinessInput extends Equatable {
  final String? id;
  final int? number;
  final String? report;
  final RecordStatus? recordStatus;
  final AbuseReportStatus? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedOneWithoutAbuseReportedInput author;
  final AbuseRecordTypeCreateNestedOneWithoutAbuseReportsInput type;
  final UserCreateNestedOneWithoutAbuseReportsInput? user;
  final ReviewCreateNestedOneWithoutAbuseReportsInput? review;
  final CommentCreateNestedOneWithoutAbuseReportsInput? comment;
  final ServiceCreateNestedOneWithoutAbuseReportsInput? service;
  final OrderCreateNestedOneWithoutAbuseReportsInput? order;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      author.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    {
      type.getFilesVariables(
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

    if (service != null) {
      service!.getFilesVariables(
          field_name: '${field_name}_service', variables: variables);
    }

    if (order != null) {
      order!.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
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
      if (number != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'number'),
          value: ast.IntValueNode(value: '${number!}'),
        ),
      if (report != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'report'),
          value: ast.StringValueNode(value: '${report!}', isBlock: false),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: ast.EnumValueNode(name: ast.NameNode(value: state!.toJson())),
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'type'),
        value: type.toValueNode(field_name: '${field_name}_type'),
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
      if (service != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'service'),
          value: service!.toValueNode(field_name: '${field_name}_service'),
        ),
      if (order != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'order'),
          value: order!.toValueNode(field_name: '${field_name}_order'),
        )
    ]);
  }

  AbuseReportCreateWithoutBusinessInput(
      {this.id,
      this.number,
      this.report,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt,
      required this.author,
      required this.type,
      this.user,
      this.review,
      this.comment,
      this.service,
      this.order});

  static AbuseReportCreateWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportCreateWithoutBusinessInput(
      id: json['id'],
      number: json['number'],
      report: json['report'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? AbuseReportStatusExt.fromJson(json['state'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      author:
          UserCreateNestedOneWithoutAbuseReportedInput.fromJson(json['author']),
      type: AbuseRecordTypeCreateNestedOneWithoutAbuseReportsInput.fromJson(
          json['type']),
      user: json['user'] != null
          ? UserCreateNestedOneWithoutAbuseReportsInput.fromJson(json['user'])
          : null,
      review: json['review'] != null
          ? ReviewCreateNestedOneWithoutAbuseReportsInput.fromJson(
              json['review'])
          : null,
      comment: json['comment'] != null
          ? CommentCreateNestedOneWithoutAbuseReportsInput.fromJson(
              json['comment'])
          : null,
      service: json['service'] != null
          ? ServiceCreateNestedOneWithoutAbuseReportsInput.fromJson(
              json['service'])
          : null,
      order: json['order'] != null
          ? OrderCreateNestedOneWithoutAbuseReportsInput.fromJson(json['order'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (number != null) _data['number'] = number;
    if (report != null) _data['report'] = report;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['author'] = author.toJson();

    _data['type'] = type.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    return _data;
  }

  AbuseReportCreateWithoutBusinessInput copyWith(
      {String? id,
      int? number,
      String? report,
      RecordStatus? recordStatus,
      AbuseReportStatus? state,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedOneWithoutAbuseReportedInput? author,
      AbuseRecordTypeCreateNestedOneWithoutAbuseReportsInput? type,
      UserCreateNestedOneWithoutAbuseReportsInput? user,
      ReviewCreateNestedOneWithoutAbuseReportsInput? review,
      CommentCreateNestedOneWithoutAbuseReportsInput? comment,
      ServiceCreateNestedOneWithoutAbuseReportsInput? service,
      OrderCreateNestedOneWithoutAbuseReportsInput? order}) {
    return AbuseReportCreateWithoutBusinessInput(
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
        service: service ?? this.service,
        order: order ?? this.order);
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
        service,
        order
      ];
}
