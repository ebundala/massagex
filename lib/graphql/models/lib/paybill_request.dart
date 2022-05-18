import 'scalars/phone_number.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class PaybillRequest extends Equatable {
  final PhoneNumber msisdn;
  final String? currency;
  final String orderId;
  final String? method;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
        name: ast.NameNode(value: 'msisdn'),
        value: msisdn.toValueNode(field_name: '${field_name}_msisdn'),
      ),
      if (currency != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'currency'),
          value: ast.StringValueNode(value: '${currency!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'orderId'),
        value: ast.StringValueNode(value: '${orderId}', isBlock: false),
      ),
      if (method != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'method'),
          value: ast.StringValueNode(value: '${method!}', isBlock: false),
        )
    ]);
  }

  PaybillRequest(
      {required this.msisdn,
      this.currency,
      required this.orderId,
      this.method});

  static PaybillRequest fromJson(Map<dynamic, dynamic> json) {
    return PaybillRequest(
      msisdn: PhoneNumber.fromJson(json['msisdn']),
      currency: json['currency'],
      orderId: json['orderId'],
      method: json['method'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['msisdn'] = msisdn.toJson();
    if (currency != null) _data['currency'] = currency;

    _data['orderId'] = orderId;
    if (method != null) _data['method'] = method;
    return _data;
  }

  PaybillRequest copyWith(
      {PhoneNumber? msisdn,
      String? currency,
      String? orderId,
      String? method}) {
    return PaybillRequest(
        msisdn: msisdn ?? this.msisdn,
        currency: currency ?? this.currency,
        orderId: orderId ?? this.orderId,
        method: method ?? this.method);
  }

  List<Object?> get props => [msisdn, currency, orderId, method];
}
