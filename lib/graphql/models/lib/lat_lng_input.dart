import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LatLngInput extends Equatable {
  final double lat;
  final double lng;

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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'lat'),
        value: ast.FloatValueNode(value: '${lat}'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'lng'),
        value: ast.FloatValueNode(value: '${lng}'),
      )
    ]);
  }

  LatLngInput({required this.lat, required this.lng});

  static LatLngInput fromJson(Map<dynamic, dynamic> json) {
    return LatLngInput(
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['lat'] = lat;

    _data['lng'] = lng;
    return _data;
  }

  LatLngInput copyWith({double? lat, double? lng}) {
    return LatLngInput(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  List<Object?> get props => [lat, lng];
}
