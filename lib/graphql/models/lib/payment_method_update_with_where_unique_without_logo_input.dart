import 'payment_method_where_unique_input.dart';
import 'payment_method_update_without_logo_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodUpdateWithWhereUniqueWithoutLogoInput extends Equatable {
  final PaymentMethodWhereUniqueInput where;
  final PaymentMethodUpdateWithoutLogoInput data;

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
      data.getFilesVariables(
          field_name: '${field_name}_data', variables: variables);
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
        name: ast.NameNode(value: 'data'),
        value: data.toValueNode(field_name: '${field_name}_data'),
      )
    ]);
  }

  PaymentMethodUpdateWithWhereUniqueWithoutLogoInput(
      {required this.where, required this.data});

  static PaymentMethodUpdateWithWhereUniqueWithoutLogoInput fromJson(
      Map<dynamic, dynamic> json) {
    return PaymentMethodUpdateWithWhereUniqueWithoutLogoInput(
      where: PaymentMethodWhereUniqueInput.fromJson(json['where']),
      data: PaymentMethodUpdateWithoutLogoInput.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['data'] = data.toJson();
    return _data;
  }

  PaymentMethodUpdateWithWhereUniqueWithoutLogoInput copyWith(
      {PaymentMethodWhereUniqueInput? where,
      PaymentMethodUpdateWithoutLogoInput? data}) {
    return PaymentMethodUpdateWithWhereUniqueWithoutLogoInput(
        where: where ?? this.where, data: data ?? this.data);
  }

  List<Object?> get props => [where, data];
}
