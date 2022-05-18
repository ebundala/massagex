import 'order_where_unique_input.dart';
import 'order_update_without_business_input.dart';
import 'order_create_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderUpsertWithWhereUniqueWithoutBusinessInput extends Equatable {
  final OrderWhereUniqueInput where;
  final OrderUpdateWithoutBusinessInput update;
  final OrderCreateWithoutBusinessInput create;

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

  OrderUpsertWithWhereUniqueWithoutBusinessInput(
      {required this.where, required this.update, required this.create});

  static OrderUpsertWithWhereUniqueWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return OrderUpsertWithWhereUniqueWithoutBusinessInput(
      where: OrderWhereUniqueInput.fromJson(json['where']),
      update: OrderUpdateWithoutBusinessInput.fromJson(json['update']),
      create: OrderCreateWithoutBusinessInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  OrderUpsertWithWhereUniqueWithoutBusinessInput copyWith(
      {OrderWhereUniqueInput? where,
      OrderUpdateWithoutBusinessInput? update,
      OrderCreateWithoutBusinessInput? create}) {
    return OrderUpsertWithWhereUniqueWithoutBusinessInput(
        where: where ?? this.where,
        update: update ?? this.update,
        create: create ?? this.create);
  }

  List<Object?> get props => [where, update, create];
}
