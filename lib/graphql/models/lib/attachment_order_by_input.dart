import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? path;
  final SortOrder? filename;
  final SortOrder? mimetype;
  final SortOrder? encoding;
  final SortOrder? recordStatus;
  final SortOrder? duration;
  final SortOrder? size;
  final SortOrder? attachmentType;
  final SortOrder? downloadable;
  final SortOrder? placement;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? commentId;
  final SortOrder? helpStepId;
  final SortOrder? reviewId;
  final SortOrder? userId;
  final SortOrder? businessId;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (path != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'path'),
          value: ast.EnumValueNode(name: ast.NameNode(value: path!.toJson())),
        ),
      if (filename != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'filename'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: filename!.toJson())),
        ),
      if (mimetype != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mimetype'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: mimetype!.toJson())),
        ),
      if (encoding != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'encoding'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: encoding!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (duration != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'duration'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: duration!.toJson())),
        ),
      if (size != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'size'),
          value: ast.EnumValueNode(name: ast.NameNode(value: size!.toJson())),
        ),
      if (attachmentType != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachmentType'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: attachmentType!.toJson())),
        ),
      if (downloadable != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'downloadable'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: downloadable!.toJson())),
        ),
      if (placement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'placement'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: placement!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: commentId!.toJson())),
        ),
      if (helpStepId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpStepId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: helpStepId!.toJson())),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: reviewId!.toJson())),
        ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: userId!.toJson())),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: businessId!.toJson())),
        )
    ]);
  }

  AttachmentOrderByInput(
      {this.id,
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

  static AttachmentOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return AttachmentOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      path: json['path'] != null ? SortOrderExt.fromJson(json['path']) : null,
      filename: json['filename'] != null
          ? SortOrderExt.fromJson(json['filename'])
          : null,
      mimetype: json['mimetype'] != null
          ? SortOrderExt.fromJson(json['mimetype'])
          : null,
      encoding: json['encoding'] != null
          ? SortOrderExt.fromJson(json['encoding'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      duration: json['duration'] != null
          ? SortOrderExt.fromJson(json['duration'])
          : null,
      size: json['size'] != null ? SortOrderExt.fromJson(json['size']) : null,
      attachmentType: json['attachmentType'] != null
          ? SortOrderExt.fromJson(json['attachmentType'])
          : null,
      downloadable: json['downloadable'] != null
          ? SortOrderExt.fromJson(json['downloadable'])
          : null,
      placement: json['placement'] != null
          ? SortOrderExt.fromJson(json['placement'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      commentId: json['commentId'] != null
          ? SortOrderExt.fromJson(json['commentId'])
          : null,
      helpStepId: json['helpStepId'] != null
          ? SortOrderExt.fromJson(json['helpStepId'])
          : null,
      reviewId: json['reviewId'] != null
          ? SortOrderExt.fromJson(json['reviewId'])
          : null,
      userId:
          json['userId'] != null ? SortOrderExt.fromJson(json['userId']) : null,
      businessId: json['businessId'] != null
          ? SortOrderExt.fromJson(json['businessId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
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

  AttachmentOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? path,
      SortOrder? filename,
      SortOrder? mimetype,
      SortOrder? encoding,
      SortOrder? recordStatus,
      SortOrder? duration,
      SortOrder? size,
      SortOrder? attachmentType,
      SortOrder? downloadable,
      SortOrder? placement,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? commentId,
      SortOrder? helpStepId,
      SortOrder? reviewId,
      SortOrder? userId,
      SortOrder? businessId}) {
    return AttachmentOrderByInput(
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
