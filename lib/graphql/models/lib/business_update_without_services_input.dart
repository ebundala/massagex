import 'string_field_update_operations_input.dart';
import 'enum_business_mode_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'enum_business_status_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'user_update_one_required_without_business_profile_input.dart';
import 'attachment_update_one_without_businesses_input.dart';
import 'order_update_many_without_business_input.dart';
import 'attachment_update_many_without_business_input.dart';
import 'location_update_one_without_businesses_input.dart';
import 'abuse_report_update_many_without_business_input.dart';
import 'favorite_update_many_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessUpdateWithoutServicesInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final EnumBusinessModeFieldUpdateOperationsInput? mode;
  final StringFieldUpdateOperationsInput? about;
  final StringFieldUpdateOperationsInput? businessName;
  final JSONObject? metadata;
  final EnumBusinessStatusFieldUpdateOperationsInput? status;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final UserUpdateOneRequiredWithoutBusinessProfileInput? owner;
  final AttachmentUpdateOneWithoutBusinessesInput? cover;
  final OrderUpdateManyWithoutBusinessInput? orders;
  final AttachmentUpdateManyWithoutBusinessInput? attachments;
  final LocationUpdateOneWithoutBusinessesInput? location;
  final AbuseReportUpdateManyWithoutBusinessInput? abuseReports;
  final FavoriteUpdateManyWithoutBusinessInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (mode != null) {
      mode!.getFilesVariables(
          field_name: '${field_name}_mode', variables: variables);
    }

    if (about != null) {
      about!.getFilesVariables(
          field_name: '${field_name}_about', variables: variables);
    }

    if (businessName != null) {
      businessName!.getFilesVariables(
          field_name: '${field_name}_businessName', variables: variables);
    }

    if (status != null) {
      status!.getFilesVariables(
          field_name: '${field_name}_status', variables: variables);
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

    if (owner != null) {
      owner!.getFilesVariables(
          field_name: '${field_name}_owner', variables: variables);
    }

    if (cover != null) {
      cover!.getFilesVariables(
          field_name: '${field_name}_cover', variables: variables);
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
          value: id!.toValueNode(field_name: '${field_name}_id'),
        ),
      if (mode != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'mode'),
          value: mode!.toValueNode(field_name: '${field_name}_mode'),
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
      if (owner != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'owner'),
          value: owner!.toValueNode(field_name: '${field_name}_owner'),
        ),
      if (cover != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'cover'),
          value: cover!.toValueNode(field_name: '${field_name}_cover'),
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

  BusinessUpdateWithoutServicesInput(
      {this.id,
      this.mode,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.owner,
      this.cover,
      this.orders,
      this.attachments,
      this.location,
      this.abuseReports,
      this.favorites});

  static BusinessUpdateWithoutServicesInput fromJson(
      Map<dynamic, dynamic> json) {
    return BusinessUpdateWithoutServicesInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      mode: json['mode'] != null
          ? EnumBusinessModeFieldUpdateOperationsInput.fromJson(json['mode'])
          : null,
      about: json['about'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['about'])
          : null,
      businessName: json['businessName'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['businessName'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      status: json['status'] != null
          ? EnumBusinessStatusFieldUpdateOperationsInput.fromJson(
              json['status'])
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
      owner: json['owner'] != null
          ? UserUpdateOneRequiredWithoutBusinessProfileInput.fromJson(
              json['owner'])
          : null,
      cover: json['cover'] != null
          ? AttachmentUpdateOneWithoutBusinessesInput.fromJson(json['cover'])
          : null,
      orders: json['orders'] != null
          ? OrderUpdateManyWithoutBusinessInput.fromJson(json['orders'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentUpdateManyWithoutBusinessInput.fromJson(
              json['attachments'])
          : null,
      location: json['location'] != null
          ? LocationUpdateOneWithoutBusinessesInput.fromJson(json['location'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUpdateManyWithoutBusinessInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUpdateManyWithoutBusinessInput.fromJson(json['favorites'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (mode != null) _data['mode'] = mode!.toJson();
    if (about != null) _data['about'] = about!.toJson();
    if (businessName != null) _data['businessName'] = businessName!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (status != null) _data['status'] = status!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (owner != null) _data['owner'] = owner!.toJson();
    if (cover != null) _data['cover'] = cover!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  BusinessUpdateWithoutServicesInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      EnumBusinessModeFieldUpdateOperationsInput? mode,
      StringFieldUpdateOperationsInput? about,
      StringFieldUpdateOperationsInput? businessName,
      JSONObject? metadata,
      EnumBusinessStatusFieldUpdateOperationsInput? status,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      UserUpdateOneRequiredWithoutBusinessProfileInput? owner,
      AttachmentUpdateOneWithoutBusinessesInput? cover,
      OrderUpdateManyWithoutBusinessInput? orders,
      AttachmentUpdateManyWithoutBusinessInput? attachments,
      LocationUpdateOneWithoutBusinessesInput? location,
      AbuseReportUpdateManyWithoutBusinessInput? abuseReports,
      FavoriteUpdateManyWithoutBusinessInput? favorites}) {
    return BusinessUpdateWithoutServicesInput(
        id: id ?? this.id,
        mode: mode ?? this.mode,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        owner: owner ?? this.owner,
        cover: cover ?? this.cover,
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
        owner,
        cover,
        orders,
        attachments,
        location,
        abuseReports,
        favorites
      ];
}
