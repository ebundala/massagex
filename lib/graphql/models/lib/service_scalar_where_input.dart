import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'float_filter.dart';
import 'json_nullable_filter.dart';
import 'enum_record_status_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceScalarWhereInput extends Equatable {
  final List<ServiceScalarWhereInput>? AND;
  final List<ServiceScalarWhereInput>? OR;
  final List<ServiceScalarWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? name;
  final StringNullableFilter? description;
  final FloatFilter? price;
  final JsonNullableFilter? metadata;
  final StringFilter? currency;
  final EnumRecordStatusFilter? recordStatus;
  final StringNullableFilter? categoryId;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final StringNullableFilter? imageId;
  final StringFilter? businessId;

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

    if (name != null) {
      name!.getFilesVariables(
          field_name: '${field_name}_name', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (price != null) {
      price!.getFilesVariables(
          field_name: '${field_name}_price', variables: variables);
    }

    if (metadata != null) {
      metadata!.getFilesVariables(
          field_name: '${field_name}_metadata', variables: variables);
    }

    if (currency != null) {
      currency!.getFilesVariables(
          field_name: '${field_name}_currency', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (categoryId != null) {
      categoryId!.getFilesVariables(
          field_name: '${field_name}_categoryId', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (imageId != null) {
      imageId!.getFilesVariables(
          field_name: '${field_name}_imageId', variables: variables);
    }

    if (businessId != null) {
      businessId!.getFilesVariables(
          field_name: '${field_name}_businessId', variables: variables);
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
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: name!.toValueNode(field_name: '${field_name}_name'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (price != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'price'),
          value: price!.toValueNode(field_name: '${field_name}_price'),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'currency'),
          value: currency!.toValueNode(field_name: '${field_name}_currency'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (categoryId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'categoryId'),
          value:
              categoryId!.toValueNode(field_name: '${field_name}_categoryId'),
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
      if (imageId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'imageId'),
          value: imageId!.toValueNode(field_name: '${field_name}_imageId'),
        ),
      if (businessId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessId'),
          value:
              businessId!.toValueNode(field_name: '${field_name}_businessId'),
        )
    ]);
  }

  ServiceScalarWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.name,
      this.description,
      this.price,
      this.metadata,
      this.currency,
      this.recordStatus,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.imageId,
      this.businessId});

  static ServiceScalarWhereInput fromJson(Map<dynamic, dynamic> json) {
    return ServiceScalarWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => ServiceScalarWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => ServiceScalarWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => ServiceScalarWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      name: json['name'] != null ? StringFilter.fromJson(json['name']) : null,
      description: json['description'] != null
          ? StringNullableFilter.fromJson(json['description'])
          : null,
      price: json['price'] != null ? FloatFilter.fromJson(json['price']) : null,
      metadata: json['metadata'] != null
          ? JsonNullableFilter.fromJson(json['metadata'])
          : null,
      currency: json['currency'] != null
          ? StringFilter.fromJson(json['currency'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      categoryId: json['categoryId'] != null
          ? StringNullableFilter.fromJson(json['categoryId'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      imageId: json['imageId'] != null
          ? StringNullableFilter.fromJson(json['imageId'])
          : null,
      businessId: json['businessId'] != null
          ? StringFilter.fromJson(json['businessId'])
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
    if (name != null) _data['name'] = name!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (price != null) _data['price'] = price!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (currency != null) _data['currency'] = currency!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (categoryId != null) _data['categoryId'] = categoryId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (imageId != null) _data['imageId'] = imageId!.toJson();
    if (businessId != null) _data['businessId'] = businessId!.toJson();
    return _data;
  }

  ServiceScalarWhereInput copyWith(
      {List<ServiceScalarWhereInput>? AND,
      List<ServiceScalarWhereInput>? OR,
      List<ServiceScalarWhereInput>? NOT,
      StringFilter? id,
      StringFilter? name,
      StringNullableFilter? description,
      FloatFilter? price,
      JsonNullableFilter? metadata,
      StringFilter? currency,
      EnumRecordStatusFilter? recordStatus,
      StringNullableFilter? categoryId,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      StringNullableFilter? imageId,
      StringFilter? businessId}) {
    return ServiceScalarWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        metadata: metadata ?? this.metadata,
        currency: currency ?? this.currency,
        recordStatus: recordStatus ?? this.recordStatus,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        imageId: imageId ?? this.imageId,
        businessId: businessId ?? this.businessId);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        name,
        description,
        price,
        metadata,
        currency,
        recordStatus,
        categoryId,
        createdAt,
        updatedAt,
        imageId,
        businessId
      ];
}
