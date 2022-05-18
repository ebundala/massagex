import 'scalars/json_object.dart';
import 'nested_int_nullable_filter.dart';
import 'nested_json_nullable_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class JsonNullableWithAggregatesFilter extends Equatable {
  final JSONObject? equals;
  final JSONObject? not;
  final NestedIntNullableFilter? $count;
  final NestedIntNullableFilter? count;
  final NestedJsonNullableFilter? $min;
  final NestedJsonNullableFilter? min;
  final NestedJsonNullableFilter? $max;
  final NestedJsonNullableFilter? max;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
          value: equals!.toValueNode(field_name: '${field_name}_equals'),
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

  JsonNullableWithAggregatesFilter(
      {this.equals,
      this.not,
      this.$count,
      this.count,
      this.$min,
      this.min,
      this.$max,
      this.max});

  static JsonNullableWithAggregatesFilter fromJson(Map<dynamic, dynamic> json) {
    return JsonNullableWithAggregatesFilter(
      equals:
          json['equals'] != null ? JSONObject.fromJson(json['equals']) : null,
      not: json['not'] != null ? JSONObject.fromJson(json['not']) : null,
      $count: json['_count'] != null
          ? NestedIntNullableFilter.fromJson(json['_count'])
          : null,
      count: json['count'] != null
          ? NestedIntNullableFilter.fromJson(json['count'])
          : null,
      $min: json['_min'] != null
          ? NestedJsonNullableFilter.fromJson(json['_min'])
          : null,
      min: json['min'] != null
          ? NestedJsonNullableFilter.fromJson(json['min'])
          : null,
      $max: json['_max'] != null
          ? NestedJsonNullableFilter.fromJson(json['_max'])
          : null,
      max: json['max'] != null
          ? NestedJsonNullableFilter.fromJson(json['max'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (equals != null) _data['equals'] = equals!.toJson();
    if (not != null) _data['not'] = not!.toJson();
    if ($count != null) _data['_count'] = $count!.toJson();
    if (count != null) _data['count'] = count!.toJson();
    if ($min != null) _data['_min'] = $min!.toJson();
    if (min != null) _data['min'] = min!.toJson();
    if ($max != null) _data['_max'] = $max!.toJson();
    if (max != null) _data['max'] = max!.toJson();
    return _data;
  }

  JsonNullableWithAggregatesFilter copyWith(
      {JSONObject? equals,
      JSONObject? not,
      NestedIntNullableFilter? $count,
      NestedIntNullableFilter? count,
      NestedJsonNullableFilter? $min,
      NestedJsonNullableFilter? min,
      NestedJsonNullableFilter? $max,
      NestedJsonNullableFilter? max}) {
    return JsonNullableWithAggregatesFilter(
        equals: equals ?? this.equals,
        not: not ?? this.not,
        $count: $count ?? this.$count,
        count: count ?? this.count,
        $min: $min ?? this.$min,
        min: min ?? this.min,
        $max: $max ?? this.$max,
        max: max ?? this.max);
  }

  List<Object?> get props => [equals, not, $count, count, $min, min, $max, max];
}
