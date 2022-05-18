import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteRecordTypeWhereUniqueInput extends Equatable {
  final String? id;
  final String? name;

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
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.StringValueNode(value: '${name!}', isBlock: false),
        )
    ]);
  }

  FavoriteRecordTypeWhereUniqueInput({this.id, this.name});

  static FavoriteRecordTypeWhereUniqueInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeWhereUniqueInput(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;
    return _data;
  }

  FavoriteRecordTypeWhereUniqueInput copyWith({String? id, String? name}) {
    return FavoriteRecordTypeWhereUniqueInput(
        id: id ?? this.id, name: name ?? this.name);
  }

  List<Object?> get props => [id, name];
}
