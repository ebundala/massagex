import 'string_filter.dart';
import 'enum_business_mode_filter.dart';
import 'string_nullable_filter.dart';
import 'json_nullable_filter.dart';
import 'enum_business_status_filter.dart';
import 'enum_record_status_filter.dart';
import 'date_time_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessScalarWhereInput extends Equatable {
  final List<BusinessScalarWhereInput>? AND;
  final List<BusinessScalarWhereInput>? OR;
  final List<BusinessScalarWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? ownerId;
  final EnumBusinessModeFilter? mode;
  final StringNullableFilter? coverId;
  final StringFilter? about;
  final StringFilter? businessName;
  final JsonNullableFilter? metadata;
  final EnumBusinessStatusFilter? status;
  final EnumRecordStatusFilter? recordStatus;
  final StringNullableFilter? locationId;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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

    if (ownerId != null) {
      ownerId!.getFilesVariables(
          field_name: '${field_name}_ownerId', variables: variables);
    }

    if (mode != null) {
      mode!.getFilesVariables(
          field_name: '${field_name}_mode', variables: variables);
    }

    if (coverId != null) {
      coverId!.getFilesVariables(
          field_name: '${field_name}_coverId', variables: variables);
    }

    if (about != null) {
      about!.getFilesVariables(
          field_name: '${field_name}_about', variables: variables);
    }

    if (businessName != null) {
      businessName!.getFilesVariables(
          field_name: '${field_name}_businessName', variables: variables);
    }

    if (metadata != null) {
      metadata!.getFilesVariables(
          field_name: '${field_name}_metadata', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (locationId != null) {
      locationId!.getFilesVariables(
          field_name: '${field_name}_locationId', variables: variables);
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
      if (ownerId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ownerId'),
          value: ownerId!.toValueNode(field_name: '${field_name}_ownerId'),
        ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: mode!.toValueNode(field_name: '${field_name}_mode'),
        ),
      if (coverId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'coverId'),
          value: coverId!.toValueNode(field_name: '${field_name}_coverId'),
        ),
      if (about != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'about'),
          value: about!.toValueNode(field_name: '${field_name}_about'),
        ),
      if (businessName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessName'),
          value: businessName!
              .toValueNode(field_name: '${field_name}_businessName'),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: status!.toValueNode(field_name: '${field_name}_status'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value:
              locationId!.toValueNode(field_name: '${field_name}_locationId'),
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

  BusinessScalarWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.ownerId,
      this.mode,
      this.coverId,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.locationId,
      this.createdAt,
      this.updatedAt});

  static BusinessScalarWhereInput fromJson(Map<dynamic, dynamic> json) {
    return BusinessScalarWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => BusinessScalarWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => BusinessScalarWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => BusinessScalarWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      ownerId: json['ownerId'] != null
          ? StringFilter.fromJson(json['ownerId'])
          : null,
      mode: json['mode'] != null
          ? EnumBusinessModeFilter.fromJson(json['mode'])
          : null,
      coverId: json['coverId'] != null
          ? StringNullableFilter.fromJson(json['coverId'])
          : null,
      about:
          json['about'] != null ? StringFilter.fromJson(json['about']) : null,
      businessName: json['businessName'] != null
          ? StringFilter.fromJson(json['businessName'])
          : null,
      metadata: json['metadata'] != null
          ? JsonNullableFilter.fromJson(json['metadata'])
          : null,
      status: json['status'] != null
          ? EnumBusinessStatusFilter.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      locationId: json['locationId'] != null
          ? StringNullableFilter.fromJson(json['locationId'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
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
    if (ownerId != null) _data['ownerId'] = ownerId!.toJson();
    if (mode != null) _data['mode'] = mode!.toJson();
    if (coverId != null) _data['coverId'] = coverId!.toJson();
    if (about != null) _data['about'] = about!.toJson();
    if (businessName != null) _data['businessName'] = businessName!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (locationId != null) _data['locationId'] = locationId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    return _data;
  }

  BusinessScalarWhereInput copyWith(
      {List<BusinessScalarWhereInput>? AND,
      List<BusinessScalarWhereInput>? OR,
      List<BusinessScalarWhereInput>? NOT,
      StringFilter? id,
      StringFilter? ownerId,
      EnumBusinessModeFilter? mode,
      StringNullableFilter? coverId,
      StringFilter? about,
      StringFilter? businessName,
      JsonNullableFilter? metadata,
      EnumBusinessStatusFilter? status,
      EnumRecordStatusFilter? recordStatus,
      StringNullableFilter? locationId,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt}) {
    return BusinessScalarWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        ownerId,
        mode,
        coverId,
        about,
        businessName,
        metadata,
        status,
        recordStatus,
        locationId,
        createdAt,
        updatedAt
      ];
}
