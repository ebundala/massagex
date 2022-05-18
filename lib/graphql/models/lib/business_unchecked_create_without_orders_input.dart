import 'business_mode.dart';
import 'scalars/json_object.dart';
import 'business_status.dart';
import 'record_status.dart';
import 'service_unchecked_create_nested_many_without_business_input.dart';
import 'attachment_unchecked_create_nested_many_without_business_input.dart';
import 'abuse_report_unchecked_create_nested_many_without_business_input.dart';
import 'favorite_unchecked_create_nested_many_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessUncheckedCreateWithoutOrdersInput extends Equatable {
  final String? id;
  final String ownerId;
  final BusinessMode? mode;
  final String? coverId;
  final String about;
  final String businessName;
  final JSONObject? metadata;
  final BusinessStatus? status;
  final RecordStatus? recordStatus;
  final String? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ServiceUncheckedCreateNestedManyWithoutBusinessInput? services;
  final AttachmentUncheckedCreateNestedManyWithoutBusinessInput? attachments;
  final AbuseReportUncheckedCreateNestedManyWithoutBusinessInput? abuseReports;
  final FavoriteUncheckedCreateNestedManyWithoutBusinessInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (services != null) {
      services!.getFilesVariables(
          field_name: '${field_name}_services', variables: variables);
    }

    if (attachments != null) {
      attachments!.getFilesVariables(
          field_name: '${field_name}_attachments', variables: variables);
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
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'ownerId'),
        value: ast.StringValueNode(value: '${ownerId}', isBlock: false),
      ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: ast.EnumValueNode(name: ast.NameNode(value: mode!.toJson())),
        ),
      if (coverId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'coverId'),
          value: ast.StringValueNode(value: '${coverId!}', isBlock: false),
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
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value: ast.StringValueNode(value: '${locationId!}', isBlock: false),
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
      if (services != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'services'),
          value: services!.toValueNode(field_name: '${field_name}_services'),
        ),
      if (attachments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'attachments'),
          value:
              attachments!.toValueNode(field_name: '${field_name}_attachments'),
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

  BusinessUncheckedCreateWithoutOrdersInput(
      {this.id,
      required this.ownerId,
      this.mode,
      this.coverId,
      required this.about,
      required this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.locationId,
      this.createdAt,
      this.updatedAt,
      this.services,
      this.attachments,
      this.abuseReports,
      this.favorites});

  static BusinessUncheckedCreateWithoutOrdersInput fromJson(
      Map<dynamic, dynamic> json) {
    return BusinessUncheckedCreateWithoutOrdersInput(
      id: json['id'],
      ownerId: json['ownerId'],
      mode:
          json['mode'] != null ? BusinessModeExt.fromJson(json['mode']) : null,
      coverId: json['coverId'],
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
      locationId: json['locationId'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      services: json['services'] != null
          ? ServiceUncheckedCreateNestedManyWithoutBusinessInput.fromJson(
              json['services'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentUncheckedCreateNestedManyWithoutBusinessInput.fromJson(
              json['attachments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedCreateNestedManyWithoutBusinessInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedCreateNestedManyWithoutBusinessInput.fromJson(
              json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['ownerId'] = ownerId;
    if (mode != null) _data['mode'] = mode!.toJson();
    if (coverId != null) _data['coverId'] = coverId;

    _data['about'] = about;

    _data['businessName'] = businessName;
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (locationId != null) _data['locationId'] = locationId;
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (services != null) _data['services'] = services!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  BusinessUncheckedCreateWithoutOrdersInput copyWith(
      {String? id,
      String? ownerId,
      BusinessMode? mode,
      String? coverId,
      String? about,
      String? businessName,
      JSONObject? metadata,
      BusinessStatus? status,
      RecordStatus? recordStatus,
      String? locationId,
      DateTime? createdAt,
      DateTime? updatedAt,
      ServiceUncheckedCreateNestedManyWithoutBusinessInput? services,
      AttachmentUncheckedCreateNestedManyWithoutBusinessInput? attachments,
      AbuseReportUncheckedCreateNestedManyWithoutBusinessInput? abuseReports,
      FavoriteUncheckedCreateNestedManyWithoutBusinessInput? favorites}) {
    return BusinessUncheckedCreateWithoutOrdersInput(
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
        updatedAt: updatedAt ?? this.updatedAt,
        services: services ?? this.services,
        attachments: attachments ?? this.attachments,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites);
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
        updatedAt,
        services,
        attachments,
        abuseReports,
        favorites
      ];
}
