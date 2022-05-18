import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class CasbinRuleOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? ptype;
  final SortOrder? v0;
  final SortOrder? v1;
  final SortOrder? v2;
  final SortOrder? v3;
  final SortOrder? v4;
  final SortOrder? v5;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (ptype != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ptype'),
          value: ast.EnumValueNode(name: ast.NameNode(value: ptype!.toJson())),
        ),
      if (v0 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v0'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v0!.toJson())),
        ),
      if (v1 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v1'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v1!.toJson())),
        ),
      if (v2 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v2'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v2!.toJson())),
        ),
      if (v3 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v3'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v3!.toJson())),
        ),
      if (v4 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v4'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v4!.toJson())),
        ),
      if (v5 != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'v5'),
          value: ast.EnumValueNode(name: ast.NameNode(value: v5!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        )
    ]);
  }

  CasbinRuleOrderByInput(
      {this.id,
      this.ptype,
      this.v0,
      this.v1,
      this.v2,
      this.v3,
      this.v4,
      this.v5,
      this.createdAt,
      this.updatedAt});

  static CasbinRuleOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return CasbinRuleOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      ptype:
          json['ptype'] != null ? SortOrderExt.fromJson(json['ptype']) : null,
      v0: json['v0'] != null ? SortOrderExt.fromJson(json['v0']) : null,
      v1: json['v1'] != null ? SortOrderExt.fromJson(json['v1']) : null,
      v2: json['v2'] != null ? SortOrderExt.fromJson(json['v2']) : null,
      v3: json['v3'] != null ? SortOrderExt.fromJson(json['v3']) : null,
      v4: json['v4'] != null ? SortOrderExt.fromJson(json['v4']) : null,
      v5: json['v5'] != null ? SortOrderExt.fromJson(json['v5']) : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (ptype != null) _data['ptype'] = ptype!.toJson();
    if (v0 != null) _data['v0'] = v0!.toJson();
    if (v1 != null) _data['v1'] = v1!.toJson();
    if (v2 != null) _data['v2'] = v2!.toJson();
    if (v3 != null) _data['v3'] = v3!.toJson();
    if (v4 != null) _data['v4'] = v4!.toJson();
    if (v5 != null) _data['v5'] = v5!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  CasbinRuleOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? ptype,
      SortOrder? v0,
      SortOrder? v1,
      SortOrder? v2,
      SortOrder? v3,
      SortOrder? v4,
      SortOrder? v5,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return CasbinRuleOrderByInput(
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
