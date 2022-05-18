import 'string_field_update_operations_input.dart';
import 'enum_business_mode_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'enum_business_status_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'date_time_field_update_operations_input.dart';
import 'service_unchecked_update_many_without_business_input.dart';
import 'order_unchecked_update_many_without_business_input.dart';
import 'attachment_unchecked_update_many_without_business_input.dart';
import 'abuse_report_unchecked_update_many_without_business_input.dart';
import 'favorite_unchecked_update_many_without_business_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class BusinessUncheckedUpdateWithoutLocationInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final StringFieldUpdateOperationsInput? ownerId;
  final EnumBusinessModeFieldUpdateOperationsInput? mode;
  final NullableStringFieldUpdateOperationsInput? coverId;
  final StringFieldUpdateOperationsInput? about;
  final StringFieldUpdateOperationsInput? businessName;
  final JSONObject? metadata;
  final EnumBusinessStatusFieldUpdateOperationsInput? status;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final ServiceUncheckedUpdateManyWithoutBusinessInput? services;
  final OrderUncheckedUpdateManyWithoutBusinessInput? orders;
  final AttachmentUncheckedUpdateManyWithoutBusinessInput? attachments;
  final AbuseReportUncheckedUpdateManyWithoutBusinessInput? abuseReports;
  final FavoriteUncheckedUpdateManyWithoutBusinessInput? favorites;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
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

  BusinessUncheckedUpdateWithoutLocationInput(
      {this.id,
      this.ownerId,
      this.mode,
      this.coverId,
      this.about,
      this.businessName,
      this.metadata,
      this.status,
      this.recordStatus,
      this.createdAt,
      this.updatedAt,
      this.services,
      this.orders,
      this.attachments,
      this.abuseReports,
      this.favorites});

  static BusinessUncheckedUpdateWithoutLocationInput fromJson(
      Map<dynamic, dynamic> json) {
    return BusinessUncheckedUpdateWithoutLocationInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      ownerId: json['ownerId'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['ownerId'])
          : null,
      mode: json['mode'] != null
          ? EnumBusinessModeFieldUpdateOperationsInput.fromJson(json['mode'])
          : null,
      coverId: json['coverId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['coverId'])
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
      services: json['services'] != null
          ? ServiceUncheckedUpdateManyWithoutBusinessInput.fromJson(
              json['services'])
          : null,
      orders: json['orders'] != null
          ? OrderUncheckedUpdateManyWithoutBusinessInput.fromJson(
              json['orders'])
          : null,
      attachments: json['attachments'] != null
          ? AttachmentUncheckedUpdateManyWithoutBusinessInput.fromJson(
              json['attachments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedUpdateManyWithoutBusinessInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedUpdateManyWithoutBusinessInput.fromJson(
              json['favorites'])
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
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (services != null) _data['services'] = services!.toJson();
    if (orders != null) _data['orders'] = orders!.toJson();
    if (attachments != null) _data['attachments'] = attachments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    return _data;
  }

  BusinessUncheckedUpdateWithoutLocationInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      StringFieldUpdateOperationsInput? ownerId,
      EnumBusinessModeFieldUpdateOperationsInput? mode,
      NullableStringFieldUpdateOperationsInput? coverId,
      StringFieldUpdateOperationsInput? about,
      StringFieldUpdateOperationsInput? businessName,
      JSONObject? metadata,
      EnumBusinessStatusFieldUpdateOperationsInput? status,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      ServiceUncheckedUpdateManyWithoutBusinessInput? services,
      OrderUncheckedUpdateManyWithoutBusinessInput? orders,
      AttachmentUncheckedUpdateManyWithoutBusinessInput? attachments,
      AbuseReportUncheckedUpdateManyWithoutBusinessInput? abuseReports,
      FavoriteUncheckedUpdateManyWithoutBusinessInput? favorites}) {
    return BusinessUncheckedUpdateWithoutLocationInput(
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        mode: mode ?? this.mode,
        coverId: coverId ?? this.coverId,
        about: about ?? this.about,
        businessName: businessName ?? this.businessName,
        metadata: metadata ?? this.metadata,
        status: status ?? this.status,
        recordStatus: recordStatus ?? this.recordStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        services: services ?? this.services,
        orders: orders ?? this.orders,
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
        createdAt,
        updatedAt,
        services,
        orders,
        attachments,
        abuseReports,
        favorites
      ];
}
