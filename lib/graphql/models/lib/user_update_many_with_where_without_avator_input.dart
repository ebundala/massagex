import 'user_scalar_where_input.dart';
import 'user_update_many_mutation_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserUpdateManyWithWhereWithoutAvatorInput extends Equatable {
  final UserScalarWhereInput where;
  final UserUpdateManyMutationInput data;

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

  UserUpdateManyWithWhereWithoutAvatorInput(
      {required this.where, required this.data});

  static UserUpdateManyWithWhereWithoutAvatorInput fromJson(
      Map<dynamic, dynamic> json) {
    return UserUpdateManyWithWhereWithoutAvatorInput(
      where: UserScalarWhereInput.fromJson(json['where']),
      data: UserUpdateManyMutationInput.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['data'] = data.toJson();
    return _data;
  }

  UserUpdateManyWithWhereWithoutAvatorInput copyWith(
      {UserScalarWhereInput? where, UserUpdateManyMutationInput? data}) {
    return UserUpdateManyWithWhereWithoutAvatorInput(
        where: where ?? this.where, data: data ?? this.data);
  }

  List<Object?> get props => [where, data];
}
