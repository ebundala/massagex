import 'string_with_aggregates_filter.dart';
import 'int_with_aggregates_filter.dart';
import 'string_nullable_with_aggregates_filter.dart';
import 'enum_record_status_with_aggregates_filter.dart';
import 'date_time_with_aggregates_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewScalarWhereWithAggregatesInput extends Equatable {
  final List<ReviewScalarWhereWithAggregatesInput>? AND;
  final List<ReviewScalarWhereWithAggregatesInput>? OR;
  final List<ReviewScalarWhereWithAggregatesInput>? NOT;
  final StringWithAggregatesFilter? id;
  final StringWithAggregatesFilter? authorId;
  final StringWithAggregatesFilter? revieweeId;
  final IntWithAggregatesFilter? value;
  final StringNullableWithAggregatesFilter? content;
  final EnumRecordStatusWithAggregatesFilter? recordStatus;
  final DateTimeWithAggregatesFilter? createdAt;
  final DateTimeWithAggregatesFilter? updatedAt;

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

    if (authorId != null) {
      authorId!.getFilesVariables(
          field_name: '${field_name}_authorId', variables: variables);
    }

    if (revieweeId != null) {
      revieweeId!.getFilesVariables(
          field_name: '${field_name}_revieweeId', variables: variables);
    }

    if (value != null) {
      value!.getFilesVariables(
          field_name: '${field_name}_value', variables: variables);
    }

    if (content != null) {
      content!.getFilesVariables(
          field_name: '${field_name}_content', variables: variables);
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
      if (authorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'authorId'),
          value: authorId!.toValueNode(field_name: '${field_name}_authorId'),
        ),
      if (revieweeId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'revieweeId'),
          value:
              revieweeId!.toValueNode(field_name: '${field_name}_revieweeId'),
        ),
      if (value != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'value'),
          value: value!.toValueNode(field_name: '${field_name}_value'),
        ),
      if (content != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'content'),
          value: content!.toValueNode(field_name: '${field_name}_content'),
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
        )
    ]);
  }

  ReviewScalarWhereWithAggregatesInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.authorId,
      this.revieweeId,
      this.value,
      this.content,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static ReviewScalarWhereWithAggregatesInput fromJson(
      Map<dynamic, dynamic> json) {
    return ReviewScalarWhereWithAggregatesInput(
      AND: json['AND'] != null
          ? List.generate(
              json['AND'].length,
              (index) => ReviewScalarWhereWithAggregatesInput.fromJson(
                  json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(
              json['OR'].length,
              (index) => ReviewScalarWhereWithAggregatesInput.fromJson(
                  json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(
              json['NOT'].length,
              (index) => ReviewScalarWhereWithAggregatesInput.fromJson(
                  json['NOT'][index]))
          : null,
      id: json['id'] != null
          ? StringWithAggregatesFilter.fromJson(json['id'])
          : null,
      authorId: json['authorId'] != null
          ? StringWithAggregatesFilter.fromJson(json['authorId'])
          : null,
      revieweeId: json['revieweeId'] != null
          ? StringWithAggregatesFilter.fromJson(json['revieweeId'])
          : null,
      value: json['value'] != null
          ? IntWithAggregatesFilter.fromJson(json['value'])
          : null,
      content: json['content'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['content'])
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
    if (authorId != null) _data['authorId'] = authorId!.toJson();
    if (revieweeId != null) _data['revieweeId'] = revieweeId!.toJson();
    if (value != null) _data['value'] = value!.toJson();
    if (content != null) _data['content'] = content!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  ReviewScalarWhereWithAggregatesInput copyWith(
      {List<ReviewScalarWhereWithAggregatesInput>? AND,
      List<ReviewScalarWhereWithAggregatesInput>? OR,
      List<ReviewScalarWhereWithAggregatesInput>? NOT,
      StringWithAggregatesFilter? id,
      StringWithAggregatesFilter? authorId,
      StringWithAggregatesFilter? revieweeId,
      IntWithAggregatesFilter? value,
      StringNullableWithAggregatesFilter? content,
      EnumRecordStatusWithAggregatesFilter? recordStatus,
      DateTimeWithAggregatesFilter? createdAt,
      DateTimeWithAggregatesFilter? updatedAt}) {
    return ReviewScalarWhereWithAggregatesInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        authorId: authorId ?? this.authorId,
        revieweeId: revieweeId ?? this.revieweeId,
        value: value ?? this.value,
        content: content ?? this.content,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        authorId,
        revieweeId,
        value,
        content,
        recordStatus,
        createdAt,
        updatedAt
      ];
}
