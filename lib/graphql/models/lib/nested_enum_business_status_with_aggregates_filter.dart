import 'business_status.dart';
import 'nested_int_filter.dart';
import 'nested_enum_business_status_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedEnumBusinessStatusWithAggregatesFilter extends Equatable {
  final BusinessStatus? equals;
  final List<BusinessStatus>? in$;
  final List<BusinessStatus>? notIn;
  final NestedEnumBusinessStatusWithAggregatesFilter? not;
  final NestedIntFilter? $count;
  final NestedIntFilter? count;
  final NestedEnumBusinessStatusFilter? $min;
  final NestedEnumBusinessStatusFilter? min;
  final NestedEnumBusinessStatusFilter? $max;
  final NestedEnumBusinessStatusFilter? max;

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
          value: ast.EnumValueNode(name: ast.NameNode(value: equals!.toJson())),
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
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
        ),
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
                  ast.EnumValueNode(name: ast.NameNode(value: '${e.toJson()}'))
                ];
              })
            ],
          ),
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

  NestedEnumBusinessStatusWithAggregatesFilter(
      {this.equals,
      this.in$,
      this.notIn,
      this.not,
      this.$count,
      this.count,
      this.$min,
      this.min,
      this.$max,
      this.max});

  static NestedEnumBusinessStatusWithAggregatesFilter fromJson(
      Map<dynamic, dynamic> json) {
    return NestedEnumBusinessStatusWithAggregatesFilter(
      equals: json['equals'] != null
          ? BusinessStatusExt.fromJson(json['equals'])
          : null,
      in$: json['in'] != null
          ? List.generate(json['in'].length,
              (index) => BusinessStatusExt.fromJson(json['in'][index]))
          : null,
      notIn: json['notIn'] != null
          ? List.generate(json['notIn'].length,
              (index) => BusinessStatusExt.fromJson(json['notIn'][index]))
          : null,
      not: json['not'] != null
          ? NestedEnumBusinessStatusWithAggregatesFilter.fromJson(json['not'])
          : null,
      $count: json['_count'] != null
          ? NestedIntFilter.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? NestedIntFilter.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? NestedEnumBusinessStatusFilter.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? NestedEnumBusinessStatusFilter.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? NestedEnumBusinessStatusFilter.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? NestedEnumBusinessStatusFilter.fromJson(json['max'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals!.toJson();
    if (in$ != null)
      _data['in'] =
          List.generate(in$?.length ?? 0, (index) => in$![index].toJson());
    if (notIn != null)
      _data['notIn'] =
          List.generate(notIn?.length ?? 0, (index) => notIn![index].toJson());
    if (not != null) _data['not'] = not!.toJson();
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  NestedEnumBusinessStatusWithAggregatesFilter copyWith(
      {BusinessStatus? equals,
      List<BusinessStatus>? in$,
      List<BusinessStatus>? notIn,
      NestedEnumBusinessStatusWithAggregatesFilter? not,
      NestedIntFilter? $count,
      NestedIntFilter? count,
      NestedEnumBusinessStatusFilter? $min,
      NestedEnumBusinessStatusFilter? min,
      NestedEnumBusinessStatusFilter? $max,
      NestedEnumBusinessStatusFilter? max}) {
    return NestedEnumBusinessStatusWithAggregatesFilter(
        equals: equals ?? this.equals,
        in$: in$ ?? this.in$,
        notIn: notIn ?? this.notIn,
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
        not,
        $count,
        count,
        $min,
        min,
        $max,
        max
      ];
}
