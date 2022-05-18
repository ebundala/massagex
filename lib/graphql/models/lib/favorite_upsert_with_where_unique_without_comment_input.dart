import 'favorite_where_unique_input.dart';
import 'favorite_update_without_comment_input.dart';
import 'favorite_create_without_comment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteUpsertWithWhereUniqueWithoutCommentInput extends Equatable {
  final FavoriteWhereUniqueInput where;
  final FavoriteUpdateWithoutCommentInput update;
  final FavoriteCreateWithoutCommentInput create;

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
      update.getFilesVariables(
          field_name: '${field_name}_update', variables: variables);
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
        name: ast.NameNode(value: 'update'),
        value: update.toValueNode(field_name: '${field_name}_update'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'create'),
        value: create.toValueNode(field_name: '${field_name}_create'),
      )
    ]);
  }

  FavoriteUpsertWithWhereUniqueWithoutCommentInput(
      {required this.where, required this.update, required this.create});

  static FavoriteUpsertWithWhereUniqueWithoutCommentInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteUpsertWithWhereUniqueWithoutCommentInput(
      where: FavoriteWhereUniqueInput.fromJson(json['where']),
      update: FavoriteUpdateWithoutCommentInput.fromJson(json['update']),
      create: FavoriteCreateWithoutCommentInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  FavoriteUpsertWithWhereUniqueWithoutCommentInput copyWith(
      {FavoriteWhereUniqueInput? where,
      FavoriteUpdateWithoutCommentInput? update,
      FavoriteCreateWithoutCommentInput? create}) {
    return FavoriteUpsertWithWhereUniqueWithoutCommentInput(
        where: where ?? this.where,
        update: update ?? this.update,
        create: create ?? this.create);
  }

  List<Object?> get props => [where, update, create];
}
