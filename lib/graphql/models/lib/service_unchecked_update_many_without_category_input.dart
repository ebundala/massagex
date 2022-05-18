import 'service_create_without_category_input.dart';
import 'service_create_or_connect_without_category_input.dart';
import 'service_upsert_with_where_unique_without_category_input.dart';
import 'service_create_many_category_input_envelope.dart';
import 'service_where_unique_input.dart';
import 'service_update_with_where_unique_without_category_input.dart';
import 'service_update_many_with_where_without_category_input.dart';
import 'service_scalar_where_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class ServiceUncheckedUpdateManyWithoutCategoryInput extends Equatable {
  final List<ServiceCreateWithoutCategoryInput>? create;
  final List<ServiceCreateOrConnectWithoutCategoryInput>? connectOrCreate;
  final List<ServiceUpsertWithWhereUniqueWithoutCategoryInput>? upsert;
  final ServiceCreateManyCategoryInputEnvelope? createMany;
  final List<ServiceWhereUniqueInput>? connect;
  final List<ServiceWhereUniqueInput>? set$;
  final List<ServiceWhereUniqueInput>? disconnect;
  final List<ServiceWhereUniqueInput>? delete;
  final List<ServiceUpdateWithWhereUniqueWithoutCategoryInput>? update;
  final List<ServiceUpdateManyWithWhereWithoutCategoryInput>? updateMany;
  final List<ServiceScalarWhereInput>? deleteMany;

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
    if (upsert != null) {
      int i = -1;
      upsert!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_upsert_$i', variables: variables);
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
    if (set$ != null) {
      int i = -1;
      set$!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_set_$i', variables: variables);
      });
    }
    if (disconnect != null) {
      int i = -1;
      disconnect!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_disconnect_$i', variables: variables);
      });
    }
    if (delete != null) {
      int i = -1;
      delete!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_delete_$i', variables: variables);
      });
    }
    if (update != null) {
      int i = -1;
      update!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_update_$i', variables: variables);
      });
    }
    if (updateMany != null) {
      int i = -1;
      updateMany!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_updateMany_$i', variables: variables);
      });
    }
    if (deleteMany != null) {
      int i = -1;
      deleteMany!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_deleteMany_$i', variables: variables);
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
      if (upsert != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'upsert'),
            value: ast.ListValueNode(values: [
              ...upsert!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_upsert_$i')
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
            ])),
      if (set$ != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'set'),
            value: ast.ListValueNode(values: [
              ...set$!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_set_$i')
                  ];
                },
              )
            ])),
      if (disconnect != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'disconnect'),
            value: ast.ListValueNode(values: [
              ...disconnect!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_disconnect_$i')
                  ];
                },
              )
            ])),
      if (delete != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'delete'),
            value: ast.ListValueNode(values: [
              ...delete!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_delete_$i')
                  ];
                },
              )
            ])),
      if (update != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'update'),
            value: ast.ListValueNode(values: [
              ...update!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_update_$i')
                  ];
                },
              )
            ])),
      if (updateMany != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'updateMany'),
            value: ast.ListValueNode(values: [
              ...updateMany!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_updateMany_$i')
                  ];
                },
              )
            ])),
      if (deleteMany != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'deleteMany'),
            value: ast.ListValueNode(values: [
              ...deleteMany!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_deleteMany_$i')
                  ];
                },
              )
            ]))
    ]);
  }

  ServiceUncheckedUpdateManyWithoutCategoryInput(
      {this.create,
      this.connectOrCreate,
      this.upsert,
      this.createMany,
      this.connect,
      this.set$,
      this.disconnect,
      this.delete,
      this.update,
      this.updateMany,
      this.deleteMany});

  static ServiceUncheckedUpdateManyWithoutCategoryInput fromJson(
      Map<dynamic, dynamic> json) {
    return ServiceUncheckedUpdateManyWithoutCategoryInput(
      create: json['create'] != null
          ? List.generate(
              json['create'].length,
              (index) => ServiceCreateWithoutCategoryInput.fromJson(
                  json['create'][index]))
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? List.generate(
              json['connectOrCreate'].length,
              (index) => ServiceCreateOrConnectWithoutCategoryInput.fromJson(
                  json['connectOrCreate'][index]))
          : null,
      upsert: json['upsert'] != null
          ? List.generate(
              json['upsert'].length,
              (index) =>
                  ServiceUpsertWithWhereUniqueWithoutCategoryInput.fromJson(
                      json['upsert'][index]))
          : null,
      createMany: json['createMany'] != null
          ? ServiceCreateManyCategoryInputEnvelope.fromJson(json['createMany'])
          : null,
      connect: json['connect'] != null
          ? List.generate(
              json['connect'].length,
              (index) =>
                  ServiceWhereUniqueInput.fromJson(json['connect'][index]))
          : null,
      set$: json['set'] != null
          ? List.generate(json['set'].length,
              (index) => ServiceWhereUniqueInput.fromJson(json['set'][index]))
          : null,
      disconnect: json['disconnect'] != null
          ? List.generate(
              json['disconnect'].length,
              (index) =>
                  ServiceWhereUniqueInput.fromJson(json['disconnect'][index]))
          : null,
      delete: json['delete'] != null
          ? List.generate(
              json['delete'].length,
              (index) =>
                  ServiceWhereUniqueInput.fromJson(json['delete'][index]))
          : null,
      update: json['update'] != null
          ? List.generate(
              json['update'].length,
              (index) =>
                  ServiceUpdateWithWhereUniqueWithoutCategoryInput.fromJson(
                      json['update'][index]))
          : null,
      updateMany: json['updateMany'] != null
          ? List.generate(
              json['updateMany'].length,
              (index) =>
                  ServiceUpdateManyWithWhereWithoutCategoryInput.fromJson(
                      json['updateMany'][index]))
          : null,
      deleteMany: json['deleteMany'] != null
          ? List.generate(
              json['deleteMany'].length,
              (index) =>
                  ServiceScalarWhereInput.fromJson(json['deleteMany'][index]))
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
    if (upsert != null)
      _data['upsert'] = List.generate(
          upsert?.length ?? 0, (index) => upsert![index].toJson());
    if (createMany != null) _data['createMany'] = createMany!.toJson();
    if (connect != null)
      _data['connect'] = List.generate(
          connect?.length ?? 0, (index) => connect![index].toJson());
    if (set$ != null)
      _data['set'] =
          List.generate(set$?.length ?? 0, (index) => set$![index].toJson());
    if (disconnect != null)
      _data['disconnect'] = List.generate(
          disconnect?.length ?? 0, (index) => disconnect![index].toJson());
    if (delete != null)
      _data['delete'] = List.generate(
          delete?.length ?? 0, (index) => delete![index].toJson());
    if (update != null)
      _data['update'] = List.generate(
          update?.length ?? 0, (index) => update![index].toJson());
    if (updateMany != null)
      _data['updateMany'] = List.generate(
          updateMany?.length ?? 0, (index) => updateMany![index].toJson());
    if (deleteMany != null)
      _data['deleteMany'] = List.generate(
          deleteMany?.length ?? 0, (index) => deleteMany![index].toJson());
    return _data;
  }

  ServiceUncheckedUpdateManyWithoutCategoryInput copyWith(
      {List<ServiceCreateWithoutCategoryInput>? create,
      List<ServiceCreateOrConnectWithoutCategoryInput>? connectOrCreate,
      List<ServiceUpsertWithWhereUniqueWithoutCategoryInput>? upsert,
      ServiceCreateManyCategoryInputEnvelope? createMany,
      List<ServiceWhereUniqueInput>? connect,
      List<ServiceWhereUniqueInput>? set$,
      List<ServiceWhereUniqueInput>? disconnect,
      List<ServiceWhereUniqueInput>? delete,
      List<ServiceUpdateWithWhereUniqueWithoutCategoryInput>? update,
      List<ServiceUpdateManyWithWhereWithoutCategoryInput>? updateMany,
      List<ServiceScalarWhereInput>? deleteMany}) {
    return ServiceUncheckedUpdateManyWithoutCategoryInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        upsert: upsert ?? this.upsert,
        createMany: createMany ?? this.createMany,
        connect: connect ?? this.connect,
        set$: set$ ?? this.set$,
        disconnect: disconnect ?? this.disconnect,
        delete: delete ?? this.delete,
        update: update ?? this.update,
        updateMany: updateMany ?? this.updateMany,
        deleteMany: deleteMany ?? this.deleteMany);
  }

  List<Object?> get props => [
        List.from(create ?? []),
        List.from(connectOrCreate ?? []),
        List.from(upsert ?? []),
        createMany,
        List.from(connect ?? []),
        List.from(set$ ?? []),
        List.from(disconnect ?? []),
        List.from(delete ?? []),
        List.from(update ?? []),
        List.from(updateMany ?? []),
        List.from(deleteMany ?? [])
      ];
}
