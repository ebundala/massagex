import 'order_update_without_abuse_reports_input.dart';
import 'order_create_without_abuse_reports_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class OrderUpsertWithoutAbuseReportsInput extends Equatable {
  final OrderUpdateWithoutAbuseReportsInput update;
  final OrderCreateWithoutAbuseReportsInput create;

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

  OrderUpsertWithoutAbuseReportsInput(
      {required this.update, required this.create});

  static OrderUpsertWithoutAbuseReportsInput fromJson(
      Map<dynamic, dynamic> json) {
    return OrderUpsertWithoutAbuseReportsInput(
      update: OrderUpdateWithoutAbuseReportsInput.fromJson(json['update']),
      create: OrderCreateWithoutAbuseReportsInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['update'] = update.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  OrderUpsertWithoutAbuseReportsInput copyWith(
      {OrderUpdateWithoutAbuseReportsInput? update,
      OrderCreateWithoutAbuseReportsInput? create}) {
    return OrderUpsertWithoutAbuseReportsInput(
        update: update ?? this.update, create: create ?? this.create);
  }

  List<Object?> get props => [update, create];
}
