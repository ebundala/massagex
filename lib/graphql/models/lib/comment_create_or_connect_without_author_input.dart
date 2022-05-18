import 'comment_where_unique_input.dart';
import 'comment_create_without_author_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentCreateOrConnectWithoutAuthorInput extends Equatable {
  final CommentWhereUniqueInput where;
  final CommentCreateWithoutAuthorInput create;

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

  CommentCreateOrConnectWithoutAuthorInput(
      {required this.where, required this.create});

  static CommentCreateOrConnectWithoutAuthorInput fromJson(
      Map<dynamic, dynamic> json) {
    return CommentCreateOrConnectWithoutAuthorInput(
      where: CommentWhereUniqueInput.fromJson(json['where']),
      create: CommentCreateWithoutAuthorInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  CommentCreateOrConnectWithoutAuthorInput copyWith(
      {CommentWhereUniqueInput? where,
      CommentCreateWithoutAuthorInput? create}) {
    return CommentCreateOrConnectWithoutAuthorInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
