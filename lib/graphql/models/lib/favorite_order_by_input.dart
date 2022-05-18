import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? favId;
  final SortOrder? authorId;
  final SortOrder? typeId;
  final SortOrder? recordStatus;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;
  final SortOrder? userId;
  final SortOrder? reviewId;
  final SortOrder? commentId;
  final SortOrder? businessId;
  final SortOrder? serviceId;
  final SortOrder? orderId;

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
      if (favId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: favId!.toJson())),
        ),
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: authorId!.toJson())),
        ),
      if (typeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'typeId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: typeId!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
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
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: userId!.toJson())),
        ),
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: reviewId!.toJson())),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: commentId!.toJson())),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: businessId!.toJson())),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: serviceId!.toJson())),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: orderId!.toJson())),
        )
    ]);
  }

  FavoriteOrderByInput(
      {this.id,
      this.favId,
      this.authorId,
      this.typeId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId});

  static FavoriteOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      favId:
          json['favId'] != null ? SortOrderExt.fromJson(json['favId']) : null,
      authorId: json['authorId'] != null
          ? SortOrderExt.fromJson(json['authorId'])
          : null,
      typeId:
          json['typeId'] != null ? SortOrderExt.fromJson(json['typeId']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
      userId:
          json['userId'] != null ? SortOrderExt.fromJson(json['userId']) : null,
      reviewId: json['reviewId'] != null
          ? SortOrderExt.fromJson(json['reviewId'])
          : null,
      commentId: json['commentId'] != null
          ? SortOrderExt.fromJson(json['commentId'])
          : null,
      businessId: json['businessId'] != null
          ? SortOrderExt.fromJson(json['businessId'])
          : null,
      serviceId: json['serviceId'] != null
          ? SortOrderExt.fromJson(json['serviceId'])
          : null,
      orderId: json['orderId'] != null
          ? SortOrderExt.fromJson(json['orderId'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (favId != null) _data['favId'] = favId!.toJson();
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (typeId != null) _data['typeId'] = typeId!.toJson();
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

  FavoriteOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? favId,
      SortOrder? authorId,
      SortOrder? typeId,
      SortOrder? recordStatus,
      SortOrder? createdAt,
      SortOrder? updatedAt,
      SortOrder? userId,
      SortOrder? reviewId,
      SortOrder? commentId,
      SortOrder? businessId,
      SortOrder? serviceId,
      SortOrder? orderId}) {
    return FavoriteOrderByInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
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
        id,
        favId,
        authorId,
        typeId,
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
