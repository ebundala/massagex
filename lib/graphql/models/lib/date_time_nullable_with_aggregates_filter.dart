import 'nested_date_time_nullable_with_aggregates_filter.dart';
import 'nested_int_nullable_filter.dart';
import 'nested_date_time_nullable_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class DateTimeNullableWithAggregatesFilter extends Equatable {
  final DateTime? equals;
  final List<DateTime>? in$;
  final List<DateTime>? notIn;
  final DateTime? lt;
  final DateTime? lte;
  final DateTime? gt;
  final DateTime? gte;
  final NestedDateTimeNullableWithAggregatesFilter? not;
  final NestedIntNullableFilter? $count;
  final NestedIntNullableFilter? count;
  final NestedDateTimeNullableFilter? $min;
  final NestedDateTimeNullableFilter? min;
  final NestedDateTimeNullableFilter? $max;
  final NestedDateTimeNullableFilter? max;

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
          value: ast.StringValueNode(
              value: equals!.toIso8601String(), isBlock: false),
        ),
      if (in$ != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'in'),
            value: ast.ListValueNode(
              values: [
                ...in$!.fold([], (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    ast.StringValueNode(
                        value: e.toIso8601String(), isBlock: false)
                  ];
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
                  return [
                    ...v,
                    ast.StringValueNode(
                        value: e.toIso8601String(), isBlock: false)
                  ];
                })
              ],
            )),
      if (lt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lt'),
          value:
              ast.StringValueNode(value: lt!.toIso8601String(), isBlock: false),
        ),
      if (lte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lte'),
          value: ast.StringValueNode(
              value: lte!.toIso8601String(), isBlock: false),
        ),
      if (gt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gt'),
          value:
              ast.StringValueNode(value: gt!.toIso8601String(), isBlock: false),
        ),
      if (gte != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gte'),
          value: ast.StringValueNode(
              value: gte!.toIso8601String(), isBlock: false),
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

  DateTimeNullableWithAggregatesFilter(
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
      this.$min,
      this.min,
      this.$max,
      this.max});

  static DateTimeNullableWithAggregatesFilter fromJson(
      Map<dynamic, dynamic> json) {
    return DateTimeNullableWithAggregatesFilter(
      equals: json['equals'] != null ? DateTime.parse(json['equals']) : null,
      in$: json['in'] != null
          ? List.generate(
              json['in'].length, (index) => json['in'][index] as DateTime)
          : null,
      notIn: json['notIn'] != null
          ? List.generate(
              json['notIn'].length, (index) => json['notIn'][index] as DateTime)
          : null,
      lt: json['lt'] != null ? DateTime.parse(json['lt']) : null,
      lte: json['lte'] != null ? DateTime.parse(json['lte']) : null,
      gt: json['gt'] != null ? DateTime.parse(json['gt']) : null,
      gte: json['gte'] != null ? DateTime.parse(json['gte']) : null,
      not: json['not'] != null
          ? NestedDateTimeNullableWithAggregatesFilter.fromJson(json['not'])
          : null,
      $count: json['_count'] != null
          ? NestedIntNullableFilter.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? NestedIntNullableFilter.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? NestedDateTimeNullableFilter.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? NestedDateTimeNullableFilter.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? NestedDateTimeNullableFilter.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? NestedDateTimeNullableFilter.fromJson(json['max'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals!.toString();
    if (in$ != null)
      _data['in'] =
          List.generate(in$?.length ?? 0, (index) => in$![index].toString());
    if (notIn != null)
      _data['notIn'] = List.generate(
          notIn?.length ?? 0, (index) => notIn![index].toString());
    if (lt != null) _data['lt'] = lt!.toString();
    if (lte != null) _data['lte'] = lte!.toString();
    if (gt != null) _data['gt'] = gt!.toString();
    if (gte != null) _data['gte'] = gte!.toString();
    if (not != null) _data['not'] = not!.toJson();
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  DateTimeNullableWithAggregatesFilter copyWith(
      {DateTime? equals,
      List<DateTime>? in$,
      List<DateTime>? notIn,
      DateTime? lt,
      DateTime? lte,
      DateTime? gt,
      DateTime? gte,
      NestedDateTimeNullableWithAggregatesFilter? not,
      NestedIntNullableFilter? $count,
      NestedIntNullableFilter? count,
      NestedDateTimeNullableFilter? $min,
      NestedDateTimeNullableFilter? min,
      NestedDateTimeNullableFilter? $max,
      NestedDateTimeNullableFilter? max}) {
    return DateTimeNullableWithAggregatesFilter(
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
        $min,
        min,
        $max,
        max
      ];
}
