import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class RegisterDeviceInput extends Equatable {
  final String? fcm$id;
  final String id;
  final String? userId;
  final String? type;

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
      if (fcm$id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'fcm_id'),
          value: ast.StringValueNode(value: '${fcm$id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'id'),
        value: ast.StringValueNode(value: '${id}', isBlock: false),
      ),
      if (userId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'userId'),
          value: ast.StringValueNode(value: '${userId!}', isBlock: false),
        ),
      if (type != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'type'),
          value: ast.StringValueNode(value: '${type!}', isBlock: false),
        )
    ]);
  }

  RegisterDeviceInput({this.fcm$id, required this.id, this.userId, this.type});

  static RegisterDeviceInput fromJson(Map<dynamic, dynamic> json) {
    return RegisterDeviceInput(
      fcm$id: json['fcm_id'],
      id: json['id'],
      userId: json['userId'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (fcm$id != null) _data['fcm_id'] = fcm$id;

    _data['id'] = id;
    if (userId != null) _data['userId'] = userId;
    if (type != null) _data['type'] = type;
    return _data;
  }

  RegisterDeviceInput copyWith(
      {String? fcm$id, String? id, String? userId, String? type}) {
    return RegisterDeviceInput(
        fcm$id: fcm$id ?? this.fcm$id,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        type: type ?? this.type);
  }

  List<Object?> get props => [fcm$id, id, userId, type];
}
