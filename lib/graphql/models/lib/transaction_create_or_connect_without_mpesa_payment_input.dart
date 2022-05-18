import 'transaction_where_unique_input.dart';
import 'transaction_create_without_mpesa_payment_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class TransactionCreateOrConnectWithoutMpesaPaymentInput extends Equatable {
  final TransactionWhereUniqueInput where;
  final TransactionCreateWithoutMpesaPaymentInput create;

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

  TransactionCreateOrConnectWithoutMpesaPaymentInput(
      {required this.where, required this.create});

  static TransactionCreateOrConnectWithoutMpesaPaymentInput fromJson(
      Map<dynamic, dynamic> json) {
    return TransactionCreateOrConnectWithoutMpesaPaymentInput(
      where: TransactionWhereUniqueInput.fromJson(json['where']),
      create:
          TransactionCreateWithoutMpesaPaymentInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  TransactionCreateOrConnectWithoutMpesaPaymentInput copyWith(
      {TransactionWhereUniqueInput? where,
      TransactionCreateWithoutMpesaPaymentInput? create}) {
    return TransactionCreateOrConnectWithoutMpesaPaymentInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
