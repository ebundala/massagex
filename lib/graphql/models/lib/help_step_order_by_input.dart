import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? stepNumber;
  final SortOrder? title;
  final SortOrder? description;
  final SortOrder? recordStatus;
  final SortOrder? helpId;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (stepNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'stepNumber'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: stepNumber!.toJson())),
        ),
      if (title != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'title'),
          value: ast.EnumValueNode(name: ast.NameNode(value: title!.toJson())),
        ),
      if (description != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'description'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: description!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (helpId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'helpId'),
          value: ast.EnumValueNode(name: ast.NameNode(value: helpId!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        )
    ]);
  }

  HelpStepOrderByInput(
      {this.id,
      this.stepNumber,
      this.title,
      this.description,
      this.recordStatus,
      this.helpId,
      this.createdAt,
      this.updatedAt});

  static HelpStepOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return HelpStepOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      stepNumber: json['stepNumber'] != null
          ? SortOrderExt.fromJson(json['stepNumber'])
          : null,
      title:
          json['title'] != null ? SortOrderExt.fromJson(json['title']) : null,
      description: json['description'] != null
          ? SortOrderExt.fromJson(json['description'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      helpId:
          json['helpId'] != null ? SortOrderExt.fromJson(json['helpId']) : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
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

  HelpStepOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? stepNumber,
      SortOrder? title,
      SortOrder? description,
      SortOrder? recordStatus,
      SortOrder? helpId,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return HelpStepOrderByInput(
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
