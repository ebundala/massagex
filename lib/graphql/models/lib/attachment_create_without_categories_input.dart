import 'record_status.dart';
import 'attachment_type.dart';
import 'user_create_nested_many_without_avator_input.dart';
import 'comment_create_nested_one_without_attachments_input.dart';
import 'payment_method_create_nested_many_without_logo_input.dart';
import 'service_create_nested_many_without_image_input.dart';
import 'order_create_nested_many_without_receipt_input.dart';
import 'business_create_nested_many_without_cover_input.dart';
import 'help_step_create_nested_one_without_attachments_input.dart';
import 'review_create_nested_one_without_attachments_input.dart';
import 'business_create_nested_one_without_attachments_input.dart';

import "package:http/http.dart" show MultipartFile;
import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentCreateWithoutCategoriesInput extends Equatable {
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
  final String? userId;
  final UserCreateNestedManyWithoutAvatorInput? users;
  final CommentCreateNestedOneWithoutAttachmentsInput? comment;
  final PaymentMethodCreateNestedManyWithoutLogoInput? paymentMethods;
  final ServiceCreateNestedManyWithoutImageInput? services;
  final OrderCreateNestedManyWithoutReceiptInput? orders;
  final BusinessCreateNestedManyWithoutCoverInput? businesses;
  final HelpStepCreateNestedOneWithoutAttachmentsInput? helpStep;
  final ReviewCreateNestedOneWithoutAttachmentsInput? reviews;
  final BusinessCreateNestedOneWithoutAttachmentsInput? business;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      variables['${field_name}_path'] = path;
    }
    if (users != null) {
      users!.getFilesVariables(
          field_name: '${field_name}_users', variables: variables);
    }

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
    }

    if (paymentMethods != null) {
      paymentMethods!.getFilesVariables(
          field_name: '${field_name}_paymentMethods', variables: variables);
    }

    if (services != null) {
      services!.getFilesVariables(
          field_name: '${field_name}_services', variables: variables);
    }

    if (orders != null) {
      orders!.getFilesVariables(
          field_name: '${field_name}_orders', variables: variables);
    }

    if (businesses != null) {
      businesses!.getFilesVariables(
          field_name: '${field_name}_businesses', variables: variables);
    }

    if (helpStep != null) {
      helpStep!.getFilesVariables(
          field_name: '${field_name}_helpStep', variables: variables);
    }

    if (reviews != null) {
      reviews!.getFilesVariables(
          field_name: '${field_name}_reviews', variables: variables);
    }

    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
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
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.StringValueNode(value: '${userId!}', isBlock: false),
        ),
      if (users != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'users'),
          value: users!.toValueNode(field_name: '${field_name}_users'),
        ),
      if (comment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comment'),
          value: comment!.toValueNode(field_name: '${field_name}_comment'),
        ),
      if (paymentMethods != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethods'),
          value: paymentMethods!
              .toValueNode(field_name: '${field_name}_paymentMethods'),
        ),
      if (services != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'services'),
          value: services!.toValueNode(field_name: '${field_name}_services'),
        ),
      if (orders != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orders'),
          value: orders!.toValueNode(field_name: '${field_name}_orders'),
        ),
      if (businesses != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businesses'),
          value:
              businesses!.toValueNode(field_name: '${field_name}_businesses'),
        ),
      if (helpStep != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpStep'),
          value: helpStep!.toValueNode(field_name: '${field_name}_helpStep'),
        ),
      if (reviews != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviews'),
          value: reviews!.toValueNode(field_name: '${field_name}_reviews'),
        ),
      if (business != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'business'),
          value: business!.toValueNode(field_name: '${field_name}_business'),
        )
    ]);
  }

  AttachmentCreateWithoutCategoriesInput(
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
      this.userId,
      this.users,
      this.comment,
      this.paymentMethods,
      this.services,
      this.orders,
      this.businesses,
      this.helpStep,
      this.reviews,
      this.business});

  static AttachmentCreateWithoutCategoriesInput fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentCreateWithoutCategoriesInput(
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
      userId: json['userId'],
      users: json['users'] != null
          ? UserCreateNestedManyWithoutAvatorInput.fromJson(json['users'])
          : null,
      comment: json['comment'] != null
          ? CommentCreateNestedOneWithoutAttachmentsInput.fromJson(
              json['comment'])
          : null,
      paymentMethods: json['paymentMethods'] != null
          ? PaymentMethodCreateNestedManyWithoutLogoInput.fromJson(
              json['paymentMethods'])
          : null,
      services: json['services'] != null
          ? ServiceCreateNestedManyWithoutImageInput.fromJson(json['services'])
          : null,
      orders: json['orders'] != null
          ? OrderCreateNestedManyWithoutReceiptInput.fromJson(json['orders'])
          : null,
      businesses: json['businesses'] != null
          ? BusinessCreateNestedManyWithoutCoverInput.fromJson(
              json['businesses'])
          : null,
      helpStep: json['helpStep'] != null
          ? HelpStepCreateNestedOneWithoutAttachmentsInput.fromJson(
              json['helpStep'])
          : null,
      reviews: json['reviews'] != null
          ? ReviewCreateNestedOneWithoutAttachmentsInput.fromJson(
              json['reviews'])
          : null,
      business: json['business'] != null
          ? BusinessCreateNestedOneWithoutAttachmentsInput.fromJson(
              json['business'])
          : null,
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
    if (userId != null) _data['userId'] = userId;
    if (users != null) _data['users'] = users!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (paymentMethods != null)
      _data['paymentMethods'] = paymentMethods!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (businesses != null) _data['businesses'] = businesses!.toJson();
    if (helpStep != null) _data['helpStep'] = helpStep!.toJson();
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    return _data;
  }

  AttachmentCreateWithoutCategoriesInput copyWith(
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
      String? userId,
      UserCreateNestedManyWithoutAvatorInput? users,
      CommentCreateNestedOneWithoutAttachmentsInput? comment,
      PaymentMethodCreateNestedManyWithoutLogoInput? paymentMethods,
      ServiceCreateNestedManyWithoutImageInput? services,
      OrderCreateNestedManyWithoutReceiptInput? orders,
      BusinessCreateNestedManyWithoutCoverInput? businesses,
      HelpStepCreateNestedOneWithoutAttachmentsInput? helpStep,
      ReviewCreateNestedOneWithoutAttachmentsInput? reviews,
      BusinessCreateNestedOneWithoutAttachmentsInput? business}) {
    return AttachmentCreateWithoutCategoriesInput(
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
        userId: userId ?? this.userId,
        users: users ?? this.users,
        comment: comment ?? this.comment,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        businesses: businesses ?? this.businesses,
        helpStep: helpStep ?? this.helpStep,
        reviews: reviews ?? this.reviews,
        business: business ?? this.business);
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
        userId,
        users,
        comment,
        paymentMethods,
        services,
        orders,
        businesses,
        helpStep,
        reviews,
        business
      ];
}
