import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedIntNullableFilter extends Equatable {
  final int? equals;
  final List<int>? in$;
  final List<int>? notIn;
  final int? lt;
  final int? lte;
  final int? gt;
  final int? gte;
  final NestedIntNullableFilter? not;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (not != null) {
      not!.getFilesVariables(
          field_name: '${field_name}_not', variables: variables);
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
      if (equals != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'equals'),
          value: ast.IntValueNode(value: '${equals!}'),
        ),
      if (in$ != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'in'),
            value: ast.ListValueNode(
              values: [
                ...in$!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.IntValueNode(value: '${e}')];
                })
              ],
            )),
      if (notIn != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'notIn'),
            value: ast.ListValueNode(
              values: [
                ...notIn!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.IntValueNode(value: '${e}')];
                })
              ],
            )),
      if (lt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lt'),
          value: ast.IntValueNode(value: '${lt!}'),
        ),
      if (lte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lte'),
          value: ast.IntValueNode(value: '${lte!}'),
        ),
      if (gt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gt'),
          value: ast.IntValueNode(value: '${gt!}'),
        ),
      if (gte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gte'),
          value: ast.IntValueNode(value: '${gte!}'),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        )
    ]);
  }

  NestedIntNullableFilter(
      {this.equals,
      this.in$,
      this.notIn,
      this.lt,
      this.lte,
      this.gt,
      this.gte,
      this.not});

  static NestedIntNullableFilter fromJson(Map<dynamic, dynamic> json) {
    return NestedIntNullableFilter(
      equals: json['equals'],
      in$: json['in'] != null
          ? List.generate(
              json['in'].length, (index) => json['in'][index] as int)
          : null,
      notIn: json['notIn'] != null
          ? List.generate(
              json['notIn'].length, (index) => json['notIn'][index] as int)
          : null,
      lt: json['lt'],
      lte: json['lte'],
      gt: json['gt'],
      gte: json['gte'],
      not: json['not'] != null
          ? NestedIntNullableFilter.fromJson(json['not'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals;
    if (in$ != null) _data['in'] = in$;
    if (notIn != null) _data['notIn'] = notIn;
    if (lt != null) _data['lt'] = lt;
    if (lte != null) _data['lte'] = lte;
    if (gt != null) _data['gt'] = gt;
    if (gte != null) _data['gte'] = gte;
    if (not != null) _data['not'] = not!.toJson();
    return _data;
  }

  NestedIntNullableFilter copyWith(
      {int? equals,
      List<int>? in$,
      List<int>? notIn,
      int? lt,
      int? lte,
      int? gt,
      int? gte,
      NestedIntNullableFilter? not}) {
    return NestedIntNullableFilter(
        equals: equals ?? this.equals,
        in$: in$ ?? this.in$,
        notIn: notIn ?? this.notIn,
        lt: lt ?? this.lt,
        lte: lte ?? this.lte,
        gt: gt ?? this.gt,
        gte: gte ?? this.gte,
        not: not ?? this.not);
  }

  List<Object?> get props => [
        equals,
        List.from(in$ ?? []),
        List.from(notIn ?? []),
        lt,
        lte,
        gt,
        gte,
        not
      ];
}
