import 'payment_status.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedEnumPaymentStatusFilter extends Equatable {
  final PaymentStatus? equals;
  final List<PaymentStatus>? in$;
  final List<PaymentStatus>? notIn;
  final NestedEnumPaymentStatusFilter? not;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (not != null) {
      not!.getFilesVariables(
          field_name: '${field_name}_not', variables: variables);
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
      if (equals != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'equals'),
          value: ast.EnumValueNode(name: ast.NameNode(value: equals!.toJson())),
        ),
      if (in$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'in'),
          value: ast.ListValueNode(
            values: [
              ...in$!.fold([], (v, e) {
                // ignore: unused_local_variable
                int i = v.length;
                return [
                  ...v,
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        ),
      if (notIn != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'notIn'),
          value: ast.ListValueNode(
            values: [
              ...notIn!.fold([], (v, e) {
                // ignore: unused_local_variable
                int i = v.length;
                return [
                  ...v,
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        )
    ]);
  }

  NestedEnumPaymentStatusFilter({this.equals, this.in$, this.notIn, this.not});

  static NestedEnumPaymentStatusFilter fromJson(Map<dynamic, dynamic> json) {
    return NestedEnumPaymentStatusFilter(
      equals: json['equals'] != null
          ? PaymentStatusExt.fromJson(json['equals'])
          : null,
      in$: json['in'] != null
          ? List.generate(json['in'].length,
              (index) => PaymentStatusExt.fromJson(json['in'][index]))
          : null,
      notIn: json['notIn'] != null
          ? List.generate(json['notIn'].length,
              (index) => PaymentStatusExt.fromJson(json['notIn'][index]))
          : null,
      not: json['not'] != null
          ? NestedEnumPaymentStatusFilter.fromJson(json['not'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals!.toJson();
    if (in$ != null)
      _data['in'] =
          List.generate(in$?.length ?? 0, (index) => in$![index].toJson());
    if (notIn != null)
      _data['notIn'] =
          List.generate(notIn?.length ?? 0, (index) => notIn![index].toJson());
    if (not != null) _data['not'] = not!.toJson();
    return _data;
  }

  NestedEnumPaymentStatusFilter copyWith(
      {PaymentStatus? equals,
      List<PaymentStatus>? in$,
      List<PaymentStatus>? notIn,
      NestedEnumPaymentStatusFilter? not}) {
    return NestedEnumPaymentStatusFilter(
        equals: equals ?? this.equals,
        in$: in$ ?? this.in$,
        notIn: notIn ?? this.notIn,
        not: not ?? this.not);
  }

  List<Object?> get props =>
      [equals, List.from(in$ ?? []), List.from(notIn ?? []), not];
}
