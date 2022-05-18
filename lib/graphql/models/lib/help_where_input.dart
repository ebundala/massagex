import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'help_step_list_relation_filter.dart';
import 'enum_record_status_filter.dart';
import 'enum_role_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpWhereInput extends Equatable {
  final List<HelpWhereInput>? AND;
  final List<HelpWhereInput>? OR;
  final List<HelpWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? topic;
  final StringNullableFilter? description;
  final HelpStepListRelationFilter? steps;
  final EnumRecordStatusFilter? recordStatus;
  final EnumRoleFilter? audience;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;

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

    if (topic != null) {
      topic!.getFilesVariables(
          field_name: '${field_name}_topic', variables: variables);
    }

    if (description != null) {
      description!.getFilesVariables(
          field_name: '${field_name}_description', variables: variables);
    }

    if (steps != null) {
      steps!.getFilesVariables(
          field_name: '${field_name}_steps', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (audience != null) {
      audience!.getFilesVariables(
          field_name: '${field_name}_audience', variables: variables);
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
      if (topic != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'topic'),
          value: topic!.toValueNode(field_name: '${field_name}_topic'),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value:
              description!.toValueNode(field_name: '${field_name}_description'),
        ),
      if (steps != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'steps'),
          value: steps!.toValueNode(field_name: '${field_name}_steps'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (audience != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'audience'),
          value: audience!.toValueNode(field_name: '${field_name}_audience'),
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

  HelpWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.topic,
      this.description,
      this.steps,
      this.recordStatus,
      this.audience,
      this.createdAt,
      this.updatedAt});

  static HelpWhereInput fromJson(Map<dynamic, dynamic> json) {
    return HelpWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => HelpWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => HelpWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => HelpWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      topic:
          json['topic'] != null ? StringFilter.fromJson(json['topic']) : null,
      description: json['description'] != null
          ? StringNullableFilter.fromJson(json['description'])
          : null,
      steps: json['steps'] != null
          ? HelpStepListRelationFilter.fromJson(json['steps'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      audience: json['audience'] != null
          ? EnumRoleFilter.fromJson(json['audience'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
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
    if (topic != null) _data['topic'] = topic!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (steps != null) _data['steps'] = steps!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (audience != null) _data['audience'] = audience!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  HelpWhereInput copyWith(
      {List<HelpWhereInput>? AND,
      List<HelpWhereInput>? OR,
      List<HelpWhereInput>? NOT,
      StringFilter? id,
      StringFilter? topic,
      StringNullableFilter? description,
      HelpStepListRelationFilter? steps,
      EnumRecordStatusFilter? recordStatus,
      EnumRoleFilter? audience,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return HelpWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        topic: topic ?? this.topic,
        description: description ?? this.description,
        steps: steps ?? this.steps,
        recordStatus: recordStatus ?? this.recordStatus,
        audience: audience ?? this.audience,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        topic,
        description,
        steps,
        recordStatus,
        audience,
        createdAt,
        updatedAt
      ];
}
