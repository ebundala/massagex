import 'favorite_record_type_create_without_favorites_input.dart';
import 'favorite_record_type_create_or_connect_without_favorites_input.dart';
import 'favorite_record_type_upsert_without_favorites_input.dart';
import 'favorite_record_type_where_unique_input.dart';
import 'favorite_record_type_update_without_favorites_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput
    extends Equatable {
  final FavoriteRecordTypeCreateWithoutFavoritesInput? create;
  final FavoriteRecordTypeCreateOrConnectWithoutFavoritesInput? connectOrCreate;
  final FavoriteRecordTypeUpsertWithoutFavoritesInput? upsert;
  final FavoriteRecordTypeWhereUniqueInput? connect;
  final FavoriteRecordTypeUpdateWithoutFavoritesInput? update;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (create != null) {
      create!.getFilesVariables(
          field_name: '${field_name}_create', variables: variables);
    }

    if (connectOrCreate != null) {
      connectOrCreate!.getFilesVariables(
          field_name: '${field_name}_connectOrCreate', variables: variables);
    }

    if (upsert != null) {
      upsert!.getFilesVariables(
          field_name: '${field_name}_upsert', variables: variables);
    }

    if (connect != null) {
      connect!.getFilesVariables(
          field_name: '${field_name}_connect', variables: variables);
    }

    if (update != null) {
      update!.getFilesVariables(
          field_name: '${field_name}_update', variables: variables);
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
          value: create!.toValueNode(field_name: '${field_name}_create'),
        ),
      if (connectOrCreate != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'connectOrCreate'),
          value: connectOrCreate!
              .toValueNode(field_name: '${field_name}_connectOrCreate'),
        ),
      if (upsert != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'upsert'),
          value: upsert!.toValueNode(field_name: '${field_name}_upsert'),
        ),
      if (connect != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'connect'),
          value: connect!.toValueNode(field_name: '${field_name}_connect'),
        ),
      if (update != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'update'),
          value: update!.toValueNode(field_name: '${field_name}_update'),
        )
    ]);
  }

  FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput(
      {this.create,
      this.connectOrCreate,
      this.upsert,
      this.connect,
      this.update});

  static FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput fromJson(
      Map<dynamic, dynamic> json) {
    return FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput(
      create: json['create'] != null
          ? FavoriteRecordTypeCreateWithoutFavoritesInput.fromJson(
              json['create'])
          : null,
      connectOrCreate: json['connectOrCreate'] != null
          ? FavoriteRecordTypeCreateOrConnectWithoutFavoritesInput.fromJson(
              json['connectOrCreate'])
          : null,
      upsert: json['upsert'] != null
          ? FavoriteRecordTypeUpsertWithoutFavoritesInput.fromJson(
              json['upsert'])
          : null,
      connect: json['connect'] != null
          ? FavoriteRecordTypeWhereUniqueInput.fromJson(json['connect'])
          : null,
      update: json['update'] != null
          ? FavoriteRecordTypeUpdateWithoutFavoritesInput.fromJson(
              json['update'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (create != null) _data['create'] = create!.toJson();
    if (connectOrCreate != null)
      _data['connectOrCreate'] = connectOrCreate!.toJson();
    if (upsert != null) _data['upsert'] = upsert!.toJson();
    if (connect != null) _data['connect'] = connect!.toJson();
    if (update != null) _data['update'] = update!.toJson();
    return _data;
  }

  FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput copyWith(
      {FavoriteRecordTypeCreateWithoutFavoritesInput? create,
      FavoriteRecordTypeCreateOrConnectWithoutFavoritesInput? connectOrCreate,
      FavoriteRecordTypeUpsertWithoutFavoritesInput? upsert,
      FavoriteRecordTypeWhereUniqueInput? connect,
      FavoriteRecordTypeUpdateWithoutFavoritesInput? update}) {
    return FavoriteRecordTypeUpdateOneRequiredWithoutFavoritesInput(
        create: create ?? this.create,
        connectOrCreate: connectOrCreate ?? this.connectOrCreate,
        upsert: upsert ?? this.upsert,
        connect: connect ?? this.connect,
        update: update ?? this.update);
  }

  List<Object?> get props => [create, connectOrCreate, upsert, connect, update];
}