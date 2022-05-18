import 'string_filter.dart';
import 'user_relation_filter.dart';
import 'favorite_record_type_relation_filter.dart';
import 'review_relation_filter.dart';
import 'comment_relation_filter.dart';
import 'business_relation_filter.dart';
import 'service_relation_filter.dart';
import 'order_relation_filter.dart';
import 'enum_record_status_filter.dart';
import 'date_time_filter.dart';
import 'string_nullable_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteWhereInput extends Equatable {
  final List<FavoriteWhereInput>? AND;
  final List<FavoriteWhereInput>? OR;
  final List<FavoriteWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? favId;
  final UserRelationFilter? author;
  final StringFilter? authorId;
  final FavoriteRecordTypeRelationFilter? type;
  final StringFilter? typeId;
  final UserRelationFilter? user;
  final ReviewRelationFilter? review;
  final CommentRelationFilter? comment;
  final BusinessRelationFilter? business;
  final ServiceRelationFilter? service;
  final OrderRelationFilter? order;
  final EnumRecordStatusFilter? recordStatus;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final StringNullableFilter? userId;
  final StringNullableFilter? reviewId;
  final StringNullableFilter? commentId;
  final StringNullableFilter? businessId;
  final StringNullableFilter? serviceId;
  final StringNullableFilter? orderId;

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

    if (favId != null) {
      favId!.getFilesVariables(
          field_name: '${field_name}_favId', variables: variables);
    }

    if (author != null) {
      author!.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
    }

    if (type != null) {
      type!.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (typeId != null) {
      typeId!.getFilesVariables(
          field_name: '${field_name}_typeId', variables: variables);
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

    if (order != null) {
      order!.getFilesVariables(
          field_name: '${field_name}_order', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
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

    if (reviewId != null) {
      reviewId!.getFilesVariables(
          field_name: '${field_name}_reviewId', variables: variables);
    }

    if (commentId != null) {
      commentId!.getFilesVariables(
          field_name: '${field_name}_commentId', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
    }

    if (serviceId != null) {
      serviceId!.getFilesVariables(
          field_name: '${field_name}_serviceId', variables: variables);
    }

    if (orderId != null) {
      orderId!.getFilesVariables(
          field_name: '${field_name}_orderId', variables: variables);
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
      if (favId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favId'),
          value: favId!.toValueNode(field_name: '${field_name}_favId'),
        ),
      if (author != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'author'),
          value: author!.toValueNode(field_name: '${field_name}_author'),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: type!.toValueNode(field_name: '${field_name}_type'),
        ),
      if (typeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'typeId'),
          value: typeId!.toValueNode(field_name: '${field_name}_typeId'),
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
        ),
      if (order != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'order'),
          value: order!.toValueNode(field_name: '${field_name}_order'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
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
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: reviewId!.toValueNode(field_name: '${field_name}_reviewId'),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: commentId!.toValueNode(field_name: '${field_name}_commentId'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: serviceId!.toValueNode(field_name: '${field_name}_serviceId'),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value: orderId!.toValueNode(field_name: '${field_name}_orderId'),
        )
    ]);
  }

  FavoriteWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.favId,
      this.author,
      this.authorId,
      this.type,
      this.typeId,
      this.user,
      this.review,
      this.comment,
      this.business,
      this.service,
      this.order,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId});

  static FavoriteWhereInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => FavoriteWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => FavoriteWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => FavoriteWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      favId:
          json['favId'] != null ? StringFilter.fromJson(json['favId']) : null,
      author: json['author'] != null
          ? UserRelationFilter.fromJson(json['author'])
          : null,
      authorId: json['authorId'] != null
          ? StringFilter.fromJson(json['authorId'])
          : null,
      type: json['type'] != null
          ? FavoriteRecordTypeRelationFilter.fromJson(json['type'])
          : null,
      typeId:
          json['typeId'] != null ? StringFilter.fromJson(json['typeId']) : null,
      user: json['user'] != null
          ? UserRelationFilter.fromJson(json['user'])
          : null,
      review: json['review'] != null
          ? ReviewRelationFilter.fromJson(json['review'])
          : null,
      comment: json['comment'] != null
          ? CommentRelationFilter.fromJson(json['comment'])
          : null,
      business: json['business'] != null
          ? BusinessRelationFilter.fromJson(json['business'])
          : null,
      service: json['service'] != null
          ? ServiceRelationFilter.fromJson(json['service'])
          : null,
      order: json['order'] != null
          ? OrderRelationFilter.fromJson(json['order'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      userId: json['userId'] != null
          ? StringNullableFilter.fromJson(json['userId'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringNullableFilter.fromJson(json['reviewId'])
          : null,
      commentId: json['commentId'] != null
          ? StringNullableFilter.fromJson(json['commentId'])
          : null,
      businessId: json['businessId'] != null
          ? StringNullableFilter.fromJson(json['businessId'])
          : null,
      serviceId: json['serviceId'] != null
          ? StringNullableFilter.fromJson(json['serviceId'])
          : null,
      orderId: json['orderId'] != null
          ? StringNullableFilter.fromJson(json['orderId'])
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
    if (favId != null) _data['favId'] = favId!.toJson();
    if (author != null) _data['author'] = author!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (type != null) _data['type'] = type!.toJson();
    if (typeId != null) _data['typeId'] = typeId!.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (userId != null) _data['userId'] = userId!.toJson();
    if (reviewId != null) _data['reviewId'] = reviewId!.toJson();
    if (commentId != null) _data['commentId'] = commentId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    if (serviceId != null) _data['serviceId'] = serviceId!.toJson();
    if (orderId != null) _data['orderId'] = orderId!.toJson();
    return _data;
  }

  FavoriteWhereInput copyWith(
      {List<FavoriteWhereInput>? AND,
      List<FavoriteWhereInput>? OR,
      List<FavoriteWhereInput>? NOT,
      StringFilter? id,
      StringFilter? favId,
      UserRelationFilter? author,
      StringFilter? authorId,
      FavoriteRecordTypeRelationFilter? type,
      StringFilter? typeId,
      UserRelationFilter? user,
      ReviewRelationFilter? review,
      CommentRelationFilter? comment,
      BusinessRelationFilter? business,
      ServiceRelationFilter? service,
      OrderRelationFilter? order,
      EnumRecordStatusFilter? recordStatus,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      StringNullableFilter? userId,
      StringNullableFilter? reviewId,
      StringNullableFilter? commentId,
      StringNullableFilter? businessId,
      StringNullableFilter? serviceId,
      StringNullableFilter? orderId}) {
    return FavoriteWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        favId: favId ?? this.favId,
        author: author ?? this.author,
        authorId: authorId ?? this.authorId,
        type: type ?? this.type,
        typeId: typeId ?? this.typeId,
        user: user ?? this.user,
        review: review ?? this.review,
        comment: comment ?? this.comment,
        business: business ?? this.business,
        service: service ?? this.service,
        order: order ?? this.order,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userId: userId ?? this.userId,
        reviewId: reviewId ?? this.reviewId,
        commentId: commentId ?? this.commentId,
        businessId: businessId ?? this.businessId,
        serviceId: serviceId ?? this.serviceId,
        orderId: orderId ?? this.orderId);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        favId,
        author,
        authorId,
        type,
        typeId,
        user,
        review,
        comment,
        business,
        service,
        order,
        recordStatus,
        createdAt,
        updatedAt,
        userId,
        reviewId,
        commentId,
        businessId,
        serviceId,
        orderId
      ];
}
