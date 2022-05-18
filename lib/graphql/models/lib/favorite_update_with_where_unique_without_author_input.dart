import 'favorite_where_unique_input.dart';
import 'favorite_update_without_author_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteUpdateWithWhereUniqueWithoutAuthorInput extends Equatable {
  final FavoriteWhereUniqueInput where;
  final FavoriteUpdateWithoutAuthorInput data;

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

  FavoriteUpdateWithWhereUniqueWithoutAuthorInput(
      {required this.where, required this.data});

  static FavoriteUpdateWithWhereUniqueWithoutAuthorInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteUpdateWithWhereUniqueWithoutAuthorInput(
      where: FavoriteWhereUniqueInput.fromJson(json['where']),
      data: FavoriteUpdateWithoutAuthorInput.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['data'] = data.toJson();
    return _data;
  }

  FavoriteUpdateWithWhereUniqueWithoutAuthorInput copyWith(
      {FavoriteWhereUniqueInput? where,
      FavoriteUpdateWithoutAuthorInput? data}) {
    return FavoriteUpdateWithWhereUniqueWithoutAuthorInput(
        where: where ?? this.where, data: data ?? this.data);
  }

  List<Object?> get props => [where, data];
}
