import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LocationOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? name;
  final SortOrder? lat;
  final SortOrder? lon;
  final SortOrder? recordStatus;
  final SortOrder? createdAt;
  final SortOrder? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.EnumValueNode(name: ast.NameNode(value: id!.toJson())),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.EnumValueNode(name: ast.NameNode(value: name!.toJson())),
        ),
      if (lat != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lat'),
          value: ast.EnumValueNode(name: ast.NameNode(value: lat!.toJson())),
        ),
      if (lon != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lon'),
          value: ast.EnumValueNode(name: ast.NameNode(value: lon!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: createdAt!.toJson())),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: updatedAt!.toJson())),
        )
    ]);
  }

  LocationOrderByInput(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static LocationOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return LocationOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      name: json['name'] != null ? SortOrderExt.fromJson(json['name']) : null,
      lat: json['lat'] != null ? SortOrderExt.fromJson(json['lat']) : null,
      lon: json['lon'] != null ? SortOrderExt.fromJson(json['lon']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? SortOrderExt.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? SortOrderExt.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (lat != null) _data['lat'] = lat!.toJson();
    if (lon != null) _data['lon'] = lon!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  LocationOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? name,
      SortOrder? lat,
      SortOrder? lon,
      SortOrder? recordStatus,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return LocationOrderByInput(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, name, lat, lon, recordStatus, createdAt, updatedAt];
}
