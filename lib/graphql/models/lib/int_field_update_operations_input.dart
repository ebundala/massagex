import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class IntFieldUpdateOperationsInput extends Equatable {
  final int? set$;
  final int? increment;
  final int? decrement;
  final int? multiply;
  final int? divide;

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
      if (set$ != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'set'),
          value: ast.IntValueNode(value: '${set$!}'),
        ),
      if (increment != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'increment'),
          value: ast.IntValueNode(value: '${increment!}'),
        ),
      if (decrement != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'decrement'),
          value: ast.IntValueNode(value: '${decrement!}'),
        ),
      if (multiply != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'multiply'),
          value: ast.IntValueNode(value: '${multiply!}'),
        ),
      if (divide != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'divide'),
          value: ast.IntValueNode(value: '${divide!}'),
        )
    ]);
  }

  IntFieldUpdateOperationsInput(
      {this.set$, this.increment, this.decrement, this.multiply, this.divide});

  static IntFieldUpdateOperationsInput fromJson(Map<dynamic, dynamic> json) {
    return IntFieldUpdateOperationsInput(
      set$: json['set'],
      increment: json['increment'],
      decrement: json['decrement'],
      multiply: json['multiply'],
      divide: json['divide'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (set$ != null) _data['set'] = set$;
    if (increment != null) _data['increment'] = increment;
    if (decrement != null) _data['decrement'] = decrement;
    if (multiply != null) _data['multiply'] = multiply;
    if (divide != null) _data['divide'] = divide;
    return _data;
  }

  IntFieldUpdateOperationsInput copyWith(
      {int? set$, int? increment, int? decrement, int? multiply, int? divide}) {
    return IntFieldUpdateOperationsInput(
        set$: set$ ?? this.set$,
        increment: increment ?? this.increment,
        decrement: decrement ?? this.decrement,
        multiply: multiply ?? this.multiply,
        divide: divide ?? this.divide);
  }

  List<Object?> get props => [set$, increment, decrement, multiply, divide];
}
