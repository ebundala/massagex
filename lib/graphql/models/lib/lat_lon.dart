import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LatLon extends Equatable {
  final double lat;
  final double lon;

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
        name: ast.NameNode(value: 'lon'),
        value: ast.FloatValueNode(value: '${lon}'),
      )
    ]);
  }

  LatLon({required this.lat, required this.lon});

  static LatLon fromJson(Map<dynamic, dynamic> json) {
    return LatLon(
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};

    _data['lat'] = lat;

    _data['lon'] = lon;
    return _data;
  }

  LatLon copyWith({double? lat, double? lon}) {
    return LatLon(lat: lat ?? this.lat, lon: lon ?? this.lon);
  }

  List<Object?> get props => [lat, lon];
}
