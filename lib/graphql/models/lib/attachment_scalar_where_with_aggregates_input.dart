import 'string_with_aggregates_filter.dart';
import 'string_nullable_with_aggregates_filter.dart';
import 'enum_record_status_with_aggregates_filter.dart';
import 'int_with_aggregates_filter.dart';
import 'enum_attachment_type_with_aggregates_filter.dart';
import 'bool_with_aggregates_filter.dart';
import 'date_time_with_aggregates_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentScalarWhereWithAggregatesInput extends Equatable {
  final List<AttachmentScalarWhereWithAggregatesInput>? AND;
  final List<AttachmentScalarWhereWithAggregatesInput>? OR;
  final List<AttachmentScalarWhereWithAggregatesInput>? NOT;
  final StringWithAggregatesFilter? id;
  final StringWithAggregatesFilter? path;
  final StringNullableWithAggregatesFilter? filename;
  final StringNullableWithAggregatesFilter? mimetype;
  final StringNullableWithAggregatesFilter? encoding;
  final EnumRecordStatusWithAggregatesFilter? recordStatus;
  final IntWithAggregatesFilter? duration;
  final IntWithAggregatesFilter? size;
  final EnumAttachmentTypeWithAggregatesFilter? attachmentType;
  final BoolWithAggregatesFilter? downloadable;
  final StringWithAggregatesFilter? placement;
  final DateTimeWithAggregatesFilter? createdAt;
  final DateTimeWithAggregatesFilter? updatedAt;
  final StringNullableWithAggregatesFilter? commentId;
  final StringNullableWithAggregatesFilter? helpStepId;
  final StringNullableWithAggregatesFilter? reviewId;
  final StringNullableWithAggregatesFilter? userId;
  final StringNullableWithAggregatesFilter? businessId;

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

    if (path != null) {
      path!.getFilesVariables(
          field_name: '${field_name}_path', variables: variables);
    }

    if (filename != null) {
      filename!.getFilesVariables(
          field_name: '${field_name}_filename', variables: variables);
    }

    if (mimetype != null) {
      mimetype!.getFilesVariables(
          field_name: '${field_name}_mimetype', variables: variables);
    }

    if (encoding != null) {
      encoding!.getFilesVariables(
          field_name: '${field_name}_encoding', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (duration != null) {
      duration!.getFilesVariables(
          field_name: '${field_name}_duration', variables: variables);
    }

    if (size != null) {
      size!.getFilesVariables(
          field_name: '${field_name}_size', variables: variables);
    }

    if (attachmentType != null) {
      attachmentType!.getFilesVariables(
          field_name: '${field_name}_attachmentType', variables: variables);
    }

    if (downloadable != null) {
      downloadable!.getFilesVariables(
          field_name: '${field_name}_downloadable', variables: variables);
    }

    if (placement != null) {
      placement!.getFilesVariables(
          field_name: '${field_name}_placement', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
    }

    if (helpStepId != null) {
      helpStepId!.getFilesVariables(
          field_name: '${field_name}_helpStepId', variables: variables);
    }

    if (reviewId != null) {
      reviewId!.getFilesVariables(
          field_name: '${field_name}_reviewId', variables: variables);
    }

    if (userId != null) {
      userId!.getFilesVariables(
          field_name: '${field_name}_userId', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
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
      if (path != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'path'),
          value: path!.toValueNode(field_name: '${field_name}_path'),
        ),
      if (filename != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'filename'),
          value: filename!.toValueNode(field_name: '${field_name}_filename'),
        ),
      if (mimetype != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mimetype'),
          value: mimetype!.toValueNode(field_name: '${field_name}_mimetype'),
        ),
      if (encoding != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'encoding'),
          value: encoding!.toValueNode(field_name: '${field_name}_encoding'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (duration != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'duration'),
          value: duration!.toValueNode(field_name: '${field_name}_duration'),
        ),
      if (size != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'size'),
          value: size!.toValueNode(field_name: '${field_name}_size'),
        ),
      if (attachmentType != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachmentType'),
          value: attachmentType!
              .toValueNode(field_name: '${field_name}_attachmentType'),
        ),
      if (downloadable != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'downloadable'),
          value: downloadable!
              .toValueNode(field_name: '${field_name}_downloadable'),
        ),
      if (placement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'placement'),
          value: placement!.toValueNode(field_name: '${field_name}_placement'),
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
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
        ),
      if (helpStepId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpStepId'),
          value:
              helpStepId!.toValueNode(field_name: '${field_name}_helpStepId'),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: reviewId!.toValueNode(field_name: '${field_name}_reviewId'),
        ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: userId!.toValueNode(field_name: '${field_name}_userId'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        )
    ]);
  }

  AttachmentScalarWhereWithAggregatesInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.path,
      this.filename,
      this.mimetype,
      this.encoding,
      this.recordStatus,
      this.duration,
      this.size,
      this.attachmentType,
      this.downloadable,
      this.placement,
      this.createdAt,
      this.updatedAt,
      this.commentId,
      this.helpStepId,
      this.reviewId,
      this.userId,
      this.businessId});

  static AttachmentScalarWhereWithAggregatesInput fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentScalarWhereWithAggregatesInput(
      AND: json['AND'] != null
          ? List.generate(
              json['AND'].length,
              (index) => AttachmentScalarWhereWithAggregatesInput.fromJson(
                  json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(
              json['OR'].length,
              (index) => AttachmentScalarWhereWithAggregatesInput.fromJson(
                  json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(
              json['NOT'].length,
              (index) => AttachmentScalarWhereWithAggregatesInput.fromJson(
                  json['NOT'][index]))
          : null,
      id: json['id'] != null
          ? StringWithAggregatesFilter.fromJson(json['id'])
          : null,
      path: json['path'] != null
          ? StringWithAggregatesFilter.fromJson(json['path'])
          : null,
      filename: json['filename'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['filename'])
          : null,
      mimetype: json['mimetype'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['mimetype'])
          : null,
      encoding: json['encoding'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['encoding'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusWithAggregatesFilter.fromJson(json['recordStatus'])
          : null,
      duration: json['duration'] != null
          ? IntWithAggregatesFilter.fromJson(json['duration'])
          : null,
      size: json['size'] != null
          ? IntWithAggregatesFilter.fromJson(json['size'])
          : null,
      attachmentType: json['attachmentType'] != null
          ? EnumAttachmentTypeWithAggregatesFilter.fromJson(
              json['attachmentType'])
          : null,
      downloadable: json['downloadable'] != null
          ? BoolWithAggregatesFilter.fromJson(json['downloadable'])
          : null,
      placement: json['placement'] != null
          ? StringWithAggregatesFilter.fromJson(json['placement'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['updatedAt'])
          : null,
      commentId: json['commentId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['commentId'])
          : null,
      helpStepId: json['helpStepId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['helpStepId'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['reviewId'])
          : null,
      userId: json['userId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['userId'])
          : null,
      businessId: json['businessId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['businessId'])
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
    if (path != null) _data['path'] = path!.toJson();
    if (filename != null) _data['filename'] = filename!.toJson();
    if (mimetype != null) _data['mimetype'] = mimetype!.toJson();
    if (encoding != null) _data['encoding'] = encoding!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (duration != null) _data['duration'] = duration!.toJson();
    if (size != null) _data['size'] = size!.toJson();
    if (attachmentType != null)
      _data['attachmentType'] = attachmentType!.toJson();
    if (downloadable != null) _data['downloadable'] = downloadable!.toJson();
    if (placement != null) _data['placement'] = placement!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (helpStepId != null) _data['helpStepId'] = helpStepId!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    return _data;
  }

  AttachmentScalarWhereWithAggregatesInput copyWith(
      {List<AttachmentScalarWhereWithAggregatesInput>? AND,
      List<AttachmentScalarWhereWithAggregatesInput>? OR,
      List<AttachmentScalarWhereWithAggregatesInput>? NOT,
      StringWithAggregatesFilter? id,
      StringWithAggregatesFilter? path,
      StringNullableWithAggregatesFilter? filename,
      StringNullableWithAggregatesFilter? mimetype,
      StringNullableWithAggregatesFilter? encoding,
      EnumRecordStatusWithAggregatesFilter? recordStatus,
      IntWithAggregatesFilter? duration,
      IntWithAggregatesFilter? size,
      EnumAttachmentTypeWithAggregatesFilter? attachmentType,
      BoolWithAggregatesFilter? downloadable,
      StringWithAggregatesFilter? placement,
      DateTimeWithAggregatesFilter? createdAt,
      DateTimeWithAggregatesFilter? updatedAt,
      StringNullableWithAggregatesFilter? commentId,
      StringNullableWithAggregatesFilter? helpStepId,
      StringNullableWithAggregatesFilter? reviewId,
      StringNullableWithAggregatesFilter? userId,
      StringNullableWithAggregatesFilter? businessId}) {
    return AttachmentScalarWhereWithAggregatesInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        path: path ?? this.path,
        filename: filename ?? this.filename,
        mimetype: mimetype ?? this.mimetype,
        encoding: encoding ?? this.encoding,
        recordStatus: recordStatus ?? this.recordStatus,
        duration: duration ?? this.duration,
        size: size ?? this.size,
        attachmentType: attachmentType ?? this.attachmentType,
        downloadable: downloadable ?? this.downloadable,
        placement: placement ?? this.placement,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        commentId: commentId ?? this.commentId,
        helpStepId: helpStepId ?? this.helpStepId,
        reviewId: reviewId ?? this.reviewId,
        userId: userId ?? this.userId,
        businessId: businessId ?? this.businessId);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        path,
        filename,
        mimetype,
        encoding,
        recordStatus,
        duration,
        size,
        attachmentType,
        downloadable,
        placement,
        createdAt,
        updatedAt,
        commentId,
        helpStepId,
        reviewId,
        userId,
        businessId
      ];
}
