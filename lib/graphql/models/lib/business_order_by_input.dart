import 'sort_order.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessOrderByInput extends Equatable {
  final SortOrder? id;
  final SortOrder? ownerId;
  final SortOrder? mode;
  final SortOrder? coverId;
  final SortOrder? about;
  final SortOrder? businessName;
  final SortOrder? metadata;
  final SortOrder? status;
  final SortOrder? recordStatus;
  final SortOrder? locationId;
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
      if (ownerId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ownerId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: ownerId!.toJson())),
        ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: ast.EnumValueNode(name: ast.NameNode(value: mode!.toJson())),
        ),
      if (coverId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'coverId'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: coverId!.toJson())),
        ),
      if (about != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'about'),
          value: ast.EnumValueNode(name: ast.NameNode(value: about!.toJson())),
        ),
      if (businessName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessName'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: businessName!.toJson())),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value:
              ast.EnumValueNode(name: ast.NameNode(value: metadata!.toJson())),
        ),
      if (status != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'status'),
          value: ast.EnumValueNode(name: ast.NameNode(value: status!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: locationId!.toJson())),
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

  BusinessOrderByInput(
      {this.id,
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

  static BusinessOrderByInput fromJson(Map<dynamic, dynamic> json) {
    return BusinessOrderByInput(
      id: json['id'] != null ? SortOrderExt.fromJson(json['id']) : null,
      ownerId: json['ownerId'] != null
          ? SortOrderExt.fromJson(json['ownerId'])
          : null,
      mode: json['mode'] != null ? SortOrderExt.fromJson(json['mode']) : null,
      coverId: json['coverId'] != null
          ? SortOrderExt.fromJson(json['coverId'])
          : null,
      about:
          json['about'] != null ? SortOrderExt.fromJson(json['about']) : null,
      businessName: json['businessName'] != null
          ? SortOrderExt.fromJson(json['businessName'])
          : null,
      metadata: json['metadata'] != null
          ? SortOrderExt.fromJson(json['metadata'])
          : null,
      status:
          json['status'] != null ? SortOrderExt.fromJson(json['status']) : null,
      recordStatus: json['recordStatus'] != null
          ? SortOrderExt.fromJson(json['recordStatus'])
          : null,
      locationId: json['locationId'] != null
          ? SortOrderExt.fromJson(json['locationId'])
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

  BusinessOrderByInput copyWith(
      {SortOrder? id,
      SortOrder? ownerId,
      SortOrder? mode,
      SortOrder? coverId,
      SortOrder? about,
      SortOrder? businessName,
      SortOrder? metadata,
      SortOrder? status,
      SortOrder? recordStatus,
      SortOrder? locationId,
      SortOrder? createdAt,
      SortOrder? updatedAt}) {
    return BusinessOrderByInput(
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
