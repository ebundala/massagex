import 'abuse_report_create_without_business_input.dart';
import 'abuse_report_create_or_connect_without_business_input.dart';
import 'abuse_report_create_many_business_input_envelope.dart';
import 'abuse_report_where_unique_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class AbuseReportUncheckedCreateNestedManyWithoutBusinessInput
    extends Equatable {
  final List<AbuseReportCreateWithoutBusinessInput>? create;
  final List<AbuseReportCreateOrConnectWithoutBusinessInput>? connectOrCreate;
  final AbuseReportCreateManyBusinessInputEnvelope? createMany;
  final List<AbuseReportWhereUniqueInput>? connect;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (create != null) {
      int i = -1;
      create!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_create_$i', variables: variables);
      });
    }
    if (connectOrCreate != null) {
      int i = -1;
      connectOrCreate!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_connectOrCreate_$i',
            variables: variables);
      });
    }
    if (createMany != null) {
      createMany!.getFilesVariables(
          field_name: '${field_name}_createMany', variables: variables);
    }

    if (connect != null) {
      int i = -1;
      connect!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_connect_$i', variables: variables);
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
      if (create != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'create'),
            value: ast.ListValueNode(values: [
              ...create!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_create_$i')
                  ];
                },
              )
            ])),
      if (connectOrCreate != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'connectOrCreate'),
            value: ast.ListValueNode(values: [
              ...connectOrCreate!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(
                        field_name: '${field_name}_connectOrCreate_$i')
                  ];
                },
              )
            ])),
      if (createMany != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createMany'),
          value:
              createMany!.toValueNode(field_name: '${field_name}_createMany'),
        ),
      if (connect != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'connect'),
            value: ast.ListValueNode(values: [
              ...connect!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_connect_$i')
                  ];
                },
              )
            ]))
    ]);
  }

  AbuseReportUncheckedCreateNestedManyWithoutBusinessInput(
      {this.create, this.connectOrCreate, this.createMany, this.connect});

  static AbuseReportUncheckedCreateNestedManyWithoutBusinessInput fromJson(
      Map<dynamic, dynamic> json) {
    return AbuseReportUncheckedCreateNestedManyWithoutBusinessInput(
      create: json['create'] != null
          ? List.generate(
              json['create'].length,
              (index) => AbuseReportCreateWithoutBusinessInput.fromJson(
                  json['create'][index]))
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? List.generate(
              json['connectOrCreate'].length,
              (index) =>
                  AbuseReportCreateOrConnectWithoutBusinessInput.fromJson(
                      json['connectOrCreate'][index]))
          : null,
      createMany: json['createMany'] != null
          ? AbuseReportCreateManyBusinessInputEnvelope.fromJson(
              json['createMany'])
          : null,
      connect: json['connect'] != null
          ? List.generate(
              json['connect'].length,
              (index) =>
                  AbuseReportWhereUniqueInput.fromJson(json['connect'][index]))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (create != null)
      _data['create'] = List.generate(
          create?.length ?? 0, (index) => create![index].toJson());
    if (connectOrCreate != null)
      _data['connectOrCreate'] = List.generate(connectOrCreate?.length ?? 0,
          (index) => connectOrCreate![index].toJson());
    if (createMany != null) _data['createMany'] = createMany!.toJson();
    if (connect != null)
      _data['connect'] = List.generate(
          connect?.length ?? 0, (index) => connect![index].toJson());
    return _data;
  }

  AbuseReportUncheckedCreateNestedManyWithoutBusinessInput copyWith(
      {List<AbuseReportCreateWithoutBusinessInput>? create,
      List<AbuseReportCreateOrConnectWithoutBusinessInput>? connectOrCreate,
      AbuseReportCreateManyBusinessInputEnvelope? createMany,
      List<AbuseReportWhereUniqueInput>? connect}) {
    return AbuseReportUncheckedCreateNestedManyWithoutBusinessInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        createMany: createMany ?? this.createMany,
        connect: connect ?? this.connect);
  }

  List<Object?> get props => [
        List.from(create ?? []),
        List.from(connectOrCreate ?? []),
        createMany,
        List.from(connect ?? [])
      ];
}
