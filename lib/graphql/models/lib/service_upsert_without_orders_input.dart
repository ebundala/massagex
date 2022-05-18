import 'service_update_without_orders_input.dart';
import 'service_create_without_orders_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUpsertWithoutOrdersInput extends Equatable {
  final ServiceUpdateWithoutOrdersInput update;
  final ServiceCreateWithoutOrdersInput create;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
        name: ast.NameNode(value: 'update'),
        value: update.toValueNode(field_name: '${field_name}_update'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'create'),
        value: create.toValueNode(field_name: '${field_name}_create'),
      )
    ]);
  }

  ServiceUpsertWithoutOrdersInput({required this.update, required this.create});

  static ServiceUpsertWithoutOrdersInput fromJson(Map<dynamic, dynamic> json) {
    return ServiceUpsertWithoutOrdersInput(
      update: ServiceUpdateWithoutOrdersInput.fromJson(json['update']),
      create: ServiceCreateWithoutOrdersInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  ServiceUpsertWithoutOrdersInput copyWith(
      {ServiceUpdateWithoutOrdersInput? update,
      ServiceCreateWithoutOrdersInput? create}) {
    return ServiceUpsertWithoutOrdersInput(
        update: update ?? this.update, create: create ?? this.create);
  }

  List<Object?> get props => [update, create];
}
