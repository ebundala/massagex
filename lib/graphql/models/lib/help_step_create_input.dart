import 'record_status.dart';
import 'attachment_create_nested_many_without_help_step_input.dart';
import 'help_create_nested_one_without_steps_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepCreateInput extends Equatable {
  final String? id;
  final int stepNumber;
  final String title;
  final String? description;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AttachmentCreateNestedManyWithoutHelpStepInput? attachments;
  final HelpCreateNestedOneWithoutStepsInput help;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    {
      help.getFilesVariables(
          field_name: '${field_name}_help', variables: variables);
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
        name: ast.NameNode(value: 'stepNumber'),
        value: ast.IntValueNode(value: '${stepNumber}'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'title'),
        value: ast.StringValueNode(value: '${title}', isBlock: false),
      ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.StringValueNode(value: '${description!}', isBlock: false),
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
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'help'),
        value: help.toValueNode(field_name: '${field_name}_help'),
      )
    ]);
  }

  HelpStepCreateInput(
      {this.id,
      required this.stepNumber,
      required this.title,
      this.description,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.attachments,
      required this.help});

  static HelpStepCreateInput fromJson(Map<dynamic, dynamic> json) {
    return HelpStepCreateInput(
      id: json['id'],
      stepNumber: json['stepNumber'],
      title: json['title'],
      description: json['description'],
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      attachments: json['attachments'] != null
          ? AttachmentCreateNestedManyWithoutHelpStepInput.fromJson(
              json['attachments'])
          : null,
      help: HelpCreateNestedOneWithoutStepsInput.fromJson(json['help']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['stepNumber'] = stepNumber;

    _data['title'] = title;
    if (description != null) _data['description'] = description;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (attachments != null) _data['attachments'] = attachments!.toJson();

    _data['help'] = help.toJson();
    return _data;
  }

  HelpStepCreateInput copyWith(
      {String? id,
      int? stepNumber,
      String? title,
      String? description,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      AttachmentCreateNestedManyWithoutHelpStepInput? attachments,
      HelpCreateNestedOneWithoutStepsInput? help}) {
    return HelpStepCreateInput(
        id: id ?? this.id,
        stepNumber: stepNumber ?? this.stepNumber,
        title: title ?? this.title,
        description: description ?? this.description,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        attachments: attachments ?? this.attachments,
        help: help ?? this.help);
  }

  List<Object?> get props => [
        id,
        stepNumber,
        title,
        description,
        recordStatus,
        createdAt,
        updatedAt,
        attachments,
        help
      ];
}
