import 'favorite_where_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteListRelationFilter extends Equatable {
  final FavoriteWhereInput? every;
  final FavoriteWhereInput? some;
  final FavoriteWhereInput? none;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (every != null) {
      every!.getFilesVariables(
          field_name: '${field_name}_every', variables: variables);
    }

    if (some != null) {
      some!.getFilesVariables(
          field_name: '${field_name}_some', variables: variables);
    }

    if (none != null) {
      none!.getFilesVariables(
          field_name: '${field_name}_none', variables: variables);
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
      if (every != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'every'),
          value: every!.toValueNode(field_name: '${field_name}_every'),
        ),
      if (some != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'some'),
          value: some!.toValueNode(field_name: '${field_name}_some'),
        ),
      if (none != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'none'),
          value: none!.toValueNode(field_name: '${field_name}_none'),
        )
    ]);
  }

  FavoriteListRelationFilter({this.every, this.some, this.none});

  static FavoriteListRelationFilter fromJson(Map<dynamic, dynamic> json) {
    return FavoriteListRelationFilter(
      every: json['every'] != null
          ? FavoriteWhereInput.fromJson(json['every'])
          : null,
      some: json['some'] != null
          ? FavoriteWhereInput.fromJson(json['some'])
          : null,
      none: json['none'] != null
          ? FavoriteWhereInput.fromJson(json['none'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (every != null) _data['every'] = every!.toJson();
    if (some != null) _data['some'] = some!.toJson();
    if (none != null) _data['none'] = none!.toJson();
    return _data;
  }

  FavoriteListRelationFilter copyWith(
      {FavoriteWhereInput? every,
      FavoriteWhereInput? some,
      FavoriteWhereInput? none}) {
    return FavoriteListRelationFilter(
        every: every ?? this.every,
        some: some ?? this.some,
        none: none ?? this.none);
  }

  List<Object?> get props => [every, some, none];
}
