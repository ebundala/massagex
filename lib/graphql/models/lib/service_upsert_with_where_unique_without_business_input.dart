import 'service_where_unique_input.dart';
import 'service_update_without_business_input.dart';
import 'service_create_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUpsertWithWhereUniqueWithoutBusinessInput extends Equatable {
  final ServiceWhereUniqueInput where;
  final ServiceUpdateWithoutBusinessInput update;
  final ServiceCreateWithoutBusinessInput create;

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

  ServiceUpsertWithWhereUniqueWithoutBusinessInput(
      {required this.where, required this.update, required this.create});

  static ServiceUpsertWithWhereUniqueWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return ServiceUpsertWithWhereUniqueWithoutBusinessInput(
      where: ServiceWhereUniqueInput.fromJson(json['where']),
      update: ServiceUpdateWithoutBusinessInput.fromJson(json['update']),
      create: ServiceCreateWithoutBusinessInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  ServiceUpsertWithWhereUniqueWithoutBusinessInput copyWith(
      {ServiceWhereUniqueInput? where,
      ServiceUpdateWithoutBusinessInput? update,
      ServiceCreateWithoutBusinessInput? create}) {
    return ServiceUpsertWithWhereUniqueWithoutBusinessInput(
        where: where ?? this.where,
        update: update ?? this.update,
        create: create ?? this.create);
  }

  List<Object?> get props => [where, update, create];
}
