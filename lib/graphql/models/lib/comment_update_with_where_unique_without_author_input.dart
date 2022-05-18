import 'comment_where_unique_input.dart';
import 'comment_update_without_author_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CommentUpdateWithWhereUniqueWithoutAuthorInput extends Equatable {
  final CommentWhereUniqueInput where;
  final CommentUpdateWithoutAuthorInput data;

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
      data.getFilesVariables(
          field_name: '${field_name}_data', variables: variables);
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
        name: ast.NameNode(value: 'data'),
        value: data.toValueNode(field_name: '${field_name}_data'),
      )
    ]);
  }

  CommentUpdateWithWhereUniqueWithoutAuthorInput(
      {required this.where, required this.data});

  static CommentUpdateWithWhereUniqueWithoutAuthorInput fromJson(
      Map<dynamic, dynamic> json) {
    return CommentUpdateWithWhereUniqueWithoutAuthorInput(
      where: CommentWhereUniqueInput.fromJson(json['where']),
      data: CommentUpdateWithoutAuthorInput.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['data'] = data.toJson();
    return _data;
  }

  CommentUpdateWithWhereUniqueWithoutAuthorInput copyWith(
      {CommentWhereUniqueInput? where, CommentUpdateWithoutAuthorInput? data}) {
    return CommentUpdateWithWhereUniqueWithoutAuthorInput(
        where: where ?? this.where, data: data ?? this.data);
  }

  List<Object?> get props => [where, data];
}
