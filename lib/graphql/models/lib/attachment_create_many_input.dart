import 'record_status.dart';
import 'attachment_type.dart';

import "package:http/http.dart" show MultipartFile;
import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentCreateManyInput extends Equatable {
  final MultipartFile path;
  final String? id;
  final String? filename;
  final String? mimetype;
  final String? encoding;
  final RecordStatus? recordStatus;
  final int? duration;
  final int? size;
  final AttachmentType? attachmentType;
  final bool? downloadable;
  final String? placement;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? commentId;
  final String? helpStepId;
  final String? reviewId;
  final String? userId;
  final String? businessId;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      variables['${field_name}_path'] = path;
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'path'),
        value:
            ast.VariableNode(name: ast.NameNode(value: '${field_name}_path')),
      ),
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      if (filename != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'filename'),
          value: ast.StringValueNode(value: '${filename!}', isBlock: false),
        ),
      if (mimetype != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mimetype'),
          value: ast.StringValueNode(value: '${mimetype!}', isBlock: false),
        ),
      if (encoding != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'encoding'),
          value: ast.StringValueNode(value: '${encoding!}', isBlock: false),
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
          value: ast.IntValueNode(value: '${duration!}'),
        ),
      if (size != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'size'),
          value: ast.IntValueNode(value: '${size!}'),
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
          value: ast.BooleanValueNode(value: downloadable!),
        ),
      if (placement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'placement'),
          value: ast.StringValueNode(value: '${placement!}', isBlock: false),
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
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: ast.StringValueNode(value: '${commentId!}', isBlock: false),
        ),
      if (helpStepId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpStepId'),
          value: ast.StringValueNode(value: '${helpStepId!}', isBlock: false),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: ast.StringValueNode(value: '${reviewId!}', isBlock: false),
        ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.StringValueNode(value: '${userId!}', isBlock: false),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.StringValueNode(value: '${businessId!}', isBlock: false),
        )
    ]);
  }

  AttachmentCreateManyInput(
      {required this.path,
      this.id,
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

  static AttachmentCreateManyInput fromJson(Map<dynamic, dynamic> json) {
    return AttachmentCreateManyInput(
      path: json['path'],
      id: json['id'],
      filename: json['filename'],
      mimetype: json['mimetype'],
      encoding: json['encoding'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      duration: json['duration'],
      size: json['size'],
      attachmentType: json['attachmentType'] != null
          ? AttachmentTypeExt.fromJson(json['attachmentType'])
          : null,
      downloadable: json['downloadable'],
      placement: json['placement'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      commentId: json['commentId'],
      helpStepId: json['helpStepId'],
      reviewId: json['reviewId'],
      userId: json['userId'],
      businessId: json['businessId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['path'] = path;
    if (id != null) _data['id'] = id;
    if (filename != null) _data['filename'] = filename;
    if (mimetype != null) _data['mimetype'] = mimetype;
    if (encoding != null) _data['encoding'] = encoding;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (duration != null) _data['duration'] = duration;
    if (size != null) _data['size'] = size;
    if (attachmentType != null)
      _data['attachmentType'] = attachmentType!.toJson();
    if (downloadable != null) _data['downloadable'] = downloadable;
    if (placement != null) _data['placement'] = placement;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (commentId != null) _data['commentId'] = commentId;
    if (helpStepId != null) _data['helpStepId'] = helpStepId;
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (userId != null) _data['userId'] = userId;
    if (businessId != null) _data['businessId'] = businessId;
    return _data;
  }

  AttachmentCreateManyInput copyWith(
      {MultipartFile? path,
      String? id,
      String? filename,
      String? mimetype,
      String? encoding,
      RecordStatus? recordStatus,
      int? duration,
      int? size,
      AttachmentType? attachmentType,
      bool? downloadable,
      String? placement,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? commentId,
      String? helpStepId,
      String? reviewId,
      String? userId,
      String? businessId}) {
    return AttachmentCreateManyInput(
        path: path ?? this.path,
        id: id ?? this.id,
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
        path,
        id,
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
