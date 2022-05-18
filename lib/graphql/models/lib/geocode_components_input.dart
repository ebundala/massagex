import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class GeocodeComponentsInput extends Equatable {
  final String? postal$code;
  final String? country;
  final String? route;
  final String? administrative$area;

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
      if (postal$code != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'postal_code'),
          value: ast.StringValueNode(value: '${postal$code!}', isBlock: false),
        ),
      if (country != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'country'),
          value: ast.StringValueNode(value: '${country!}', isBlock: false),
        ),
      if (route != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'route'),
          value: ast.StringValueNode(value: '${route!}', isBlock: false),
        ),
      if (administrative$area != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'administrative_area'),
          value: ast.StringValueNode(
              value: '${administrative$area!}', isBlock: false),
        )
    ]);
  }

  GeocodeComponentsInput(
      {this.postal$code, this.country, this.route, this.administrative$area});

  static GeocodeComponentsInput fromJson(Map<dynamic, dynamic> json) {
    return GeocodeComponentsInput(
      postal$code: json['postal_code'],
      country: json['country'],
      route: json['route'],
      administrative$area: json['administrative_area'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (postal$code != null) _data['postal_code'] = postal$code;
    if (country != null) _data['country'] = country;
    if (route != null) _data['route'] = route;
    if (administrative$area != null)
      _data['administrative_area'] = administrative$area;
    return _data;
  }

  GeocodeComponentsInput copyWith(
      {String? postal$code,
      String? country,
      String? route,
      String? administrative$area}) {
    return GeocodeComponentsInput(
        postal$code: postal$code ?? this.postal$code,
        country: country ?? this.country,
        route: route ?? this.route,
        administrative$area: administrative$area ?? this.administrative$area);
  }

  List<Object?> get props => [postal$code, country, route, administrative$area];
}
