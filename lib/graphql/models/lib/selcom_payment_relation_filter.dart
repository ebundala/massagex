import 'selcom_payment_where_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class SelcomPaymentRelationFilter extends Equatable {
  final SelcomPaymentWhereInput? is$;
  final SelcomPaymentWhereInput? isNot;

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

  SelcomPaymentRelationFilter({this.is$, this.isNot});

  static SelcomPaymentRelationFilter fromJson(Map<dynamic, dynamic> json) {
    return SelcomPaymentRelationFilter(
      is$: json['is'] != null
          ? SelcomPaymentWhereInput.fromJson(json['is'])
          : null,
      isNot: json['isNot'] != null
          ? SelcomPaymentWhereInput.fromJson(json['isNot'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (is$ != null) _data['is'] = is$!.toJson();
    if (isNot != null) _data['isNot'] = isNot!.toJson();
    return _data;
  }

  SelcomPaymentRelationFilter copyWith(
      {SelcomPaymentWhereInput? is$, SelcomPaymentWhereInput? isNot}) {
    return SelcomPaymentRelationFilter(
        is$: is$ ?? this.is$, isNot: isNot ?? this.isNot);
  }

  List<Object?> get props => [is$, isNot];
}
