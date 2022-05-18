import 'business_where_unique_input.dart';
import 'business_create_without_cover_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessCreateOrConnectWithoutCoverInput extends Equatable {
  final BusinessWhereUniqueInput where;
  final BusinessCreateWithoutCoverInput create;

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

  BusinessCreateOrConnectWithoutCoverInput(
      {required this.where, required this.create});

  static BusinessCreateOrConnectWithoutCoverInput fromJson(
      Map<dynamic, dynamic> json) {
    return BusinessCreateOrConnectWithoutCoverInput(
      where: BusinessWhereUniqueInput.fromJson(json['where']),
      create: BusinessCreateWithoutCoverInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  BusinessCreateOrConnectWithoutCoverInput copyWith(
      {BusinessWhereUniqueInput? where,
      BusinessCreateWithoutCoverInput? create}) {
    return BusinessCreateOrConnectWithoutCoverInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
