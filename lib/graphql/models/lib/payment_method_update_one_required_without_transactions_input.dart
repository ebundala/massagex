import 'payment_method_create_without_transactions_input.dart';
import 'payment_method_create_or_connect_without_transactions_input.dart';
import 'payment_method_upsert_without_transactions_input.dart';
import 'payment_method_where_unique_input.dart';
import 'payment_method_update_without_transactions_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodUpdateOneRequiredWithoutTransactionsInput extends Equatable {
  final PaymentMethodCreateWithoutTransactionsInput? create;
  final PaymentMethodCreateOrConnectWithoutTransactionsInput? connectOrCreate;
  final PaymentMethodUpsertWithoutTransactionsInput? upsert;
  final PaymentMethodWhereUniqueInput? connect;
  final PaymentMethodUpdateWithoutTransactionsInput? update;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (create != null) {
      create!.getFilesVariables(
          field_name: '${field_name}_create', variables: variables);
    }

    if (connectOrCreate != null) {
      connectOrCreate!.getFilesVariables(
          field_name: '${field_name}_connectOrCreate', variables: variables);
    }

    if (upsert != null) {
      upsert!.getFilesVariables(
          field_name: '${field_name}_upsert', variables: variables);
    }

    if (connect != null) {
      connect!.getFilesVariables(
          field_name: '${field_name}_connect', variables: variables);
    }

    if (update != null) {
      update!.getFilesVariables(
          field_name: '${field_name}_update', variables: variables);
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
      if (create != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'create'),
          value: create!.toValueNode(field_name: '${field_name}_create'),
        ),
      if (connectOrCreate != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'connectOrCreate'),
          value: connectOrCreate!
              .toValueNode(field_name: '${field_name}_connectOrCreate'),
        ),
      if (upsert != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'upsert'),
          value: upsert!.toValueNode(field_name: '${field_name}_upsert'),
        ),
      if (connect != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'connect'),
          value: connect!.toValueNode(field_name: '${field_name}_connect'),
        ),
      if (update != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'update'),
          value: update!.toValueNode(field_name: '${field_name}_update'),
        )
    ]);
  }

  PaymentMethodUpdateOneRequiredWithoutTransactionsInput(
      {this.create,
      this.connectOrCreate,
      this.upsert,
      this.connect,
      this.update});

  static PaymentMethodUpdateOneRequiredWithoutTransactionsInput fromJson(
      Map<dynamic, dynamic> json) {
    return PaymentMethodUpdateOneRequiredWithoutTransactionsInput(
      create: json['create'] != null
          ? PaymentMethodCreateWithoutTransactionsInput.fromJson(json['create'])
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? PaymentMethodCreateOrConnectWithoutTransactionsInput.fromJson(
              json['connectOrCreate'])
          : null,
      upsert: json['upsert'] != null
          ? PaymentMethodUpsertWithoutTransactionsInput.fromJson(json['upsert'])
          : null,
      connect: json['connect'] != null
          ? PaymentMethodWhereUniqueInput.fromJson(json['connect'])
          : null,
      update: json['update'] != null
          ? PaymentMethodUpdateWithoutTransactionsInput.fromJson(json['update'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (create != null) _data['create'] = create!.toJson();
    if (connectOrCreate != null)
      _data['connectOrCreate'] = connectOrCreate!.toJson();
    if (upsert != null) _data['upsert'] = upsert!.toJson();
    if (connect != null) _data['connect'] = connect!.toJson();
    if (update != null) _data['update'] = update!.toJson();
    return _data;
  }

  PaymentMethodUpdateOneRequiredWithoutTransactionsInput copyWith(
      {PaymentMethodCreateWithoutTransactionsInput? create,
      PaymentMethodCreateOrConnectWithoutTransactionsInput? connectOrCreate,
      PaymentMethodUpsertWithoutTransactionsInput? upsert,
      PaymentMethodWhereUniqueInput? connect,
      PaymentMethodUpdateWithoutTransactionsInput? update}) {
    return PaymentMethodUpdateOneRequiredWithoutTransactionsInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        upsert: upsert ?? this.upsert,
        connect: connect ?? this.connect,
        update: update ?? this.update);
  }

  List<Object?> get props => [create, connectOrCreate, upsert, connect, update];
}
