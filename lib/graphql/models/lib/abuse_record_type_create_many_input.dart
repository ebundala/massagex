import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseRecordTypeCreateManyInput extends Equatable {
  final String? id;
  final String name;

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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'name'),
        value: ast.StringValueNode(value: '${name}', isBlock: false),
      )
    ]);
  }

  AbuseRecordTypeCreateManyInput({this.id, required this.name});

  static AbuseRecordTypeCreateManyInput fromJson(Map<dynamic, dynamic> json) {
    return AbuseRecordTypeCreateManyInput(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['name'] = name;
    return _data;
  }

  AbuseRecordTypeCreateManyInput copyWith({String? id, String? name}) {
    return AbuseRecordTypeCreateManyInput(
        id: id ?? this.id, name: name ?? this.name);
  }

  List<Object?> get props => [id, name];
}
