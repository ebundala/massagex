import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteWhereUniqueInput extends Equatable {
  final String? id;
  final String? favId;

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
      if (favId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favId'),
          value: ast.StringValueNode(value: '${favId!}', isBlock: false),
        )
    ]);
  }

  FavoriteWhereUniqueInput({this.id, this.favId});

  static FavoriteWhereUniqueInput fromJson(Map<dynamic, dynamic> json) {
    return FavoriteWhereUniqueInput(
      id: json['id'],
      favId: json['favId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (favId != null) _data['favId'] = favId;
    return _data;
  }

  FavoriteWhereUniqueInput copyWith({String? id, String? favId}) {
    return FavoriteWhereUniqueInput(
        id: id ?? this.id, favId: favId ?? this.favId);
  }

  List<Object?> get props => [id, favId];
}
