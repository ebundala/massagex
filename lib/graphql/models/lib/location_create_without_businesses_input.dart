import 'record_status.dart';
import 'user_create_nested_many_without_location_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LocationCreateWithoutBusinessesInput extends Equatable {
  final String? id;
  final String? name;
  final double lat;
  final double lon;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserCreateNestedManyWithoutLocationInput? users;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (users != null) {
      users!.getFilesVariables(
          field_name: '${field_name}_users', variables: variables);
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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: ast.StringValueNode(value: '${name!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'lat'),
        value: ast.FloatValueNode(value: '${lat}'),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'lon'),
        value: ast.FloatValueNode(value: '${lon}'),
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
          value: ast.StringValueNode(
              value: createdAt!.toIso8601String(), isBlock: false),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: ast.StringValueNode(
              value: updatedAt!.toIso8601String(), isBlock: false),
        ),
      if (users != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'users'),
          value: users!.toValueNode(field_name: '${field_name}_users'),
        )
    ]);
  }

  LocationCreateWithoutBusinessesInput(
      {this.id,
      this.name,
      required this.lat,
      required this.lon,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.users});

  static LocationCreateWithoutBusinessesInput fromJson(
      Map<dynamic, dynamic> json) {
    return LocationCreateWithoutBusinessesInput(
      id: json['id'],
      name: json['name'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      users: json['users'] != null
          ? UserCreateNestedManyWithoutLocationInput.fromJson(json['users'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (name != null) _data['name'] = name;

    _data['lat'] = lat;

    _data['lon'] = lon;
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (users != null) _data['users'] = users!.toJson();
    return _data;
  }

  LocationCreateWithoutBusinessesInput copyWith(
      {String? id,
      String? name,
      double? lat,
      double? lon,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      UserCreateNestedManyWithoutLocationInput? users}) {
    return LocationCreateWithoutBusinessesInput(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        users: users ?? this.users);
  }

  List<Object?> get props =>
      [id, name, lat, lon, recordStatus, createdAt, updatedAt, users];
}
