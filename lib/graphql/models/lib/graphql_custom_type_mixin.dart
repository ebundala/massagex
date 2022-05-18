import "package:equatable/equatable.dart";
import 'package:gql/ast.dart' as ast;

abstract class GraphQLCustomType<T> extends Equatable {
  static GraphQLCustomType fromJson(Map<dynamic, dynamic> json) {
    throw UnimplementedError();
  }

  dynamic toJson() {
    throw UnimplementedError();
  }

  T copyWith(args) {
    throw UnimplementedError();
  }

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
    return vars;
  }

  ast.ValueNode toValueNode({required String field_name}) {
    throw UnimplementedError();
  }
}
