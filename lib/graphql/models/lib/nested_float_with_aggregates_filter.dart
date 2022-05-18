import 'nested_int_filter.dart';
import 'nested_float_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedFloatWithAggregatesFilter extends Equatable {
  final double? equals;
  final List<double>? in$;
  final List<double>? notIn;
  final double? lt;
  final double? lte;
  final double? gt;
  final double? gte;
  final NestedFloatWithAggregatesFilter? not;
  final NestedIntFilter? $count;
  final NestedIntFilter? count;
  final NestedFloatFilter? $avg;
  final NestedFloatFilter? avg;
  final NestedFloatFilter? $sum;
  final NestedFloatFilter? sum;
  final NestedFloatFilter? $min;
  final NestedFloatFilter? min;
  final NestedFloatFilter? $max;
  final NestedFloatFilter? max;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (not != null) {
      not!.getFilesVariables(
          field_name: '${field_name}_not', variables: variables);
    }

    if ($count != null) {
      $count!.getFilesVariables(
          field_name: '${field_name}__count', variables: variables);
    }

    if (count != null) {
      count!.getFilesVariables(
          field_name: '${field_name}_count', variables: variables);
    }

    if ($avg != null) {
      $avg!.getFilesVariables(
          field_name: '${field_name}__avg', variables: variables);
    }

    if (avg != null) {
      avg!.getFilesVariables(
          field_name: '${field_name}_avg', variables: variables);
    }

    if ($sum != null) {
      $sum!.getFilesVariables(
          field_name: '${field_name}__sum', variables: variables);
    }

    if (sum != null) {
      sum!.getFilesVariables(
          field_name: '${field_name}_sum', variables: variables);
    }

    if ($min != null) {
      $min!.getFilesVariables(
          field_name: '${field_name}__min', variables: variables);
    }

    if (min != null) {
      min!.getFilesVariables(
          field_name: '${field_name}_min', variables: variables);
    }

    if ($max != null) {
      $max!.getFilesVariables(
          field_name: '${field_name}__max', variables: variables);
    }

    if (max != null) {
      max!.getFilesVariables(
          field_name: '${field_name}_max', variables: variables);
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
          value: ast.FloatValueNode(value: '${equals!}'),
        ),
      if (in$ != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'in'),
            value: ast.ListValueNode(
              values: [
                ...in$!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [...v, ast.FloatValueNode(value: '${e}')];
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
                  return [...v, ast.FloatValueNode(value: '${e}')];
                })
              ],
            )),
      if (lt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lt'),
          value: ast.FloatValueNode(value: '${lt!}'),
        ),
      if (lte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lte'),
          value: ast.FloatValueNode(value: '${lte!}'),
        ),
      if (gt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gt'),
          value: ast.FloatValueNode(value: '${gt!}'),
        ),
      if (gte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gte'),
          value: ast.FloatValueNode(value: '${gte!}'),
        ),
      if (not != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'not'),
          value: not!.toValueNode(field_name: '${field_name}_not'),
        ),
      if ($count != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: '_count'),
          value: $count!.toValueNode(field_name: '${field_name}__count'),
        ),
      if (count != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'count'),
          value: count!.toValueNode(field_name: '${field_name}_count'),
        ),
      if ($avg != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: '_avg'),
          value: $avg!.toValueNode(field_name: '${field_name}__avg'),
        ),
      if (avg != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avg'),
          value: avg!.toValueNode(field_name: '${field_name}_avg'),
        ),
      if ($sum != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: '_sum'),
          value: $sum!.toValueNode(field_name: '${field_name}__sum'),
        ),
      if (sum != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'sum'),
          value: sum!.toValueNode(field_name: '${field_name}_sum'),
        ),
      if ($min != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: '_min'),
          value: $min!.toValueNode(field_name: '${field_name}__min'),
        ),
      if (min != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'min'),
          value: min!.toValueNode(field_name: '${field_name}_min'),
        ),
      if ($max != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: '_max'),
          value: $max!.toValueNode(field_name: '${field_name}__max'),
        ),
      if (max != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'max'),
          value: max!.toValueNode(field_name: '${field_name}_max'),
        )
    ]);
  }

  NestedFloatWithAggregatesFilter(
      {this.equals,
      this.in$,
      this.notIn,
      this.lt,
      this.lte,
      this.gt,
      this.gte,
      this.not,
      this.$count,
      this.count,
      this.$avg,
      this.avg,
      this.$sum,
      this.sum,
      this.$min,
      this.min,
      this.$max,
      this.max});

  static NestedFloatWithAggregatesFilter fromJson(Map<dynamic, dynamic> json) {
    return NestedFloatWithAggregatesFilter(
      equals: json['equals']?.toDouble(),
      in$: json['in'] != null
          ? List.generate(
              json['in'].length, (index) => json['in'][index] as double)
          : null,
      notIn: json['notIn'] != null
          ? List.generate(
              json['notIn'].length, (index) => json['notIn'][index] as double)
          : null,
      lt: json['lt']?.toDouble(),
      lte: json['lte']?.toDouble(),
      gt: json['gt']?.toDouble(),
      gte: json['gte']?.toDouble(),
      not: json['not'] != null
          ? NestedFloatWithAggregatesFilter.fromJson(json['not'])
          : null,
      $count: json['_count'] != null
          ? NestedIntFilter.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? NestedIntFilter.fromJson(json['count'])
          : null,
      $avg: json['_avg'] != null
          ? NestedFloatFilter.fromJson(json['_avg'])
          : null,
      avg: json['avg'] != null ? NestedFloatFilter.fromJson(json['avg']) : null,
      $sum: json['_sum'] != null
          ? NestedFloatFilter.fromJson(json['_sum'])
          : null,
      sum: json['sum'] != null ? NestedFloatFilter.fromJson(json['sum']) : null,
      $min: json['_min'] != null
          ? NestedFloatFilter.fromJson(json['_min'])
          : null,
      min: json['min'] != null ? NestedFloatFilter.fromJson(json['min']) : null,
      $max: json['_max'] != null
          ? NestedFloatFilter.fromJson(json['_max'])
          : null,
      max: json['max'] != null ? NestedFloatFilter.fromJson(json['max']) : null,
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
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($avg != null) _data['_avg'] = $avg!.toJson();
    if (avg != null) _data['avg'] = avg!.toJson();
    if ($sum != null) _data['_sum'] = $sum!.toJson();
    if (sum != null) _data['sum'] = sum!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  NestedFloatWithAggregatesFilter copyWith(
      {double? equals,
      List<double>? in$,
      List<double>? notIn,
      double? lt,
      double? lte,
      double? gt,
      double? gte,
      NestedFloatWithAggregatesFilter? not,
      NestedIntFilter? $count,
      NestedIntFilter? count,
      NestedFloatFilter? $avg,
      NestedFloatFilter? avg,
      NestedFloatFilter? $sum,
      NestedFloatFilter? sum,
      NestedFloatFilter? $min,
      NestedFloatFilter? min,
      NestedFloatFilter? $max,
      NestedFloatFilter? max}) {
    return NestedFloatWithAggregatesFilter(
        equals: equals ?? this.equals,
        in$: in$ ?? this.in$,
        notIn: notIn ?? this.notIn,
        lt: lt ?? this.lt,
        lte: lte ?? this.lte,
        gt: gt ?? this.gt,
        gte: gte ?? this.gte,
        not: not ?? this.not,
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $avg: $avg ?? this.$avg,
        avg: avg ?? this.avg,
        $sum: $sum ?? this.$sum,
        sum: sum ?? this.sum,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [
        equals,
        List.from(in$ ?? []),
        List.from(notIn ?? []),
        lt,
        lte,
        gt,
        gte,
        not,
        $count,
        count,
        $avg,
        avg,
        $sum,
        sum,
        $min,
        min,
        $max,
        max
      ];
}
