import 'favorite_create_nested_many_without_type_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteRecordTypeCreateInput extends Equatable {
  final String? id;
  final String name;
  final FavoriteCreateNestedManyWithoutTypeInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (favorites != null) {
      favorites!.getFilesVariables(
          field_name: '${field_name}_favorites', variables: variables);
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
        name: ast.NameNode(value: 'name'),
        value: ast.StringValueNode(value: '${name}', isBlock: false),
      ),
      if (favorites != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favorites'),
          value: favorites!.toValueNode(field_name: '${field_name}_favorites'),
        )
    ]);
  }

  FavoriteRecordTypeCreateInput({this.id, required this.name, this.favorites});

  static FavoriteRecordTypeCreateInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeCreateInput(
      id: json['id'],
      name: json['name'],
      favorites: json['favorites'] != null
          ? FavoriteCreateNestedManyWithoutTypeInput.fromJson(json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  FavoriteRecordTypeCreateInput copyWith(
      {String? id,
      String? name,
      FavoriteCreateNestedManyWithoutTypeInput? favorites}) {
    return FavoriteRecordTypeCreateInput(
        id: id ?? this.id,
        name: name ?? this.name,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [id, name, favorites];
}
