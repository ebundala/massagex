import 'location_where_unique_input.dart';
import 'location_create_without_businesses_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LocationCreateOrConnectWithoutBusinessesInput extends Equatable {
  final LocationWhereUniqueInput where;
  final LocationCreateWithoutBusinessesInput create;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    {
      where.getFilesVariables(
          field_name: '${field_name}_where', variables: variables);
    }

    {
      create.getFilesVariables(
          field_name: '${field_name}_create', variables: variables);
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
        name: ast.NameNode(value: 'where'),
        value: where.toValueNode(field_name: '${field_name}_where'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'create'),
        value: create.toValueNode(field_name: '${field_name}_create'),
      )
    ]);
  }

  LocationCreateOrConnectWithoutBusinessesInput(
      {required this.where, required this.create});

  static LocationCreateOrConnectWithoutBusinessesInput fromJson(
      Map<dynamic, dynamic> json) {
    return LocationCreateOrConnectWithoutBusinessesInput(
      where: LocationWhereUniqueInput.fromJson(json['where']),
      create: LocationCreateWithoutBusinessesInput.fromJson(json['create']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['where'] = where.toJson();

    _data['create'] = create.toJson();
    return _data;
  }

  LocationCreateOrConnectWithoutBusinessesInput copyWith(
      {LocationWhereUniqueInput? where,
      LocationCreateWithoutBusinessesInput? create}) {
    return LocationCreateOrConnectWithoutBusinessesInput(
        where: where ?? this.where, create: create ?? this.create);
  }

  List<Object?> get props => [where, create];
}
