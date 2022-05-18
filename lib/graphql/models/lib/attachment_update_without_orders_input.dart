import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'enum_attachment_type_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_update_many_without_avator_input.dart';
import 'comment_update_one_without_attachments_input.dart';
import 'payment_method_update_many_without_logo_input.dart';
import 'service_update_many_without_image_input.dart';
import 'business_update_many_without_cover_input.dart';
import 'help_step_update_one_without_attachments_input.dart';
import 'review_update_one_without_attachments_input.dart';
import 'business_update_one_without_attachments_input.dart';
import 'category_update_many_without_picture_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentUpdateWithoutOrdersInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? path;
  final NullableStringFieldUpdateOperationsInput? filename;
  final NullableStringFieldUpdateOperationsInput? mimetype;
  final NullableStringFieldUpdateOperationsInput? encoding;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final IntFieldUpdateOperationsInput? duration;
  final IntFieldUpdateOperationsInput? size;
  final EnumAttachmentTypeFieldUpdateOperationsInput? attachmentType;
  final BoolFieldUpdateOperationsInput? downloadable;
  final StringFieldUpdateOperationsInput? placement;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? userId;
  final UserUpdateManyWithoutAvatorInput? users;
  final CommentUpdateOneWithoutAttachmentsInput? comment;
  final PaymentMethodUpdateManyWithoutLogoInput? paymentMethods;
  final ServiceUpdateManyWithoutImageInput? services;
  final BusinessUpdateManyWithoutCoverInput? businesses;
  final HelpStepUpdateOneWithoutAttachmentsInput? helpStep;
  final ReviewUpdateOneWithoutAttachmentsInput? reviews;
  final BusinessUpdateOneWithoutAttachmentsInput? business;
  final CategoryUpdateManyWithoutPictureInput? categories;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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

    if (userId != null) {
      userId!.getFilesVariables(
          field_name: '${field_name}_userId', variables: variables);
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

    if (categories != null) {
      categories!.getFilesVariables(
          field_name: '${field_name}_categories', variables: variables);
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
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: userId!.toValueNode(field_name: '${field_name}_userId'),
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
        ),
      if (categories != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categories'),
          value:
              categories!.toValueNode(field_name: '${field_name}_categories'),
        )
    ]);
  }

  AttachmentUpdateWithoutOrdersInput(
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
      this.userId,
      this.users,
      this.comment,
      this.paymentMethods,
      this.services,
      this.businesses,
      this.helpStep,
      this.reviews,
      this.business,
      this.categories});

  static AttachmentUpdateWithoutOrdersInput fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentUpdateWithoutOrdersInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      path: json['path'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['path'])
          : null,
      filename: json['filename'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['filename'])
          : null,
      mimetype: json['mimetype'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['mimetype'])
          : null,
      encoding: json['encoding'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['encoding'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      duration: json['duration'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['duration'])
          : null,
      size: json['size'] != null
          ? IntFieldUpdateOperationsInput.fromJson(json['size'])
          : null,
      attachmentType: json['attachmentType'] != null
          ? EnumAttachmentTypeFieldUpdateOperationsInput.fromJson(
              json['attachmentType'])
          : null,
      downloadable: json['downloadable'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['downloadable'])
          : null,
      placement: json['placement'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['placement'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      userId: json['userId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['userId'])
          : null,
      users: json['users'] != null
          ? UserUpdateManyWithoutAvatorInput.fromJson(json['users'])
          : null,
      comment: json['comment'] != null
          ? CommentUpdateOneWithoutAttachmentsInput.fromJson(json['comment'])
          : null,
      paymentMethods: json['paymentMethods'] != null
          ? PaymentMethodUpdateManyWithoutLogoInput.fromJson(
              json['paymentMethods'])
          : null,
      services: json['services'] != null
          ? ServiceUpdateManyWithoutImageInput.fromJson(json['services'])
          : null,
      businesses: json['businesses'] != null
          ? BusinessUpdateManyWithoutCoverInput.fromJson(json['businesses'])
          : null,
      helpStep: json['helpStep'] != null
          ? HelpStepUpdateOneWithoutAttachmentsInput.fromJson(json['helpStep'])
          : null,
      reviews: json['reviews'] != null
          ? ReviewUpdateOneWithoutAttachmentsInput.fromJson(json['reviews'])
          : null,
      business: json['business'] != null
          ? BusinessUpdateOneWithoutAttachmentsInput.fromJson(json['business'])
          : null,
      categories: json['categories'] != null
          ? CategoryUpdateManyWithoutPictureInput.fromJson(json['categories'])
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
    if (userId != null) _data['userId'] = userId!.toJson();
    if (users != null) _data['users'] = users!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (paymentMethods != null)
      _data['paymentMethods'] = paymentMethods!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (businesses != null) _data['businesses'] = businesses!.toJson();
    if (helpStep != null) _data['helpStep'] = helpStep!.toJson();
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (categories != null) _data['categories'] = categories!.toJson();
    return _data;
  }

  AttachmentUpdateWithoutOrdersInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? path,
      NullableStringFieldUpdateOperationsInput? filename,
      NullableStringFieldUpdateOperationsInput? mimetype,
      NullableStringFieldUpdateOperationsInput? encoding,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      IntFieldUpdateOperationsInput? duration,
      IntFieldUpdateOperationsInput? size,
      EnumAttachmentTypeFieldUpdateOperationsInput? attachmentType,
      BoolFieldUpdateOperationsInput? downloadable,
      StringFieldUpdateOperationsInput? placement,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? userId,
      UserUpdateManyWithoutAvatorInput? users,
      CommentUpdateOneWithoutAttachmentsInput? comment,
      PaymentMethodUpdateManyWithoutLogoInput? paymentMethods,
      ServiceUpdateManyWithoutImageInput? services,
      BusinessUpdateManyWithoutCoverInput? businesses,
      HelpStepUpdateOneWithoutAttachmentsInput? helpStep,
      ReviewUpdateOneWithoutAttachmentsInput? reviews,
      BusinessUpdateOneWithoutAttachmentsInput? business,
      CategoryUpdateManyWithoutPictureInput? categories}) {
    return AttachmentUpdateWithoutOrdersInput(
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
        userId: userId ?? this.userId,
        users: users ?? this.users,
        comment: comment ?? this.comment,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        services: services ?? this.services,
        businesses: businesses ?? this.businesses,
        helpStep: helpStep ?? this.helpStep,
        reviews: reviews ?? this.reviews,
        business: business ?? this.business,
        categories: categories ?? this.categories);
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
        userId,
        users,
        comment,
        paymentMethods,
        services,
        businesses,
        helpStep,
        reviews,
        business,
        categories
      ];
}
