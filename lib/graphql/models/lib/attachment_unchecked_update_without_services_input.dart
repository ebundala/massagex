import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'int_field_update_operations_input.dart';
import 'enum_attachment_type_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_unchecked_update_many_without_avator_input.dart';
import 'payment_method_unchecked_update_many_without_logo_input.dart';
import 'order_unchecked_update_many_without_receipt_input.dart';
import 'business_unchecked_update_many_without_cover_input.dart';
import 'category_unchecked_update_many_without_picture_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentUncheckedUpdateWithoutServicesInput extends Equatable {
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
  final NullableStringFieldUpdateOperationsInput? commentId;
  final NullableStringFieldUpdateOperationsInput? helpStepId;
  final NullableStringFieldUpdateOperationsInput? reviewId;
  final NullableStringFieldUpdateOperationsInput? userId;
  final NullableStringFieldUpdateOperationsInput? businessId;
  final UserUncheckedUpdateManyWithoutAvatorInput? users;
  final PaymentMethodUncheckedUpdateManyWithoutLogoInput? paymentMethods;
  final OrderUncheckedUpdateManyWithoutReceiptInput? orders;
  final BusinessUncheckedUpdateManyWithoutCoverInput? businesses;
  final CategoryUncheckedUpdateManyWithoutPictureInput? categories;

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

    if (users != null) {
      users!.getFilesVariables(
          field_name: '${field_name}_users', variables: variables);
    }

    if (paymentMethods != null) {
      paymentMethods!.getFilesVariables(
          field_name: '${field_name}_paymentMethods', variables: variables);
    }

    if (orders != null) {
      orders!.getFilesVariables(
          field_name: '${field_name}_orders', variables: variables);
    }

    if (businesses != null) {
      businesses!.getFilesVariables(
          field_name: '${field_name}_businesses', variables: variables);
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
        ),
      if (users != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'users'),
          value: users!.toValueNode(field_name: '${field_name}_users'),
        ),
      if (paymentMethods != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'paymentMethods'),
          value: paymentMethods!
              .toValueNode(field_name: '${field_name}_paymentMethods'),
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
      if (categories != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categories'),
          value:
              categories!.toValueNode(field_name: '${field_name}_categories'),
        )
    ]);
  }

  AttachmentUncheckedUpdateWithoutServicesInput(
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
      this.businessId,
      this.users,
      this.paymentMethods,
      this.orders,
      this.businesses,
      this.categories});

  static AttachmentUncheckedUpdateWithoutServicesInput fromJson(
      Map<dynamic, dynamic> json) {
    return AttachmentUncheckedUpdateWithoutServicesInput(
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
      commentId: json['commentId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['commentId'])
          : null,
      helpStepId: json['helpStepId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['helpStepId'])
          : null,
      reviewId: json['reviewId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['reviewId'])
          : null,
      userId: json['userId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['userId'])
          : null,
      businessId: json['businessId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['businessId'])
          : null,
      users: json['users'] != null
          ? UserUncheckedUpdateManyWithoutAvatorInput.fromJson(json['users'])
          : null,
      paymentMethods: json['paymentMethods'] != null
          ? PaymentMethodUncheckedUpdateManyWithoutLogoInput.fromJson(
              json['paymentMethods'])
          : null,
      orders: json['orders'] != null
          ? OrderUncheckedUpdateManyWithoutReceiptInput.fromJson(json['orders'])
          : null,
      businesses: json['businesses'] != null
          ? BusinessUncheckedUpdateManyWithoutCoverInput.fromJson(
              json['businesses'])
          : null,
      categories: json['categories'] != null
          ? CategoryUncheckedUpdateManyWithoutPictureInput.fromJson(
              json['categories'])
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
    if (users != null) _data['users'] = users!.toJson();
    if (paymentMethods != null)
      _data['paymentMethods'] = paymentMethods!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (businesses != null) _data['businesses'] = businesses!.toJson();
    if (categories != null) _data['categories'] = categories!.toJson();
    return _data;
  }

  AttachmentUncheckedUpdateWithoutServicesInput copyWith(
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
      NullableStringFieldUpdateOperationsInput? commentId,
      NullableStringFieldUpdateOperationsInput? helpStepId,
      NullableStringFieldUpdateOperationsInput? reviewId,
      NullableStringFieldUpdateOperationsInput? userId,
      NullableStringFieldUpdateOperationsInput? businessId,
      UserUncheckedUpdateManyWithoutAvatorInput? users,
      PaymentMethodUncheckedUpdateManyWithoutLogoInput? paymentMethods,
      OrderUncheckedUpdateManyWithoutReceiptInput? orders,
      BusinessUncheckedUpdateManyWithoutCoverInput? businesses,
      CategoryUncheckedUpdateManyWithoutPictureInput? categories}) {
    return AttachmentUncheckedUpdateWithoutServicesInput(
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
        businessId: businessId ?? this.businessId,
        users: users ?? this.users,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        orders: orders ?? this.orders,
        businesses: businesses ?? this.businesses,
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
        commentId,
        helpStepId,
        reviewId,
        userId,
        businessId,
        users,
        paymentMethods,
        orders,
        businesses,
        categories
      ];
}
