import 'payment_method_where_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaymentMethodRelationFilter extends Equatable {
  final PaymentMethodWhereInput? is$;
  final PaymentMethodWhereInput? isNot;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (is$ != null) {
      is$!.getFilesVariables(
          field_name: '${field_name}_is', variables: variables);
    }

    if (isNot != null) {
      isNot!.getFilesVariables(
          field_name: '${field_name}_isNot', variables: variables);
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
      if (is$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'is'),
          value: is$!.toValueNode(field_name: '${field_name}_is'),
        ),
      if (isNot != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'isNot'),
          value: isNot!.toValueNode(field_name: '${field_name}_isNot'),
        )
    ]);
  }

  PaymentMethodRelationFilter({this.is$, this.isNot});

  static PaymentMethodRelationFilter fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethodRelationFilter(
      is$: json['is'] != null
          ? PaymentMethodWhereInput.fromJson(json['is'])
          : null,
      isNot: json['isNot'] != null
          ? PaymentMethodWhereInput.fromJson(json['isNot'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (is$ != null) _data['is'] = is$!.toJson();
    if (isNot != null) _data['isNot'] = isNot!.toJson();
    return _data;
  }

  PaymentMethodRelationFilter copyWith(
      {PaymentMethodWhereInput? is$, PaymentMethodWhereInput? isNot}) {
    return PaymentMethodRelationFilter(
        is$: is$ ?? this.is$, isNot: isNot ?? this.isNot);
  }

  List<Object?> get props => [is$, isNot];
}
