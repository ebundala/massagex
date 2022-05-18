import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AuthInput extends Equatable {
  final String email;
  final String password;

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
        name: ast.NameNode(value: 'email'),
        value: ast.StringValueNode(value: '${email}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'password'),
        value: ast.StringValueNode(value: '${password}', isBlock: false),
      )
    ]);
  }

  AuthInput({required this.email, required this.password});

  static AuthInput fromJson(Map<dynamic, dynamic> json) {
    return AuthInput(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['email'] = email;

    _data['password'] = password;
    return _data;
  }

  AuthInput copyWith({String? email, String? password}) {
    return AuthInput(
        email: email ?? this.email, password: password ?? this.password);
  }

  List<Object?> get props => [email, password];
}
