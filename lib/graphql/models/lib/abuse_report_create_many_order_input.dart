import 'record_status.dart';
import 'abuse_report_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseReportCreateManyOrderInput extends Equatable {
  final String? id;
  final int? number;
  final String? report;
  final String authorId;
  final String typeId;
  final RecordStatus? recordStatus;
  final AbuseReportStatus? state;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;
  final String? reviewId;
  final String? commentId;
  final String? businessId;
  final String? serviceId;

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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'authorId'),
        value: ast.StringValueNode(value: '${authorId}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'typeId'),
        value: ast.StringValueNode(value: '${typeId}', isBlock: false),
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
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.StringValueNode(value: '${userId!}', isBlock: false),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: ast.StringValueNode(value: '${reviewId!}', isBlock: false),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: ast.StringValueNode(value: '${commentId!}', isBlock: false),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.StringValueNode(value: '${businessId!}', isBlock: false),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: ast.StringValueNode(value: '${serviceId!}', isBlock: false),
        )
    ]);
  }

  AbuseReportCreateManyOrderInput(
      {this.id,
      this.number,
      this.report,
      required this.authorId,
      required this.typeId,
      this.recordStatus,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId});

  static AbuseReportCreateManyOrderInput fromJson(Map<dynamic, dynamic> json) {
    return AbuseReportCreateManyOrderInput(
      id: json['id'],
      number: json['number'],
      report: json['report'],
      authorId: json['authorId'],
      typeId: json['typeId'],
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
      userId: json['userId'],
      reviewId: json['reviewId'],
      commentId: json['commentId'],
      businessId: json['businessId'],
      serviceId: json['serviceId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (number != null) _data['number'] = number;
    if (report != null) _data['report'] = report;

    _data['authorId'] = authorId;

    _data['typeId'] = typeId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (userId != null) _data['userId'] = userId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentId != null) _data['commentId'] = commentId;
    if (businessId != null) _data['businessId'] = businessId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    return _data;
  }

  AbuseReportCreateManyOrderInput copyWith(
      {String? id,
      int? number,
      String? report,
      String? authorId,
      String? typeId,
      RecordStatus? recordStatus,
      AbuseReportStatus? state,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? userId,
      String? reviewId,
      String? commentId,
      String? businessId,
      String? serviceId}) {
    return AbuseReportCreateManyOrderInput(
        id: id ?? this.id,
        number: number ?? this.number,
        report: report ?? this.report,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        reviewId: reviewId ?? this.reviewId,
        commentId: commentId ?? this.commentId,
        businessId: businessId ?? this.businessId,
        serviceId: serviceId ?? this.serviceId);
  }

  List<Object?> get props => [
        id,
        number,
        report,
        authorId,
        typeId,
        recordStatus,
        state,
        createdAt,
        updatedAt,
        userId,
        reviewId,
        commentId,
        businessId,
        serviceId
      ];
}
