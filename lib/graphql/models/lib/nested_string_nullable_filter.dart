import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedStringNullableFilter extends Equatable {
  final String? equals;
  final List<String>? in$;
  final List<String>? notIn;
  final String? lt;
  final String? lte;
  final String? gt;
  final String? gte;
  final String? contains;
  final String? startsWith;
  final String? endsWith;
  final NestedStringNullableFilter? not;

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
          value: ast.StringValueNode(value: '${equals!}', isBlock: false),
        ),
      if (in$ != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'in'),
            value: ast.ListValueNode(
              values: [
                ...in$!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.StringValueNode(value: e, isBlock: false)];
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
                  return [...v, ast.StringValueNode(value: e, isBlock: false)];
                })
              ],
            )),
      if (lt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lt'),
          value: ast.StringValueNode(value: '${lt!}', isBlock: false),
        ),
      if (lte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lte'),
          value: ast.StringValueNode(value: '${lte!}', isBlock: false),
        ),
      if (gt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gt'),
          value: ast.StringValueNode(value: '${gt!}', isBlock: false),
        ),
      if (gte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gte'),
          value: ast.StringValueNode(value: '${gte!}', isBlock: false),
        ),
      if (contains != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'contains'),
          value: ast.StringValueNode(value: '${contains!}', isBlock: false),
        ),
      if (startsWith != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'startsWith'),
          value: ast.StringValueNode(value: '${startsWith!}', isBlock: false),
        ),
      if (endsWith != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'endsWith'),
          value: ast.StringValueNode(value: '${endsWith!}', isBlock: false),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        )
    ]);
  }

  NestedStringNullableFilter(
      {this.equals,
      this.in$,
      this.notIn,
      this.lt,
      this.lte,
      this.gt,
      this.gte,
      this.contains,
      this.startsWith,
      this.endsWith,
      this.not});

  static NestedStringNullableFilter fromJson(Map<dynamic, dynamic> json) {
    return NestedStringNullableFilter(
      equals: json['equals'],
      in$: json['in'] != null
          ? List.generate(
              json['in'].length, (index) => json['in'][index] as String)
          : null,
      notIn: json['notIn'] != null
          ? List.generate(
              json['notIn'].length, (index) => json['notIn'][index] as String)
          : null,
      lt: json['lt'],
      lte: json['lte'],
      gt: json['gt'],
      gte: json['gte'],
      contains: json['contains'],
      startsWith: json['startsWith'],
      endsWith: json['endsWith'],
      not: json['not'] != null
          ? NestedStringNullableFilter.fromJson(json['not'])
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
    if (contains != null) _data['contains'] = contains;
    if (startsWith != null) _data['startsWith'] = startsWith;
    if (endsWith != null) _data['endsWith'] = endsWith;
    if (not != null) _data['not'] = not!.toJson();
    return _data;
  }

  NestedStringNullableFilter copyWith(
      {String? equals,
      List<String>? in$,
      List<String>? notIn,
      String? lt,
      String? lte,
      String? gt,
      String? gte,
      String? contains,
      String? startsWith,
      String? endsWith,
      NestedStringNullableFilter? not}) {
    return NestedStringNullableFilter(
        equals: equals ?? this.equals,
        in$: in$ ?? this.in$,
        notIn: notIn ?? this.notIn,
        lt: lt ?? this.lt,
        lte: lte ?? this.lte,
        gt: gt ?? this.gt,
        gte: gte ?? this.gte,
        contains: contains ?? this.contains,
        startsWith: startsWith ?? this.startsWith,
        endsWith: endsWith ?? this.endsWith,
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
        contains,
        startsWith,
        endsWith,
        not
      ];
}
