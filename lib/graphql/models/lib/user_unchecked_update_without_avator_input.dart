import 'string_field_update_operations_input.dart';
import 'nullable_string_field_update_operations_input.dart';
import 'nullable_date_time_field_update_operations_input.dart';
import 'bool_field_update_operations_input.dart';
import 'enum_role_field_update_operations_input.dart';
import 'enum_record_status_field_update_operations_input.dart';
import 'enum_account_status_field_update_operations_input.dart';
import 'enum_gender_field_update_operations_input.dart';
import 'scalars/json_object.dart';
import 'date_time_field_update_operations_input.dart';
import 'business_unchecked_update_one_without_owner_input.dart';
import 'device_unchecked_update_one_without_user_input.dart';
import 'order_unchecked_update_many_without_owner_input.dart';
import 'review_unchecked_update_many_without_reviewee_input.dart';
import 'review_unchecked_update_many_without_author_input.dart';
import 'comment_unchecked_update_many_without_author_input.dart';
import 'abuse_report_unchecked_update_many_without_user_input.dart';
import 'favorite_unchecked_update_many_without_user_input.dart';
import 'abuse_report_unchecked_update_many_without_author_input.dart';
import 'favorite_unchecked_update_many_without_author_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserUncheckedUpdateWithoutAvatorInput extends Equatable {
  final StringFieldUpdateOperationsInput? id;
  final NullableStringFieldUpdateOperationsInput? email;
  final NullableStringFieldUpdateOperationsInput? displayName;
  final NullableStringFieldUpdateOperationsInput? phoneNumber;
  final NullableDateTimeFieldUpdateOperationsInput? dateOfBirth;
  final BoolFieldUpdateOperationsInput? emailVerified;
  final BoolFieldUpdateOperationsInput? disabled;
  final EnumRoleFieldUpdateOperationsInput? role;
  final EnumRecordStatusFieldUpdateOperationsInput? recordStatus;
  final EnumAccountStatusFieldUpdateOperationsInput? state;
  final EnumGenderFieldUpdateOperationsInput? gender;
  final JSONObject? metadata;
  final DateTimeFieldUpdateOperationsInput? createdAt;
  final DateTimeFieldUpdateOperationsInput? updatedAt;
  final NullableStringFieldUpdateOperationsInput? locationId;
  final BusinessUncheckedUpdateOneWithoutOwnerInput? businessProfile;
  final DeviceUncheckedUpdateOneWithoutUserInput? device;
  final OrderUncheckedUpdateManyWithoutOwnerInput? ordered;
  final ReviewUncheckedUpdateManyWithoutRevieweeInput? reviews;
  final ReviewUncheckedUpdateManyWithoutAuthorInput? reviewed;
  final CommentUncheckedUpdateManyWithoutAuthorInput? comments;
  final AbuseReportUncheckedUpdateManyWithoutUserInput? abuseReports;
  final FavoriteUncheckedUpdateManyWithoutUserInput? favorites;
  final AbuseReportUncheckedUpdateManyWithoutAuthorInput? abuseReported;
  final FavoriteUncheckedUpdateManyWithoutAuthorInput? favorited;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (id != null) {
      id!.getFilesVariables(
          field_name: '${field_name}_id', variables: variables);
    }

    if (email != null) {
      email!.getFilesVariables(
          field_name: '${field_name}_email', variables: variables);
    }

    if (displayName != null) {
      displayName!.getFilesVariables(
          field_name: '${field_name}_displayName', variables: variables);
    }

    if (phoneNumber != null) {
      phoneNumber!.getFilesVariables(
          field_name: '${field_name}_phoneNumber', variables: variables);
    }

    if (dateOfBirth != null) {
      dateOfBirth!.getFilesVariables(
          field_name: '${field_name}_dateOfBirth', variables: variables);
    }

    if (emailVerified != null) {
      emailVerified!.getFilesVariables(
          field_name: '${field_name}_emailVerified', variables: variables);
    }

    if (disabled != null) {
      disabled!.getFilesVariables(
          field_name: '${field_name}_disabled', variables: variables);
    }

    if (role != null) {
      role!.getFilesVariables(
          field_name: '${field_name}_role', variables: variables);
    }

    if (recordStatus != null) {
      recordStatus!.getFilesVariables(
          field_name: '${field_name}_recordStatus', variables: variables);
    }

    if (state != null) {
      state!.getFilesVariables(
          field_name: '${field_name}_state', variables: variables);
    }

    if (gender != null) {
      gender!.getFilesVariables(
          field_name: '${field_name}_gender', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
    }

    if (locationId != null) {
      locationId!.getFilesVariables(
          field_name: '${field_name}_locationId', variables: variables);
    }

    if (businessProfile != null) {
      businessProfile!.getFilesVariables(
          field_name: '${field_name}_businessProfile', variables: variables);
    }

    if (device != null) {
      device!.getFilesVariables(
          field_name: '${field_name}_device', variables: variables);
    }

    if (ordered != null) {
      ordered!.getFilesVariables(
          field_name: '${field_name}_ordered', variables: variables);
    }

    if (reviews != null) {
      reviews!.getFilesVariables(
          field_name: '${field_name}_reviews', variables: variables);
    }

    if (reviewed != null) {
      reviewed!.getFilesVariables(
          field_name: '${field_name}_reviewed', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
    }

    if (abuseReports != null) {
      abuseReports!.getFilesVariables(
          field_name: '${field_name}_abuseReports', variables: variables);
    }

    if (favorites != null) {
      favorites!.getFilesVariables(
          field_name: '${field_name}_favorites', variables: variables);
    }

    if (abuseReported != null) {
      abuseReported!.getFilesVariables(
          field_name: '${field_name}_abuseReported', variables: variables);
    }

    if (favorited != null) {
      favorited!.getFilesVariables(
          field_name: '${field_name}_favorited', variables: variables);
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
      if (email != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'email'),
          value: email!.toValueNode(field_name: '${field_name}_email'),
        ),
      if (displayName != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'displayName'),
          value:
              displayName!.toValueNode(field_name: '${field_name}_displayName'),
        ),
      if (phoneNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'phoneNumber'),
          value:
              phoneNumber!.toValueNode(field_name: '${field_name}_phoneNumber'),
        ),
      if (dateOfBirth != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'dateOfBirth'),
          value:
              dateOfBirth!.toValueNode(field_name: '${field_name}_dateOfBirth'),
        ),
      if (emailVerified != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'emailVerified'),
          value: emailVerified!
              .toValueNode(field_name: '${field_name}_emailVerified'),
        ),
      if (disabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'disabled'),
          value: disabled!.toValueNode(field_name: '${field_name}_disabled'),
        ),
      if (role != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'role'),
          value: role!.toValueNode(field_name: '${field_name}_role'),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: recordStatus!
              .toValueNode(field_name: '${field_name}_recordStatus'),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: state!.toValueNode(field_name: '${field_name}_state'),
        ),
      if (gender != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gender'),
          value: gender!.toValueNode(field_name: '${field_name}_gender'),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
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
      if (locationId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'locationId'),
          value:
              locationId!.toValueNode(field_name: '${field_name}_locationId'),
        ),
      if (businessProfile != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessProfile'),
          value: businessProfile!
              .toValueNode(field_name: '${field_name}_businessProfile'),
        ),
      if (device != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'device'),
          value: device!.toValueNode(field_name: '${field_name}_device'),
        ),
      if (ordered != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'ordered'),
          value: ordered!.toValueNode(field_name: '${field_name}_ordered'),
        ),
      if (reviews != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviews'),
          value: reviews!.toValueNode(field_name: '${field_name}_reviews'),
        ),
      if (reviewed != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'reviewed'),
          value: reviewed!.toValueNode(field_name: '${field_name}_reviewed'),
        ),
      if (comments != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'comments'),
          value: comments!.toValueNode(field_name: '${field_name}_comments'),
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
        ),
      if (abuseReported != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'abuseReported'),
          value: abuseReported!
              .toValueNode(field_name: '${field_name}_abuseReported'),
        ),
      if (favorited != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'favorited'),
          value: favorited!.toValueNode(field_name: '${field_name}_favorited'),
        )
    ]);
  }

  UserUncheckedUpdateWithoutAvatorInput(
      {this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.emailVerified,
      this.disabled,
      this.role,
      this.recordStatus,
      this.state,
      this.gender,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.locationId,
      this.businessProfile,
      this.device,
      this.ordered,
      this.reviews,
      this.reviewed,
      this.comments,
      this.abuseReports,
      this.favorites,
      this.abuseReported,
      this.favorited});

  static UserUncheckedUpdateWithoutAvatorInput fromJson(
      Map<dynamic, dynamic> json) {
    return UserUncheckedUpdateWithoutAvatorInput(
      id: json['id'] != null
          ? StringFieldUpdateOperationsInput.fromJson(json['id'])
          : null,
      email: json['email'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(json['email'])
          : null,
      displayName: json['displayName'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['displayName'])
          : null,
      phoneNumber: json['phoneNumber'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['phoneNumber'])
          : null,
      dateOfBirth: json['dateOfBirth'] != null
          ? NullableDateTimeFieldUpdateOperationsInput.fromJson(
              json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['emailVerified'])
          : null,
      disabled: json['disabled'] != null
          ? BoolFieldUpdateOperationsInput.fromJson(json['disabled'])
          : null,
      role: json['role'] != null
          ? EnumRoleFieldUpdateOperationsInput.fromJson(json['role'])
          : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFieldUpdateOperationsInput.fromJson(
              json['recordStatus'])
          : null,
      state: json['state'] != null
          ? EnumAccountStatusFieldUpdateOperationsInput.fromJson(json['state'])
          : null,
      gender: json['gender'] != null
          ? EnumGenderFieldUpdateOperationsInput.fromJson(json['gender'])
          : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFieldUpdateOperationsInput.fromJson(json['updatedAt'])
          : null,
      locationId: json['locationId'] != null
          ? NullableStringFieldUpdateOperationsInput.fromJson(
              json['locationId'])
          : null,
      businessProfile: json['businessProfile'] != null
          ? BusinessUncheckedUpdateOneWithoutOwnerInput.fromJson(
              json['businessProfile'])
          : null,
      device: json['device'] != null
          ? DeviceUncheckedUpdateOneWithoutUserInput.fromJson(json['device'])
          : null,
      ordered: json['ordered'] != null
          ? OrderUncheckedUpdateManyWithoutOwnerInput.fromJson(json['ordered'])
          : null,
      reviews: json['reviews'] != null
          ? ReviewUncheckedUpdateManyWithoutRevieweeInput.fromJson(
              json['reviews'])
          : null,
      reviewed: json['reviewed'] != null
          ? ReviewUncheckedUpdateManyWithoutAuthorInput.fromJson(
              json['reviewed'])
          : null,
      comments: json['comments'] != null
          ? CommentUncheckedUpdateManyWithoutAuthorInput.fromJson(
              json['comments'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportUncheckedUpdateManyWithoutUserInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteUncheckedUpdateManyWithoutUserInput.fromJson(
              json['favorites'])
          : null,
      abuseReported: json['abuseReported'] != null
          ? AbuseReportUncheckedUpdateManyWithoutAuthorInput.fromJson(
              json['abuseReported'])
          : null,
      favorited: json['favorited'] != null
          ? FavoriteUncheckedUpdateManyWithoutAuthorInput.fromJson(
              json['favorited'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id!.toJson();
    if (email != null) _data['email'] = email!.toJson();
    if (displayName != null) _data['displayName'] = displayName!.toJson();
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber!.toJson();
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toJson();
    if (emailVerified != null) _data['emailVerified'] = emailVerified!.toJson();
    if (disabled != null) _data['disabled'] = disabled!.toJson();
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (locationId != null) _data['locationId'] = locationId!.toJson();
    if (businessProfile != null)
      _data['businessProfile'] = businessProfile!.toJson();
    if (device != null) _data['device'] = device!.toJson();
    if (ordered != null) _data['ordered'] = ordered!.toJson();
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (reviewed != null) _data['reviewed'] = reviewed!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    if (abuseReported != null) _data['abuseReported'] = abuseReported!.toJson();
    if (favorited != null) _data['favorited'] = favorited!.toJson();
    return _data;
  }

  UserUncheckedUpdateWithoutAvatorInput copyWith(
      {StringFieldUpdateOperationsInput? id,
      NullableStringFieldUpdateOperationsInput? email,
      NullableStringFieldUpdateOperationsInput? displayName,
      NullableStringFieldUpdateOperationsInput? phoneNumber,
      NullableDateTimeFieldUpdateOperationsInput? dateOfBirth,
      BoolFieldUpdateOperationsInput? emailVerified,
      BoolFieldUpdateOperationsInput? disabled,
      EnumRoleFieldUpdateOperationsInput? role,
      EnumRecordStatusFieldUpdateOperationsInput? recordStatus,
      EnumAccountStatusFieldUpdateOperationsInput? state,
      EnumGenderFieldUpdateOperationsInput? gender,
      JSONObject? metadata,
      DateTimeFieldUpdateOperationsInput? createdAt,
      DateTimeFieldUpdateOperationsInput? updatedAt,
      NullableStringFieldUpdateOperationsInput? locationId,
      BusinessUncheckedUpdateOneWithoutOwnerInput? businessProfile,
      DeviceUncheckedUpdateOneWithoutUserInput? device,
      OrderUncheckedUpdateManyWithoutOwnerInput? ordered,
      ReviewUncheckedUpdateManyWithoutRevieweeInput? reviews,
      ReviewUncheckedUpdateManyWithoutAuthorInput? reviewed,
      CommentUncheckedUpdateManyWithoutAuthorInput? comments,
      AbuseReportUncheckedUpdateManyWithoutUserInput? abuseReports,
      FavoriteUncheckedUpdateManyWithoutUserInput? favorites,
      AbuseReportUncheckedUpdateManyWithoutAuthorInput? abuseReported,
      FavoriteUncheckedUpdateManyWithoutAuthorInput? favorited}) {
    return UserUncheckedUpdateWithoutAvatorInput(
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
        disabled: disabled ?? this.disabled,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        gender: gender ?? this.gender,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        locationId: locationId ?? this.locationId,
        businessProfile: businessProfile ?? this.businessProfile,
        device: device ?? this.device,
        ordered: ordered ?? this.ordered,
        reviews: reviews ?? this.reviews,
        reviewed: reviewed ?? this.reviewed,
        comments: comments ?? this.comments,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites,
        abuseReported: abuseReported ?? this.abuseReported,
        favorited: favorited ?? this.favorited);
  }

  List<Object?> get props => [
        id,
        email,
        displayName,
        phoneNumber,
        dateOfBirth,
        emailVerified,
        disabled,
        role,
        recordStatus,
        state,
        gender,
        metadata,
        createdAt,
        updatedAt,
        locationId,
        businessProfile,
        device,
        ordered,
        reviews,
        reviewed,
        comments,
        abuseReports,
        favorites,
        abuseReported,
        favorited
      ];
}
