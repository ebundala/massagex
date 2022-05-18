import 'business_mode.dart';
import 'scalars/json_object.dart';
import 'business_status.dart';
import 'record_status.dart';
import 'attachment_create_nested_one_without_businesses_input.dart';
import 'service_create_nested_many_without_business_input.dart';
import 'order_create_nested_many_without_business_input.dart';
import 'attachment_create_nested_many_without_business_input.dart';
import 'location_create_nested_one_without_businesses_input.dart';
import 'abuse_report_create_nested_many_without_business_input.dart';
import 'favorite_create_nested_many_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessCreateWithoutOwnerInput extends Equatable {
  final String? id;
  final BusinessMode? mode;
  final String about;
  final String businessName;
  final JSONObject? metadata;
  final BusinessStatus? status;
  final RecordStatus? recordStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AttachmentCreateNestedOneWithoutBusinessesInput? cover;
  final ServiceCreateNestedManyWithoutBusinessInput? services;
  final OrderCreateNestedManyWithoutBusinessInput? orders;
  final AttachmentCreateNestedManyWithoutBusinessInput? attachments;
  final LocationCreateNestedOneWithoutBusinessesInput? location;
  final AbuseReportCreateNestedManyWithoutBusinessInput? abuseReports;
  final FavoriteCreateNestedManyWithoutBusinessInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (cover != null) {
      cover!.getFilesVariables(
          field_name: '${field_name}_cover', variables: variables);
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
      if (id != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'id'),
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: ast.EnumValueNode(name: ast.NameNode(value: mode!.toJson())),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'about'),
        value: ast.StringValueNode(value: '${about}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'businessName'),
        value: ast.StringValueNode(value: '${businessName}', isBlock: false),
      ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
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
      if (cover != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'cover'),
          value: cover!.toValueNode(field_name: '${field_name}_cover'),
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

  BusinessCreateWithoutOwnerInput(
      {this.id,
      this.mode,
      required this.about,
      required this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.cover,
      this.services,
      this.orders,
      this.attachments,
      this.location,
      this.abuseReports,
      this.favorites});

  static BusinessCreateWithoutOwnerInput fromJson(Map<dynamic, dynamic> json) {
    return BusinessCreateWithoutOwnerInput(
      id: json['id'],
      mode:
          json['mode'] != null ? BusinessModeExt.fromJson(json['mode']) : null,
      about: json['about'],
      businessName: json['businessName'],
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      status: json['status'] != null
          ? BusinessStatusExt.fromJson(json['status'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      cover: json['cover'] != null
          ? AttachmentCreateNestedOneWithoutBusinessesInput.fromJson(
              json['cover'])
          : null,
      services: json['services'] != null
          ? ServiceCreateNestedManyWithoutBusinessInput.fromJson(
              json['services'])
          : null,
      orders: json['orders'] != null
          ? OrderCreateNestedManyWithoutBusinessInput.fromJson(json['orders'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentCreateNestedManyWithoutBusinessInput.fromJson(
              json['attachments'])
          : null,
      location: json['location'] != null
          ? LocationCreateNestedOneWithoutBusinessesInput.fromJson(
              json['location'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportCreateNestedManyWithoutBusinessInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteCreateNestedManyWithoutBusinessInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (mode != null) _data['mode'] = mode!.toJson();

    _data['about'] = about;

    _data['businessName'] = businessName;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (cover != null) _data['cover'] = cover!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  BusinessCreateWithoutOwnerInput copyWith(
      {String? id,
      BusinessMode? mode,
      String? about,
      String? businessName,
      JSONObject? metadata,
      BusinessStatus? status,
      RecordStatus? recordStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
      AttachmentCreateNestedOneWithoutBusinessesInput? cover,
      ServiceCreateNestedManyWithoutBusinessInput? services,
      OrderCreateNestedManyWithoutBusinessInput? orders,
      AttachmentCreateNestedManyWithoutBusinessInput? attachments,
      LocationCreateNestedOneWithoutBusinessesInput? location,
      AbuseReportCreateNestedManyWithoutBusinessInput? abuseReports,
      FavoriteCreateNestedManyWithoutBusinessInput? favorites}) {
    return BusinessCreateWithoutOwnerInput(
        id: id ?? this.id,
        mode: mode ?? this.mode,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        cover: cover ?? this.cover,
        services: services ?? this.services,
        orders: orders ?? this.orders,
        attachments: attachments ?? this.attachments,
        location: location ?? this.location,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
  }

  List<Object?> get props => [
        id,
        mode,
        about,
        businessName,
        metadata,
        status,
        recordStatus,
        createdAt,
        updatedAt,
        cover,
        services,
        orders,
        attachments,
        location,
        abuseReports,
        favorites
      ];
}
