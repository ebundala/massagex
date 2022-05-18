import 'string_filter.dart';
import 'user_relation_filter.dart';
import 'enum_business_mode_filter.dart';
import 'attachment_relation_filter.dart';
import 'string_nullable_filter.dart';
import 'json_nullable_filter.dart';
import 'enum_business_status_filter.dart';
import 'enum_record_status_filter.dart';
import 'service_list_relation_filter.dart';
import 'order_list_relation_filter.dart';
import 'attachment_list_relation_filter.dart';
import 'location_relation_filter.dart';
import 'date_time_filter.dart';
import 'abuse_report_list_relation_filter.dart';
import 'favorite_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessWhereInput extends Equatable {
  final List<BusinessWhereInput>? AND;
  final List<BusinessWhereInput>? OR;
  final List<BusinessWhereInput>? NOT;
  final StringFilter? id;
  final UserRelationFilter? owner;
  final StringFilter? ownerId;
  final EnumBusinessModeFilter? mode;
  final AttachmentRelationFilter? cover;
  final StringNullableFilter? coverId;
  final StringFilter? about;
  final StringFilter? businessName;
  final JsonNullableFilter? metadata;
  final EnumBusinessStatusFilter? status;
  final EnumRecordStatusFilter? recordStatus;
  final ServiceListRelationFilter? services;
  final OrderListRelationFilter? orders;
  final AttachmentListRelationFilter? attachments;
  final LocationRelationFilter? location;
  final StringNullableFilter? locationId;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final AbuseReportListRelationFilter? abuseReports;
  final FavoriteListRelationFilter? favorites;

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

    if (owner != null) {
      owner!.getFilesVariables(
          field_name: '${field_name}_owner', variables: variables);
    }

    if (ownerId != null) {
      ownerId!.getFilesVariables(
          field_name: '${field_name}_ownerId', variables: variables);
    }

    if (mode != null) {
      mode!.getFilesVariables(
          field_name: '${field_name}_mode', variables: variables);
    }

    if (cover != null) {
      cover!.getFilesVariables(
          field_name: '${field_name}_cover', variables: variables);
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

    if (services != null) {
      services!.getFilesVariables(
          field_name: '${field_name}_services', variables: variables);
    }

    if (orders != null) {
      orders!.getFilesVariables(
          field_name: '${field_name}_orders', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
    }

    if (location != null) {
      location!.getFilesVariables(
          field_name: '${field_name}_location', variables: variables);
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

    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
    }

    if (favorites != null) {
      favorites!.getFilesVariables(
          field_name: '${field_name}_favorites', variables: variables);
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
      if (owner != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'owner'),
          value: owner!.toValueNode(field_name: '${field_name}_owner'),
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
      if (cover != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'cover'),
          value: cover!.toValueNode(field_name: '${field_name}_cover'),
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
      if (services != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'services'),
          value: services!.toValueNode(field_name: '${field_name}_services'),
        ),
      if (orders != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'orders'),
          value: orders!.toValueNode(field_name: '${field_name}_orders'),
        ),
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
        ),
      if (location != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'location'),
          value: location!.toValueNode(field_name: '${field_name}_location'),
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
        ),
      if (abuseReports != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReports'),
          value: abuseReports!
              .toValueNode(field_name: '${field_name}_abuseReports'),
        ),
      if (favorites != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favorites'),
          value: favorites!.toValueNode(field_name: '${field_name}_favorites'),
        )
    ]);
  }

  BusinessWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.owner,
      this.ownerId,
      this.mode,
      this.cover,
      this.coverId,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.services,
      this.orders,
      this.attachments,
      this.location,
      this.locationId,
      this.createdAt,
      this.updatedAt,
      this.abuseReports,
      this.favorites});

  static BusinessWhereInput fromJson(Map<dynamic, dynamic> json) {
    return BusinessWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => BusinessWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => BusinessWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => BusinessWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      owner: json['owner'] != null
          ? UserRelationFilter.fromJson(json['owner'])
          : null,
      ownerId: json['ownerId'] != null
          ? StringFilter.fromJson(json['ownerId'])
          : null,
      mode: json['mode'] != null
          ? EnumBusinessModeFilter.fromJson(json['mode'])
          : null,
      cover: json['cover'] != null
          ? AttachmentRelationFilter.fromJson(json['cover'])
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
      services: json['services'] != null
          ? ServiceListRelationFilter.fromJson(json['services'])
          : null,
      orders: json['orders'] != null
          ? OrderListRelationFilter.fromJson(json['orders'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentListRelationFilter.fromJson(json['attachments'])
          : null,
      location: json['location'] != null
          ? LocationRelationFilter.fromJson(json['location'])
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
      abuseReports: json['abuseReports'] != null
          ? AbuseReportListRelationFilter.fromJson(json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteListRelationFilter.fromJson(json['favorites'])
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
    if (owner != null) _data['owner'] = owner!.toJson();
    if (ownerId != null) _data['ownerId'] = ownerId!.toJson();
    if (mode != null) _data['mode'] = mode!.toJson();
    if (cover != null) _data['cover'] = cover!.toJson();
    if (coverId != null) _data['coverId'] = coverId!.toJson();
    if (about != null) _data['about'] = about!.toJson();
    if (businessName != null) _data['businessName'] = businessName!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (locationId != null) _data['locationId'] = locationId!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  BusinessWhereInput copyWith(
      {List<BusinessWhereInput>? AND,
      List<BusinessWhereInput>? OR,
      List<BusinessWhereInput>? NOT,
      StringFilter? id,
      UserRelationFilter? owner,
      StringFilter? ownerId,
      EnumBusinessModeFilter? mode,
      AttachmentRelationFilter? cover,
      StringNullableFilter? coverId,
      StringFilter? about,
      StringFilter? businessName,
      JsonNullableFilter? metadata,
      EnumBusinessStatusFilter? status,
      EnumRecordStatusFilter? recordStatus,
      ServiceListRelationFilter? services,
      OrderListRelationFilter? orders,
      AttachmentListRelationFilter? attachments,
      LocationRelationFilter? location,
      StringNullableFilter? locationId,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      AbuseReportListRelationFilter? abuseReports,
      FavoriteListRelationFilter? favorites}) {
    return BusinessWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        owner: owner ?? this.owner,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        cover: cover ?? this.cover,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        attachments: attachments ?? this.attachments,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        owner,
        ownerId,
        mode,
        cover,
        coverId,
        about,
        businessName,
        metadata,
        status,
        recordStatus,
        services,
        orders,
        attachments,
        location,
        locationId,
        createdAt,
        updatedAt,
        abuseReports,
        favorites
      ];
}
