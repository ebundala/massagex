import 'transaction_create_without_mpesa_payment_input.dart';
import 'transaction_create_or_connect_without_mpesa_payment_input.dart';
import 'transaction_upsert_without_mpesa_payment_input.dart';
import 'transaction_where_unique_input.dart';
import 'transaction_update_without_mpesa_payment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionUncheckedUpdateOneWithoutMpesaPaymentInput extends Equatable {
  final TransactionCreateWithoutMpesaPaymentInput? create;
  final TransactionCreateOrConnectWithoutMpesaPaymentInput? connectOrCreate;
  final TransactionUpsertWithoutMpesaPaymentInput? upsert;
  final TransactionWhereUniqueInput? connect;
  final bool? disconnect;
  final bool? delete;
  final TransactionUpdateWithoutMpesaPaymentInput? update;

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
      if (disconnect != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'disconnect'),
          value: ast.BooleanValueNode(value: disconnect!),
        ),
      if (delete != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'delete'),
          value: ast.BooleanValueNode(value: delete!),
        ),
      if (update != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'update'),
          value: update!.toValueNode(field_name: '${field_name}_update'),
        )
    ]);
  }

  TransactionUncheckedUpdateOneWithoutMpesaPaymentInput(
      {this.create,
      this.connectOrCreate,
      this.upsert,
      this.connect,
      this.disconnect,
      this.delete,
      this.update});

  static TransactionUncheckedUpdateOneWithoutMpesaPaymentInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionUncheckedUpdateOneWithoutMpesaPaymentInput(
      create: json['create'] != null
          ? TransactionCreateWithoutMpesaPaymentInput.fromJson(json['create'])
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? TransactionCreateOrConnectWithoutMpesaPaymentInput.fromJson(
              json['connectOrCreate'])
          : null,
      upsert: json['upsert'] != null
          ? TransactionUpsertWithoutMpesaPaymentInput.fromJson(json['upsert'])
          : null,
      connect: json['connect'] != null
          ? TransactionWhereUniqueInput.fromJson(json['connect'])
          : null,
      disconnect: json['disconnect'],
      delete: json['delete'],
      update: json['update'] != null
          ? TransactionUpdateWithoutMpesaPaymentInput.fromJson(json['update'])
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
    if (disconnect != null) _data['disconnect'] = disconnect;
    if (delete != null) _data['delete'] = delete;
    if (update != null) _data['update'] = update!.toJson();
    return _data;
  }

  TransactionUncheckedUpdateOneWithoutMpesaPaymentInput copyWith(
      {TransactionCreateWithoutMpesaPaymentInput? create,
      TransactionCreateOrConnectWithoutMpesaPaymentInput? connectOrCreate,
      TransactionUpsertWithoutMpesaPaymentInput? upsert,
      TransactionWhereUniqueInput? connect,
      bool? disconnect,
      bool? delete,
      TransactionUpdateWithoutMpesaPaymentInput? update}) {
    return TransactionUncheckedUpdateOneWithoutMpesaPaymentInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        upsert: upsert ?? this.upsert,
        connect: connect ?? this.connect,
        disconnect: disconnect ?? this.disconnect,
        delete: delete ?? this.delete,
        update: update ?? this.update);
  }

  List<Object?> get props =>
      [create, connectOrCreate, upsert, connect, disconnect, delete, update];
}
