import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CasbinRuleWhereUniqueInput extends Equatable {
  final int? id;

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
          value: ast.IntValueNode(value: '${id!}'),
        )
    ]);
  }

  CasbinRuleWhereUniqueInput({this.id});

  static CasbinRuleWhereUniqueInput fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleWhereUniqueInput(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    return _data;
  }

  CasbinRuleWhereUniqueInput copyWith({int? id}) {
    return CasbinRuleWhereUniqueInput(id: id ?? this.id);
  }

  List<Object?> get props => [id];
}
