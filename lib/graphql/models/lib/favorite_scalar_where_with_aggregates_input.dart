import 'string_with_aggregates_filter.dart';
import 'enum_record_status_with_aggregates_filter.dart';
import 'date_time_with_aggregates_filter.dart';
import 'string_nullable_with_aggregates_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteScalarWhereWithAggregatesInput extends Equatable {
  final List<FavoriteScalarWhereWithAggregatesInput>? AND;
  final List<FavoriteScalarWhereWithAggregatesInput>? OR;
  final List<FavoriteScalarWhereWithAggregatesInput>? NOT;
  final StringWithAggregatesFilter? id;
  final StringWithAggregatesFilter? favId;
  final StringWithAggregatesFilter? authorId;
  final StringWithAggregatesFilter? typeId;
  final EnumRecordStatusWithAggregatesFilter? recordStatus;
  final DateTimeWithAggregatesFilter? createdAt;
  final DateTimeWithAggregatesFilter? updatedAt;
  final StringNullableWithAggregatesFilter? userId;
  final StringNullableWithAggregatesFilter? reviewId;
  final StringNullableWithAggregatesFilter? commentId;
  final StringNullableWithAggregatesFilter? businessId;
  final StringNullableWithAggregatesFilter? serviceId;
  final StringNullableWithAggregatesFilter? orderId;

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

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
    }

    if (typeId != null) {
      typeId!.getFilesVariables(
          field_name: '${field_name}_typeId', variables: variables);
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
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
        ),
      if (typeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'typeId'),
          value: typeId!.toValueNode(field_name: '${field_name}_typeId'),
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

  FavoriteScalarWhereWithAggregatesInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
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

  static FavoriteScalarWhereWithAggregatesInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteScalarWhereWithAggregatesInput(
      AND: json['AND'] != null
          ? List.generate(
              json['AND'].length,
              (index) => FavoriteScalarWhereWithAggregatesInput.fromJson(
                  json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(
              json['OR'].length,
              (index) => FavoriteScalarWhereWithAggregatesInput.fromJson(
                  json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(
              json['NOT'].length,
              (index) => FavoriteScalarWhereWithAggregatesInput.fromJson(
                  json['NOT'][index]))
          : null,
      id: json['id'] != null
          ? StringWithAggregatesFilter.fromJson(json['id'])
          : null,
      favId: json['favId'] != null
          ? StringWithAggregatesFilter.fromJson(json['favId'])
          : null,
      authorId: json['authorId'] != null
          ? StringWithAggregatesFilter.fromJson(json['authorId'])
          : null,
      typeId: json['typeId'] != null
          ? StringWithAggregatesFilter.fromJson(json['typeId'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusWithAggregatesFilter.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeWithAggregatesFilter.fromJson(json['updatedAt'])
          : null,
      userId: json['userId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['userId'])
          : null,
      reviewId: json['reviewId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['reviewId'])
          : null,
      commentId: json['commentId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['commentId'])
          : null,
      businessId: json['businessId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['businessId'])
          : null,
      serviceId: json['serviceId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['serviceId'])
          : null,
      orderId: json['orderId'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['orderId'])
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

  FavoriteScalarWhereWithAggregatesInput copyWith(
      {List<FavoriteScalarWhereWithAggregatesInput>? AND,
      List<FavoriteScalarWhereWithAggregatesInput>? OR,
      List<FavoriteScalarWhereWithAggregatesInput>? NOT,
      StringWithAggregatesFilter? id,
      StringWithAggregatesFilter? favId,
      StringWithAggregatesFilter? authorId,
      StringWithAggregatesFilter? typeId,
      EnumRecordStatusWithAggregatesFilter? recordStatus,
      DateTimeWithAggregatesFilter? createdAt,
      DateTimeWithAggregatesFilter? updatedAt,
      StringNullableWithAggregatesFilter? userId,
      StringNullableWithAggregatesFilter? reviewId,
      StringNullableWithAggregatesFilter? commentId,
      StringNullableWithAggregatesFilter? businessId,
      StringNullableWithAggregatesFilter? serviceId,
      StringNullableWithAggregatesFilter? orderId}) {
    return FavoriteScalarWhereWithAggregatesInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
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
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
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
