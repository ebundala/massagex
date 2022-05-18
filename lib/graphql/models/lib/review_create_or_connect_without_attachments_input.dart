import 'review_where_unique_input.dart';
import 'review_create_without_attachments_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ReviewCreateOrConnectWithoutAttachmentsInput extends Equatable {
  final ReviewWhereUniqueInput where;
  final ReviewCreateWithoutAttachmentsInput create;

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

  ReviewCreateOrConnectWithoutAttachmentsInput(
      {required this.where, required this.create});

  static ReviewCreateOrConnectWithoutAttachmentsInput fromJson(
      Map<dynamic, dynamic> json) {
    return ReviewCreateOrConnectWithoutAttachmentsInput(
      where: ReviewWhereUniqueInput.fromJson(json['where']),
      create: ReviewCreateWithoutAttachmentsInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  ReviewCreateOrConnectWithoutAttachmentsInput copyWith(
      {ReviewWhereUniqueInput? where,
      ReviewCreateWithoutAttachmentsInput? create}) {
    return ReviewCreateOrConnectWithoutAttachmentsInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
