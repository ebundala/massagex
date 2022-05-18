import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'enum_record_status_filter.dart';
import 'int_filter.dart';
import 'enum_attachment_type_filter.dart';
import 'bool_filter.dart';
import 'date_time_filter.dart';
import 'user_list_relation_filter.dart';
import 'comment_relation_filter.dart';
import 'payment_method_list_relation_filter.dart';
import 'service_list_relation_filter.dart';
import 'order_list_relation_filter.dart';
import 'business_list_relation_filter.dart';
import 'help_step_relation_filter.dart';
import 'review_relation_filter.dart';
import 'business_relation_filter.dart';
import 'category_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AttachmentWhereInput extends Equatable {
  final List<AttachmentWhereInput>? AND;
  final List<AttachmentWhereInput>? OR;
  final List<AttachmentWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? path;
  final StringNullableFilter? filename;
  final StringNullableFilter? mimetype;
  final StringNullableFilter? encoding;
  final EnumRecordStatusFilter? recordStatus;
  final IntFilter? duration;
  final IntFilter? size;
  final EnumAttachmentTypeFilter? attachmentType;
  final BoolFilter? downloadable;
  final StringFilter? placement;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final UserListRelationFilter? users;
  final CommentRelationFilter? comment;
  final StringNullableFilter? commentId;
  final PaymentMethodListRelationFilter? paymentMethods;
  final ServiceListRelationFilter? services;
  final OrderListRelationFilter? orders;
  final BusinessListRelationFilter? businesses;
  final HelpStepRelationFilter? helpStep;
  final StringNullableFilter? helpStepId;
  final ReviewRelationFilter? reviews;
  final StringNullableFilter? reviewId;
  final StringNullableFilter? userId;
  final BusinessRelationFilter? business;
  final StringNullableFilter? businessId;
  final CategoryListRelationFilter? categories;

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

    if (users != null) {
      users!.getFilesVariables(
          field_name: '${field_name}_users', variables: variables);
    }

    if (comment != null) {
      comment!.getFilesVariables(
          field_name: '${field_name}_comment', variables: variables);
    }

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
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

    if (helpStepId != null) {
      helpStepId!.getFilesVariables(
          field_name: '${field_name}_helpStepId', variables: variables);
    }

    if (reviews != null) {
      reviews!.getFilesVariables(
          field_name: '${field_name}_reviews', variables: variables);
    }

    if (reviewId != null) {
      reviewId!.getFilesVariables(
          field_name: '${field_name}_reviewId', variables: variables);
    }

    if (userId != null) {
      userId!.getFilesVariables(
          field_name: '${field_name}_userId', variables: variables);
    }

    if (business != null) {
      business!.getFilesVariables(
          field_name: '${field_name}_business', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
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
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
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
      if (helpStepId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpStepId'),
          value:
              helpStepId!.toValueNode(field_name: '${field_name}_helpStepId'),
        ),
      if (reviews != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviews'),
          value: reviews!.toValueNode(field_name: '${field_name}_reviews'),
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
      if (business != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'business'),
          value: business!.toValueNode(field_name: '${field_name}_business'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        ),
      if (categories != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categories'),
          value:
              categories!.toValueNode(field_name: '${field_name}_categories'),
        )
    ]);
  }

  AttachmentWhereInput(
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
      this.users,
      this.comment,
      this.commentId,
      this.paymentMethods,
      this.services,
      this.orders,
      this.businesses,
      this.helpStep,
      this.helpStepId,
      this.reviews,
      this.reviewId,
      this.userId,
      this.business,
      this.businessId,
      this.categories});

  static AttachmentWhereInput fromJson(Map<dynamic, dynamic> json) {
    return AttachmentWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => AttachmentWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => AttachmentWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => AttachmentWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      path: json['path'] != null ? StringFilter.fromJson(json['path']) : null,
      filename: json['filename'] != null
          ? StringNullableFilter.fromJson(json['filename'])
          : null,
      mimetype: json['mimetype'] != null
          ? StringNullableFilter.fromJson(json['mimetype'])
          : null,
      encoding: json['encoding'] != null
          ? StringNullableFilter.fromJson(json['encoding'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      duration: json['duration'] != null
          ? IntFilter.fromJson(json['duration'])
          : null,
      size: json['size'] != null ? IntFilter.fromJson(json['size']) : null,
      attachmentType: json['attachmentType'] != null
          ? EnumAttachmentTypeFilter.fromJson(json['attachmentType'])
          : null,
      downloadable: json['downloadable'] != null
          ? BoolFilter.fromJson(json['downloadable'])
          : null,
      placement: json['placement'] != null
          ? StringFilter.fromJson(json['placement'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      users: json['users'] != null
          ? UserListRelationFilter.fromJson(json['users'])
          : null,
      comment: json['comment'] != null
          ? CommentRelationFilter.fromJson(json['comment'])
          : null,
      commentId: json['commentId'] != null
          ? StringNullableFilter.fromJson(json['commentId'])
          : null,
      paymentMethods: json['paymentMethods'] != null
          ? PaymentMethodListRelationFilter.fromJson(json['paymentMethods'])
          : null,
      services: json['services'] != null
          ? ServiceListRelationFilter.fromJson(json['services'])
          : null,
      orders: json['orders'] != null
          ? OrderListRelationFilter.fromJson(json['orders'])
          : null,
      businesses: json['businesses'] != null
          ? BusinessListRelationFilter.fromJson(json['businesses'])
          : null,
      helpStep: json['helpStep'] != null
          ? HelpStepRelationFilter.fromJson(json['helpStep'])
          : null,
      helpStepId: json['helpStepId'] != null
          ? StringNullableFilter.fromJson(json['helpStepId'])
          : null,
      reviews: json['reviews'] != null
          ? ReviewRelationFilter.fromJson(json['reviews'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringNullableFilter.fromJson(json['reviewId'])
          : null,
      userId: json['userId'] != null
          ? StringNullableFilter.fromJson(json['userId'])
          : null,
      business: json['business'] != null
          ? BusinessRelationFilter.fromJson(json['business'])
          : null,
      businessId: json['businessId'] != null
          ? StringNullableFilter.fromJson(json['businessId'])
          : null,
      categories: json['categories'] != null
          ? CategoryListRelationFilter.fromJson(json['categories'])
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
    if (users != null) _data['users'] = users!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (paymentMethods != null)
      _data['paymentMethods'] = paymentMethods!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (businesses != null) _data['businesses'] = businesses!.toJson();
    if (helpStep != null) _data['helpStep'] = helpStep!.toJson();
    if (helpStepId != null) _data['helpStepId'] = helpStepId!.toJson();
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    if (categories != null) _data['categories'] = categories!.toJson();
    return _data;
  }

  AttachmentWhereInput copyWith(
      {List<AttachmentWhereInput>? AND,
      List<AttachmentWhereInput>? OR,
      List<AttachmentWhereInput>? NOT,
      StringFilter? id,
      StringFilter? path,
      StringNullableFilter? filename,
      StringNullableFilter? mimetype,
      StringNullableFilter? encoding,
      EnumRecordStatusFilter? recordStatus,
      IntFilter? duration,
      IntFilter? size,
      EnumAttachmentTypeFilter? attachmentType,
      BoolFilter? downloadable,
      StringFilter? placement,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      UserListRelationFilter? users,
      CommentRelationFilter? comment,
      StringNullableFilter? commentId,
      PaymentMethodListRelationFilter? paymentMethods,
      ServiceListRelationFilter? services,
      OrderListRelationFilter? orders,
      BusinessListRelationFilter? businesses,
      HelpStepRelationFilter? helpStep,
      StringNullableFilter? helpStepId,
      ReviewRelationFilter? reviews,
      StringNullableFilter? reviewId,
      StringNullableFilter? userId,
      BusinessRelationFilter? business,
      StringNullableFilter? businessId,
      CategoryListRelationFilter? categories}) {
    return AttachmentWhereInput(
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
        users: users ?? this.users,
        comment: comment ?? this.comment,
        commentId: commentId ?? this.commentId,
        paymentMethods: paymentMethods ?? this.paymentMethods,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        businesses: businesses ?? this.businesses,
        helpStep: helpStep ?? this.helpStep,
        helpStepId: helpStepId ?? this.helpStepId,
        reviews: reviews ?? this.reviews,
        reviewId: reviewId ?? this.reviewId,
        userId: userId ?? this.userId,
        business: business ?? this.business,
        businessId: businessId ?? this.businessId,
        categories: categories ?? this.categories);
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
        users,
        comment,
        commentId,
        paymentMethods,
        services,
        orders,
        businesses,
        helpStep,
        helpStepId,
        reviews,
        reviewId,
        userId,
        business,
        businessId,
        categories
      ];
}
