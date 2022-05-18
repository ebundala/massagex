import 'help_step_where_unique_input.dart';
import 'help_step_create_without_attachments_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class HelpStepCreateOrConnectWithoutAttachmentsInput extends Equatable {
  final HelpStepWhereUniqueInput where;
  final HelpStepCreateWithoutAttachmentsInput create;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      where.getFilesVariables(
          field_name: '${field_name}_where', variables: variables);
    }

    {
      create.getFilesVariables(
          field_name: '${field_name}_create', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'where'),
        value: where.toValueNode(field_name: '${field_name}_where'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'create'),
        value: create.toValueNode(field_name: '${field_name}_create'),
      )
    ]);
  }

  HelpStepCreateOrConnectWithoutAttachmentsInput(
      {required this.where, required this.create});

  static HelpStepCreateOrConnectWithoutAttachmentsInput fromJson(
      Map<dynamic, dynamic> json) {
    return HelpStepCreateOrConnectWithoutAttachmentsInput(
      where: HelpStepWhereUniqueInput.fromJson(json['where']),
      create: HelpStepCreateWithoutAttachmentsInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  HelpStepCreateOrConnectWithoutAttachmentsInput copyWith(
      {HelpStepWhereUniqueInput? where,
      HelpStepCreateWithoutAttachmentsInput? create}) {
    return HelpStepCreateOrConnectWithoutAttachmentsInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
