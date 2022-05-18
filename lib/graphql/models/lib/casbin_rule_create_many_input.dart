import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CasbinRuleCreateManyInput extends Equatable {
  final int? id;
  final String ptype;
  final String? v0;
  final String? v1;
  final String? v2;
  final String? v3;
  final String? v4;
  final String? v5;
  final DateTime? createdAt;
  final DateTime? updatedAt;

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
          value: ast.IntValueNode(value: '${id!}'),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'ptype'),
        value: ast.StringValueNode(value: '${ptype}', isBlock: false),
      ),
      if (v0 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v0'),
          value: ast.StringValueNode(value: '${v0!}', isBlock: false),
        ),
      if (v1 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v1'),
          value: ast.StringValueNode(value: '${v1!}', isBlock: false),
        ),
      if (v2 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v2'),
          value: ast.StringValueNode(value: '${v2!}', isBlock: false),
        ),
      if (v3 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v3'),
          value: ast.StringValueNode(value: '${v3!}', isBlock: false),
        ),
      if (v4 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v4'),
          value: ast.StringValueNode(value: '${v4!}', isBlock: false),
        ),
      if (v5 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v5'),
          value: ast.StringValueNode(value: '${v5!}', isBlock: false),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        )
    ]);
  }

  CasbinRuleCreateManyInput(
      {this.id,
      required this.ptype,
      this.v0,
      this.v1,
      this.v2,
      this.v3,
      this.v4,
      this.v5,
      this.createdAt,
      this.updatedAt});

  static CasbinRuleCreateManyInput fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleCreateManyInput(
      id: json['id'],
      ptype: json['ptype'],
      v0: json['v0'],
      v1: json['v1'],
      v2: json['v2'],
      v3: json['v3'],
      v4: json['v4'],
      v5: json['v5'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['ptype'] = ptype;
    if (v0 != null) _data['v0'] = v0;
    if (v1 != null) _data['v1'] = v1;
    if (v2 != null) _data['v2'] = v2;
    if (v3 != null) _data['v3'] = v3;
    if (v4 != null) _data['v4'] = v4;
    if (v5 != null) _data['v5'] = v5;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    return _data;
  }

  CasbinRuleCreateManyInput copyWith(
      {int? id,
      String? ptype,
      String? v0,
      String? v1,
      String? v2,
      String? v3,
      String? v4,
      String? v5,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return CasbinRuleCreateManyInput(
        id: id ?? this.id,
        ptype: ptype ?? this.ptype,
        v0: v0 ?? this.v0,
        v1: v1 ?? this.v1,
        v2: v2 ?? this.v2,
        v3: v3 ?? this.v3,
        v4: v4 ?? this.v4,
        v5: v5 ?? this.v5,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, ptype, v0, v1, v2, v3, v4, v5, createdAt, updatedAt];
}
