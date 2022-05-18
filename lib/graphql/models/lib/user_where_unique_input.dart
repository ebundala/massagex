import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserWhereUniqueInput extends Equatable {
  final String? id;
  final String? email;

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
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      if (email != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'email'),
          value: ast.StringValueNode(value: '${email!}', isBlock: false),
        )
    ]);
  }

  UserWhereUniqueInput({this.id, this.email});

  static UserWhereUniqueInput fromJson(Map<dynamic, dynamic> json) {
    return UserWhereUniqueInput(
      id: json['id'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (email != null) _data['email'] = email;
    return _data;
  }

  UserWhereUniqueInput copyWith({String? id, String? email}) {
    return UserWhereUniqueInput(id: id ?? this.id, email: email ?? this.email);
  }

  List<Object?> get props => [id, email];
}
