import 'record_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteUncheckedCreateWithoutUserInput extends Equatable {
  final String? id;
  final String favId;
  final String authorId;
  final String typeId;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? reviewId;
  final String? commentId;
  final String? businessId;
  final String? serviceId;
  final String? orderId;

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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'favId'),
        value: ast.StringValueNode(value: '${favId}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'authorId'),
        value: ast.StringValueNode(value: '${authorId}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'typeId'),
        value: ast.StringValueNode(value: '${typeId}', isBlock: false),
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
      if (reviewId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewId'),
          value: ast.StringValueNode(value: '${reviewId!}', isBlock: false),
        ),
      if (commentId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'commentId'),
          value: ast.StringValueNode(value: '${commentId!}', isBlock: false),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value: ast.StringValueNode(value: '${businessId!}', isBlock: false),
        ),
      if (serviceId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'serviceId'),
          value: ast.StringValueNode(value: '${serviceId!}', isBlock: false),
        ),
      if (orderId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orderId'),
          value: ast.StringValueNode(value: '${orderId!}', isBlock: false),
        )
    ]);
  }

  FavoriteUncheckedCreateWithoutUserInput(
      {this.id,
      required this.favId,
      required this.authorId,
      required this.typeId,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.reviewId,
      this.commentId,
      this.businessId,
      this.serviceId,
      this.orderId});

  static FavoriteUncheckedCreateWithoutUserInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteUncheckedCreateWithoutUserInput(
      id: json['id'],
      favId: json['favId'],
      authorId: json['authorId'],
      typeId: json['typeId'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      reviewId: json['reviewId'],
      commentId: json['commentId'],
      businessId: json['businessId'],
      serviceId: json['serviceId'],
      orderId: json['orderId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['favId'] = favId;

    _data['authorId'] = authorId;

    _data['typeId'] = typeId;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (reviewId != null) _data['reviewId'] = reviewId;
    if (commentId != null) _data['commentId'] = commentId;
    if (businessId != null) _data['businessId'] = businessId;
    if (serviceId != null) _data['serviceId'] = serviceId;
    if (orderId != null) _data['orderId'] = orderId;
    return _data;
  }

  FavoriteUncheckedCreateWithoutUserInput copyWith(
      {String? id,
      String? favId,
      String? authorId,
      String? typeId,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? reviewId,
      String? commentId,
      String? businessId,
      String? serviceId,
      String? orderId}) {
    return FavoriteUncheckedCreateWithoutUserInput(
        id: id ?? this.id,
        favId: favId ?? this.favId,
        authorId: authorId ?? this.authorId,
        typeId: typeId ?? this.typeId,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
        reviewId,
        commentId,
        businessId,
        serviceId,
        orderId
      ];
}
