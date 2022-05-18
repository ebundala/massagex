import 'string_with_aggregates_filter.dart';
import 'int_with_aggregates_filter.dart';
import 'string_nullable_with_aggregates_filter.dart';
import 'enum_record_status_with_aggregates_filter.dart';
import 'date_time_with_aggregates_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepScalarWhereWithAggregatesInput extends Equatable {
  final List<HelpStepScalarWhereWithAggregatesInput>? AND;
  final List<HelpStepScalarWhereWithAggregatesInput>? OR;
  final List<HelpStepScalarWhereWithAggregatesInput>? NOT;
  final StringWithAggregatesFilter? id;
  final IntWithAggregatesFilter? stepNumber;
  final StringWithAggregatesFilter? title;
  final StringNullableWithAggregatesFilter? description;
  final EnumRecordStatusWithAggregatesFilter? recordStatus;
  final StringWithAggregatesFilter? helpId;
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

    if (stepNumber != null) {
      stepNumber!.getFilesVariables(
          field_name: '${field_name}_stepNumber', variables: variables);
    }

    if (title != null) {
      title!.getFilesVariables(
          field_name: '${field_name}_title', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (helpId != null) {
      helpId!.getFilesVariables(
          field_name: '${field_name}_helpId', variables: variables);
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
      if (stepNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'stepNumber'),
          value:
              stepNumber!.toValueNode(field_name: '${field_name}_stepNumber'),
        ),
      if (title != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'title'),
          value: title!.toValueNode(field_name: '${field_name}_title'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (helpId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpId'),
          value: helpId!.toValueNode(field_name: '${field_name}_helpId'),
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

  HelpStepScalarWhereWithAggregatesInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.helpId,
      this.createdAt,
      this.updatedAt});

  static HelpStepScalarWhereWithAggregatesInput fromJson(
      Map<dynamic, dynamic> json) {
    return HelpStepScalarWhereWithAggregatesInput(
      AND: json['AND'] != null
          ? List.generate(
              json['AND'].length,
              (index) => HelpStepScalarWhereWithAggregatesInput.fromJson(
                  json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(
              json['OR'].length,
              (index) => HelpStepScalarWhereWithAggregatesInput.fromJson(
                  json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(
              json['NOT'].length,
              (index) => HelpStepScalarWhereWithAggregatesInput.fromJson(
                  json['NOT'][index]))
          : null,
      id: json['id'] != null
          ? StringWithAggregatesFilter.fromJson(json['id'])
          : null,
      stepNumber: json['stepNumber'] != null
          ? IntWithAggregatesFilter.fromJson(json['stepNumber'])
          : null,
      title: json['title'] != null
          ? StringWithAggregatesFilter.fromJson(json['title'])
          : null,
      description: json['description'] != null
          ? StringNullableWithAggregatesFilter.fromJson(json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusWithAggregatesFilter.fromJson(json['recordStatus'])
          : null,
      helpId: json['helpId'] != null
          ? StringWithAggregatesFilter.fromJson(json['helpId'])
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
    if (stepNumber != null) _data['stepNumber'] = stepNumber!.toJson();
    if (title != null) _data['title'] = title!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (helpId != null) _data['helpId'] = helpId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  HelpStepScalarWhereWithAggregatesInput copyWith(
      {List<HelpStepScalarWhereWithAggregatesInput>? AND,
      List<HelpStepScalarWhereWithAggregatesInput>? OR,
      List<HelpStepScalarWhereWithAggregatesInput>? NOT,
      StringWithAggregatesFilter? id,
      IntWithAggregatesFilter? stepNumber,
      StringWithAggregatesFilter? title,
      StringNullableWithAggregatesFilter? description,
      EnumRecordStatusWithAggregatesFilter? recordStatus,
      StringWithAggregatesFilter? helpId,
      DateTimeWithAggregatesFilter? createdAt,
      DateTimeWithAggregatesFilter? updatedAt}) {
    return HelpStepScalarWhereWithAggregatesInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        helpId: helpId ?? this.helpId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        stepNumber,
        title,
        description,
        recordStatus,
        helpId,
        createdAt,
        updatedAt
      ];
}
