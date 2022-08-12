import 'lat_lon.dart';
import 'string_filter.dart';
import 'float_filter.dart';
import 'enum_record_status_filter.dart';
import 'date_time_filter.dart';
import 'user_list_relation_filter.dart';
import 'business_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class LocationWhereInput extends Equatable {
  final double? within;
  final double? notWithin;
  final LatLon? nearBy;
  final String? nearByName;
  final List<LocationWhereInput>? AND;
  final List<LocationWhereInput>? OR;
  final List<LocationWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? name;
  final FloatFilter? lat;
  final FloatFilter? lon;
  final FloatFilter? heading;
  final EnumRecordStatusFilter? recordStatus;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final UserListRelationFilter? users;
  final BusinessListRelationFilter? businesses;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (nearBy != null) {
      nearBy!.getFilesVariables(
          field_name: '${field_name}_nearBy', variables: variables);
    }

    if (AND != null) {
      int i = -1;
      AND!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_AND_$i', variables: variables);
      });
    }
    if (OR != null) {
      int i = -1;
      OR!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_OR_$i', variables: variables);
      });
    }
    if (NOT != null) {
      int i = -1;
      NOT!.forEach((e) {
        i++;
        e.getFilesVariables(
            field_name: '${field_name}_NOT_$i', variables: variables);
      });
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

    if (users != null) {
      users!.getFilesVariables(
          field_name: '${field_name}_users', variables: variables);
    }

    if (businesses != null) {
      businesses!.getFilesVariables(
          field_name: '${field_name}_businesses', variables: variables);
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
      if (within != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'within'),
          value: ast.FloatValueNode(value: '${within!}'),
        ),
      if (notWithin != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'notWithin'),
          value: ast.FloatValueNode(value: '${notWithin!}'),
        ),
      if (nearBy != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'nearBy'),
          value: nearBy!.toValueNode(field_name: '${field_name}_nearBy'),
        ),
      if (nearByName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'nearByName'),
          value: ast.StringValueNode(value: '${nearByName!}', isBlock: false),
        ),
      if (AND != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'AND'),
            value: ast.ListValueNode(values: [
              ...AND!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_AND_$i')
                  ];
                },
              )
            ])),
      if (OR != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'OR'),
            value: ast.ListValueNode(values: [
              ...OR!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_OR_$i')
                  ];
                },
              )
            ])),
      if (NOT != null)
        ast.ObjectFieldNode(
            name: ast.NameNode(value: 'NOT'),
            value: ast.ListValueNode(values: [
              ...NOT!.fold(
                [],
                (v, e) {
                  // ignore: unused_local_variable
                  int i = v.length;
                  return [
                    ...v,
                    e.toValueNode(field_name: '${field_name}_NOT_$i')
                  ];
                },
              )
            ])),
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
        ),
      if (users != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'users'),
          value: users!.toValueNode(field_name: '${field_name}_users'),
        ),
      if (businesses != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businesses'),
          value:
              businesses!.toValueNode(field_name: '${field_name}_businesses'),
        )
    ]);
  }

  LocationWhereInput(
      {this.within,
      this.notWithin,
      this.nearBy,
      this.nearByName,
      this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.name,
      this.lat,
      this.lon,
      this.heading,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.users,
      this.businesses});

  static LocationWhereInput fromJson(Map<dynamic, dynamic> json) {
    return LocationWhereInput(
      within: json['within']?.toDouble(),
      notWithin: json['notWithin']?.toDouble(),
      nearBy: json['nearBy'] != null ? LatLon.fromJson(json['nearBy']) : null,
      nearByName: json['nearByName'],
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => LocationWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => LocationWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => LocationWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      name: json['name'] != null ? StringFilter.fromJson(json['name']) : null,
      lat: json['lat'] != null ? FloatFilter.fromJson(json['lat']) : null,
      lon: json['lon'] != null ? FloatFilter.fromJson(json['lon']) : null,
      heading: json['heading'] != null
          ? FloatFilter.fromJson(json['heading'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      users: json['users'] != null
          ? UserListRelationFilter.fromJson(json['users'])
          : null,
      businesses: json['businesses'] != null
          ? BusinessListRelationFilter.fromJson(json['businesses'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (within != null) _data['within'] = within;
    if (notWithin != null) _data['notWithin'] = notWithin;
    if (nearBy != null) _data['nearBy'] = nearBy!.toJson();
    if (nearByName != null) _data['nearByName'] = nearByName;
    if (AND != null)
      _data['AND'] =
          List.generate(AND?.length ?? 0, (index) => AND![index].toJson());
    if (OR != null)
      _data['OR'] =
          List.generate(OR?.length ?? 0, (index) => OR![index].toJson());
    if (NOT != null)
      _data['NOT'] =
          List.generate(NOT?.length ?? 0, (index) => NOT![index].toJson());
    if (id != null) _data['id'] = id!.toJson();
    if (name != null) _data['name'] = name!.toJson();
    if (lat != null) _data['lat'] = lat!.toJson();
    if (lon != null) _data['lon'] = lon!.toJson();
    if (heading != null) _data['heading'] = heading!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (users != null) _data['users'] = users!.toJson();
    if (businesses != null) _data['businesses'] = businesses!.toJson();
    return _data;
  }

  LocationWhereInput copyWith(
      {double? within,
      double? notWithin,
      LatLon? nearBy,
      String? nearByName,
      List<LocationWhereInput>? AND,
      List<LocationWhereInput>? OR,
      List<LocationWhereInput>? NOT,
      StringFilter? id,
      StringFilter? name,
      FloatFilter? lat,
      FloatFilter? lon,
      FloatFilter? heading,
      EnumRecordStatusFilter? recordStatus,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      UserListRelationFilter? users,
      BusinessListRelationFilter? businesses}) {
    return LocationWhereInput(
        within: within ?? this.within,
        notWithin: notWithin ?? this.notWithin,
        nearBy: nearBy ?? this.nearBy,
        nearByName: nearByName ?? this.nearByName,
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        name: name ?? this.name,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        heading: heading ?? this.heading,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        users: users ?? this.users,
        businesses: businesses ?? this.businesses);
  }

  List<Object?> get props => [
        within,
        notWithin,
        nearBy,
        nearByName,
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        name,
        lat,
        lon,
        heading,
        recordStatus,
        createdAt,
        updatedAt,
        users,
        businesses
      ];
}
