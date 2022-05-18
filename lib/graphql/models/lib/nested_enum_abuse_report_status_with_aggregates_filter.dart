import 'abuse_report_status.dart';
import 'nested_int_filter.dart';
import 'nested_enum_abuse_report_status_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class NestedEnumAbuseReportStatusWithAggregatesFilter extends Equatable {
  final AbuseReportStatus? equals;
  final List<AbuseReportStatus>? in$;
  final List<AbuseReportStatus>? notIn;
  final NestedEnumAbuseReportStatusWithAggregatesFilter? not;
  final NestedIntFilter? $count;
  final NestedIntFilter? count;
  final NestedEnumAbuseReportStatusFilter? $min;
  final NestedEnumAbuseReportStatusFilter? min;
  final NestedEnumAbuseReportStatusFilter? $max;
  final NestedEnumAbuseReportStatusFilter? max;

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

  NestedEnumAbuseReportStatusWithAggregatesFilter(
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

  static NestedEnumAbuseReportStatusWithAggregatesFilter fromJson(
      Map<dynamic, dynamic> json) {
    return NestedEnumAbuseReportStatusWithAggregatesFilter(
      equals: json['equals'] != null
          ? AbuseReportStatusExt.fromJson(json['equals'])
          : null,
      in$: json['in'] != null
          ? List.generate(json['in'].length,
              (index) => AbuseReportStatusExt.fromJson(json['in'][index]))
          : null,
      notIn: json['notIn'] != null
          ? List.generate(json['notIn'].length,
              (index) => AbuseReportStatusExt.fromJson(json['notIn'][index]))
          : null,
      not: json['not'] != null
          ? NestedEnumAbuseReportStatusWithAggregatesFilter.fromJson(
              json['not'])
          : null,
      $count: json['_count'] != null
          ? NestedIntFilter.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? NestedIntFilter.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? NestedEnumAbuseReportStatusFilter.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? NestedEnumAbuseReportStatusFilter.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? NestedEnumAbuseReportStatusFilter.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? NestedEnumAbuseReportStatusFilter.fromJson(json['max'])
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

  NestedEnumAbuseReportStatusWithAggregatesFilter copyWith(
      {AbuseReportStatus? equals,
      List<AbuseReportStatus>? in$,
      List<AbuseReportStatus>? notIn,
      NestedEnumAbuseReportStatusWithAggregatesFilter? not,
      NestedIntFilter? $count,
      NestedIntFilter? count,
      NestedEnumAbuseReportStatusFilter? $min,
      NestedEnumAbuseReportStatusFilter? min,
      NestedEnumAbuseReportStatusFilter? $max,
      NestedEnumAbuseReportStatusFilter? max}) {
    return NestedEnumAbuseReportStatusWithAggregatesFilter(
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
