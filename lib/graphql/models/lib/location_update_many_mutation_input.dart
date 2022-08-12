import 'string_field_update_operations_input.dart';
import 'float_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LocationUpdateManyMutationInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? name;
  final FloatFieldUpdateOperationsInput? lat;
  final FloatFieldUpdateOperationsInput? lon;
  final FloatFieldUpdateOperationsInput? heading;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (name != null) {
      name!.getFilesVariables(
          field_name: '${field_name}_name', variables: variables);
    }

    if (lat != null) {
      lat!.getFilesVariables(
          field_name: '${field_name}_lat', variables: variables);
    }

    if (lon != null) {
      lon!.getFilesVariables(
          field_name: '${field_name}_lon', variables: variables);
    }

    if (heading != null) {
      heading!.getFilesVariables(
          field_name: '${field_name}_heading', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (name != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'name'),
          value: name!.toValueNode(field_name: '${field_name}_name'),
        ),
      if (lat != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lat'),
          value: lat!.toValueNode(field_name: '${field_name}_lat'),
        ),
      if (lon != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'lon'),
          value: lon!.toValueNode(field_name: '${field_name}_lon'),
        ),
      if (heading != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'heading'),
          value: heading!.toValueNode(field_name: '${field_name}_heading'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (createdAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'createdAt'),
          value: createdAt!.toValueNode(field_name: '${field_name}_createdAt'),
        ),
      if (updatedAt != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'updatedAt'),
          value: updatedAt!.toValueNode(field_name: '${field_name}_updatedAt'),
        )
    ]);
  }

  LocationUpdateManyMutationInput(
      {this.id,
      this.name,
      this.lat,
      this.lon,
      this.heading,
      this.recordStatus,
      this.createdAt,
      this.updatedAt});

  static LocationUpdateManyMutationInput fromJson(Map<dynamic, dynamic> json) {
    return LocationUpdateManyMutationInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      name: json['name'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['name'])
          : null,
      lat: json['lat'] != null
          ? FloatFieldUpdateOperationsInput.fromJson(json['lat'])
          : null,
      lon: json['lon'] != null
          ? FloatFieldUpdateOperationsInput.fromJson(json['lon'])
          : null,
      heading: json['heading'] != null
          ? FloatFieldUpdateOperationsInput.fromJson(json['heading'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (lat != null) _data['lat'] = lat!.toJson();
    if (lon != null) _data['lon'] = lon!.toJson();
    if (heading != null) _data['heading'] = heading!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  LocationUpdateManyMutationInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? name,
      FloatFieldUpdateOperationsInput? lat,
      FloatFieldUpdateOperationsInput? lon,
      FloatFieldUpdateOperationsInput? heading,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt}) {
    return LocationUpdateManyMutationInput(
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props =>
      [id, name, lat, lon, heading, recordStatus, createdAt, updatedAt];
}
