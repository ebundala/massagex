import 'gender.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class EnumGenderFieldUpdateOperationsInput extends Equatable {
  final Gender? set$;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: set$!.toJson())),
        )
    ]);
  }

  EnumGenderFieldUpdateOperationsInput({this.set$});

  static EnumGenderFieldUpdateOperationsInput fromJson(
      Map<dynamic, dynamic> json) {
    return EnumGenderFieldUpdateOperationsInput(
      set$: json['set'] != null ? GenderExt.fromJson(json['set']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (set$ != null) _data['set'] = set$!.toJson();
    return _data;
  }

  EnumGenderFieldUpdateOperationsInput copyWith({Gender? set$}) {
    return EnumGenderFieldUpdateOperationsInput(set$: set$ ?? this.set$);
  }

  List<Object?> get props => [set$];
}
