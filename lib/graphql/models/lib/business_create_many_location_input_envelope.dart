import 'business_create_many_location_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessCreateManyLocationInputEnvelope extends Equatable {
  final List<BusinessCreateManyLocationInput>? data;
  final bool? skipDuplicates;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (data != null) {
      int i = -1;
      data!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_data_$i', variables: variables);
      });
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
      if (data != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'data'),
            value: ast.ListValueNode(values: [
              ...data!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_data_$i')
                  ];
                },
              )
            ])),
      if (skipDuplicates != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'skipDuplicates'),
          value: ast.BooleanValueNode(value: skipDuplicates!),
        )
    ]);
  }

  BusinessCreateManyLocationInputEnvelope({this.data, this.skipDuplicates});

  static BusinessCreateManyLocationInputEnvelope fromJson(
      Map<dynamic, dynamic> json) {
    return BusinessCreateManyLocationInputEnvelope(
      data: json['data'] != null
          ? List.generate(
              json['data'].length,
              (index) =>
                  BusinessCreateManyLocationInput.fromJson(json['data'][index]))
          : null,
      skipDuplicates: json['skipDuplicates'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (data != null)
      _data['data'] =
          List.generate(data?.length ?? 0, (index) => data![index].toJson());
    if (skipDuplicates != null) _data['skipDuplicates'] = skipDuplicates;
    return _data;
  }

  BusinessCreateManyLocationInputEnvelope copyWith(
      {List<BusinessCreateManyLocationInput>? data, bool? skipDuplicates}) {
    return BusinessCreateManyLocationInputEnvelope(
        data: data ?? this.data,
        skipDuplicates: skipDuplicates ?? this.skipDuplicates);
  }

  List<Object?> get props => [List.from(data ?? []), skipDuplicates];
}
