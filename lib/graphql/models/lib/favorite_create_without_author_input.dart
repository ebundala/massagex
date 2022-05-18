import 'record_status.dart';
import 'favorite_record_type_create_nested_one_without_favorites_input.dart';
import 'user_create_nested_one_without_favorites_input.dart';
import 'review_create_nested_one_without_favorites_input.dart';
import 'comment_create_nested_one_without_favorites_input.dart';
import 'business_create_nested_one_without_favorites_input.dart';
import 'service_create_nested_one_without_favorites_input.dart';
import 'order_create_nested_one_without_favorites_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteCreateWithoutAuthorInput extends Equatable {
  final String? id;
  final String favId;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput type;
  final UserCreateNestedOneWithoutFavoritesInput? user;
  final ReviewCreateNestedOneWithoutFavoritesInput? review;
  final CommentCreateNestedOneWithoutFavoritesInput? comment;
  final BusinessCreateNestedOneWithoutFavoritesInput? business;
  final ServiceCreateNestedOneWithoutFavoritesInput? service;
  final OrderCreateNestedOneWithoutFavoritesInput? order;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      type.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'favId'),
        value: ast.StringValueNode(value: '${favId}', isBlock: false),
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
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'type'),
        value: type.toValueNode(field_name: '${field_name}_type'),
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
        )
    ]);
  }

  FavoriteCreateWithoutAuthorInput(
      {this.id,
      required this.favId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      required this.type,
      this.user,
      this.review,
      this.comment,
      this.business,
      this.service,
      this.order});

  static FavoriteCreateWithoutAuthorInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteCreateWithoutAuthorInput(
      id: json['id'],
      favId: json['favId'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      type: FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput.fromJson(
          json['type']),
      user: json['user'] != null
          ? UserCreateNestedOneWithoutFavoritesInput.fromJson(json['user'])
          : null,
      review: json['review'] != null
          ? ReviewCreateNestedOneWithoutFavoritesInput.fromJson(json['review'])
          : null,
      comment: json['comment'] != null
          ? CommentCreateNestedOneWithoutFavoritesInput.fromJson(
              json['comment'])
          : null,
      business: json['business'] != null
          ? BusinessCreateNestedOneWithoutFavoritesInput.fromJson(
              json['business'])
          : null,
      service: json['service'] != null
          ? ServiceCreateNestedOneWithoutFavoritesInput.fromJson(
              json['service'])
          : null,
      order: json['order'] != null
          ? OrderCreateNestedOneWithoutFavoritesInput.fromJson(json['order'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['favId'] = favId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();

    _data['type'] = type.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (review != null) _data['review'] = review!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    return _data;
  }

  FavoriteCreateWithoutAuthorInput copyWith(
      {String? id,
      String? favId,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput? type,
      UserCreateNestedOneWithoutFavoritesInput? user,
      ReviewCreateNestedOneWithoutFavoritesInput? review,
      CommentCreateNestedOneWithoutFavoritesInput? comment,
      BusinessCreateNestedOneWithoutFavoritesInput? business,
      ServiceCreateNestedOneWithoutFavoritesInput? service,
      OrderCreateNestedOneWithoutFavoritesInput? order}) {
    return FavoriteCreateWithoutAuthorInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        type: type ?? this.type,
        user: user ?? this.user,
        review: review ?? this.review,
        comment: comment ?? this.comment,
        business: business ?? this.business,
        service: service ?? this.service,
        order: order ?? this.order);
  }

  List<Object?> get props => [
        id,
        favId,
        recordStatus,
        createdAt,
        updatedAt,
        type,
        user,
        review,
        comment,
        business,
        service,
        order
      ];
}
