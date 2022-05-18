import 'record_status.dart';
import 'user_create_nested_one_without_favorited_input.dart';
import 'favorite_record_type_create_nested_one_without_favorites_input.dart';
import 'user_create_nested_one_without_favorites_input.dart';
import 'comment_create_nested_one_without_favorites_input.dart';
import 'business_create_nested_one_without_favorites_input.dart';
import 'service_create_nested_one_without_favorites_input.dart';
import 'order_create_nested_one_without_favorites_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteCreateWithoutReviewInput extends Equatable {
  final String? id;
  final String favId;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedOneWithoutFavoritedInput author;
  final FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput type;
  final UserCreateNestedOneWithoutFavoritesInput? user;
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
      author.getFilesVariables(
          field_name: '${field_name}_author', variables: variables);
    }

    {
      type.getFilesVariables(
          field_name: '${field_name}_type', variables: variables);
    }

    if (user != null) {
      user!.getFilesVariables(
          field_name: '${field_name}_user', variables: variables);
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
        name: ast.NameNode(value: 'author'),
        value: author.toValueNode(field_name: '${field_name}_author'),
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

  FavoriteCreateWithoutReviewInput(
      {this.id,
      required this.favId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      required this.author,
      required this.type,
      this.user,
      this.comment,
      this.business,
      this.service,
      this.order});

  static FavoriteCreateWithoutReviewInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteCreateWithoutReviewInput(
      id: json['id'],
      favId: json['favId'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      author: UserCreateNestedOneWithoutFavoritedInput.fromJson(json['author']),
      type: FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput.fromJson(
          json['type']),
      user: json['user'] != null
          ? UserCreateNestedOneWithoutFavoritesInput.fromJson(json['user'])
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

    _data['author'] = author.toJson();

    _data['type'] = type.toJson();
    if (user != null) _data['user'] = user!.toJson();
    if (comment != null) _data['comment'] = comment!.toJson();
    if (business != null) _data['business'] = business!.toJson();
    if (service != null) _data['service'] = service!.toJson();
    if (order != null) _data['order'] = order!.toJson();
    return _data;
  }

  FavoriteCreateWithoutReviewInput copyWith(
      {String? id,
      String? favId,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedOneWithoutFavoritedInput? author,
      FavoriteRecordTypeCreateNestedOneWithoutFavoritesInput? type,
      UserCreateNestedOneWithoutFavoritesInput? user,
      CommentCreateNestedOneWithoutFavoritesInput? comment,
      BusinessCreateNestedOneWithoutFavoritesInput? business,
      ServiceCreateNestedOneWithoutFavoritesInput? service,
      OrderCreateNestedOneWithoutFavoritesInput? order}) {
    return FavoriteCreateWithoutReviewInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        author: author ?? this.author,
        type: type ?? this.type,
        user: user ?? this.user,
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
        author,
        type,
        user,
        comment,
        business,
        service,
        order
      ];
}
