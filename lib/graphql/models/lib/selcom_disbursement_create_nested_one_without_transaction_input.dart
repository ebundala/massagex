import 'selcom_disbursement_create_without_transaction_input.dart';
import 'selcom_disbursement_create_or_connect_without_transaction_input.dart';
import 'selcom_disbursement_where_unique_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomDisbursementCreateNestedOneWithoutTransactionInput
    extends Equatable {
  final SelcomDisbursementCreateWithoutTransactionInput? create;
  final SelcomDisbursementCreateOrConnectWithoutTransactionInput?
      connectOrCreate;
  final SelcomDisbursementWhereUniqueInput? connect;

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

  SelcomDisbursementCreateNestedOneWithoutTransactionInput(
      {this.create, this.connectOrCreate, this.connect});

  static SelcomDisbursementCreateNestedOneWithoutTransactionInput fromJson(
      Map<dynamic, dynamic> json) {
    return SelcomDisbursementCreateNestedOneWithoutTransactionInput(
      create: json['create'] != null
          ? SelcomDisbursementCreateWithoutTransactionInput.fromJson(
              json['create'])
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? SelcomDisbursementCreateOrConnectWithoutTransactionInput.fromJson(
              json['connectOrCreate'])
          : null,
      connect: json['connect'] != null
          ? SelcomDisbursementWhereUniqueInput.fromJson(json['connect'])
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

  SelcomDisbursementCreateNestedOneWithoutTransactionInput copyWith(
      {SelcomDisbursementCreateWithoutTransactionInput? create,
      SelcomDisbursementCreateOrConnectWithoutTransactionInput? connectOrCreate,
      SelcomDisbursementWhereUniqueInput? connect}) {
    return SelcomDisbursementCreateNestedOneWithoutTransactionInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        connect: connect ?? this.connect);
  }

  List<Object?> get props => [create, connectOrCreate, connect];
}
