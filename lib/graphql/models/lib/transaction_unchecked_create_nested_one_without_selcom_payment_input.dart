import 'transaction_create_without_selcom_payment_input.dart';
import 'transaction_create_or_connect_without_selcom_payment_input.dart';
import 'transaction_where_unique_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput
    extends Equatable {
  final TransactionCreateWithoutSelcomPaymentInput? create;
  final TransactionCreateOrConnectWithoutSelcomPaymentInput? connectOrCreate;
  final TransactionWhereUniqueInput? connect;

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

    if (connect != null) {
      connect!.getFilesVariables(
          field_name: '${field_name}_connect', variables: variables);
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
      if (connect != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'connect'),
          value: connect!.toValueNode(field_name: '${field_name}_connect'),
        )
    ]);
  }

  TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput(
      {this.create, this.connectOrCreate, this.connect});

  static TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput(
      create: json['create'] != null
          ? TransactionCreateWithoutSelcomPaymentInput.fromJson(json['create'])
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? TransactionCreateOrConnectWithoutSelcomPaymentInput.fromJson(
              json['connectOrCreate'])
          : null,
      connect: json['connect'] != null
          ? TransactionWhereUniqueInput.fromJson(json['connect'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (create != null) _data['create'] = create!.toJson();
    if (connectOrCreate != null)
      _data['connectOrCreate'] = connectOrCreate!.toJson();
    if (connect != null) _data['connect'] = connect!.toJson();
    return _data;
  }

  TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput copyWith(
      {TransactionCreateWithoutSelcomPaymentInput? create,
      TransactionCreateOrConnectWithoutSelcomPaymentInput? connectOrCreate,
      TransactionWhereUniqueInput? connect}) {
    return TransactionUncheckedCreateNestedOneWithoutSelcomPaymentInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        connect: connect ?? this.connect);
  }

  List<Object?> get props => [create, connectOrCreate, connect];
}
