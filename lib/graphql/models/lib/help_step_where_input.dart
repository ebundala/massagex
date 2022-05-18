import 'string_filter.dart';
import 'int_filter.dart';
import 'string_nullable_filter.dart';
import 'enum_record_status_filter.dart';
import 'attachment_list_relation_filter.dart';
import 'help_relation_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepWhereInput extends Equatable {
  final List<HelpStepWhereInput>? AND;
  final List<HelpStepWhereInput>? OR;
  final List<HelpStepWhereInput>? NOT;
  final StringFilter? id;
  final IntFilter? stepNumber;
  final StringFilter? title;
  final StringNullableFilter? description;
  final EnumRecordStatusFilter? recordStatus;
  final AttachmentListRelationFilter? attachments;
  final HelpRelationFilter? help;
  final StringFilter? helpId;
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

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (help != null) {
      help!.getFilesVariables(
          field_name: '${field_name}_help', variables: variables);
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
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
        ),
      if (help != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'help'),
          value: help!.toValueNode(field_name: '${field_name}_help'),
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

  HelpStepWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.attachments,
      this.help,
      this.helpId,
      this.createdAt,
      this.updatedAt});

  static HelpStepWhereInput fromJson(Map<dynamic, dynamic> json) {
    return HelpStepWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => HelpStepWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => HelpStepWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => HelpStepWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      stepNumber: json['stepNumber'] != null
          ? IntFilter.fromJson(json['stepNumber'])
          : null,
      title:
          json['title'] != null ? StringFilter.fromJson(json['title']) : null,
      description: json['description'] != null
          ? StringNullableFilter.fromJson(json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentListRelationFilter.fromJson(json['attachments'])
          : null,
      help: json['help'] != null
          ? HelpRelationFilter.fromJson(json['help'])
          : null,
      helpId:
          json['helpId'] != null ? StringFilter.fromJson(json['helpId']) : null,
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
    if (stepNumber != null) _data['stepNumber'] = stepNumber!.toJson();
    if (title != null) _data['title'] = title!.toJson();
    if (description != null) _data['description'] = description!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (help != null) _data['help'] = help!.toJson();
    if (helpId != null) _data['helpId'] = helpId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  HelpStepWhereInput copyWith(
      {List<HelpStepWhereInput>? AND,
      List<HelpStepWhereInput>? OR,
      List<HelpStepWhereInput>? NOT,
      StringFilter? id,
      IntFilter? stepNumber,
      StringFilter? title,
      StringNullableFilter? description,
      EnumRecordStatusFilter? recordStatus,
      AttachmentListRelationFilter? attachments,
      HelpRelationFilter? help,
      StringFilter? helpId,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return HelpStepWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        attachments: attachments ?? this.attachments,
        help: help ?? this.help,
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
        attachments,
        help,
        helpId,
        createdAt,
        updatedAt
      ];
}
