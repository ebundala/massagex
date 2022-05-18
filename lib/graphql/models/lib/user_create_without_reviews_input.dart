import 'role.dart';
import 'record_status.dart';
import 'account_status.dart';
import 'gender.dart';
import 'scalars/json_object.dart';
import 'attachment_create_nested_one_without_users_input.dart';
import 'business_create_nested_one_without_owner_input.dart';
import 'device_create_nested_one_without_user_input.dart';
import 'order_create_nested_many_without_owner_input.dart';
import 'review_create_nested_many_without_author_input.dart';
import 'comment_create_nested_many_without_author_input.dart';
import 'location_create_nested_one_without_users_input.dart';
import 'abuse_report_create_nested_many_without_user_input.dart';
import 'favorite_create_nested_many_without_user_input.dart';
import 'abuse_report_create_nested_many_without_author_input.dart';
import 'favorite_create_nested_many_without_author_input.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserCreateWithoutReviewsInput extends Equatable {
  final String? id;
  final String email;
  final String displayName;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final bool? emailVerified;
  final bool? disabled;
  final Role? role;
  final RecordStatus? recordStatus;
  final AccountStatus? state;
  final Gender? gender;
  final JSONObject? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AttachmentCreateNestedOneWithoutUsersInput? avator;
  final BusinessCreateNestedOneWithoutOwnerInput? businessProfile;
  final DeviceCreateNestedOneWithoutUserInput? device;
  final OrderCreateNestedManyWithoutOwnerInput? ordered;
  final ReviewCreateNestedManyWithoutAuthorInput? reviewed;
  final CommentCreateNestedManyWithoutAuthorInput? comments;
  final LocationCreateNestedOneWithoutUsersInput? location;
  final AbuseReportCreateNestedManyWithoutUserInput? abuseReports;
  final FavoriteCreateNestedManyWithoutUserInput? favorites;
  final AbuseReportCreateNestedManyWithoutAuthorInput? abuseReported;
  final FavoriteCreateNestedManyWithoutAuthorInput? favorited;

  Map<String, dynamic> getFilesVariables(
      {required String field_name, Map<String, dynamic>? variables}) {
    if (variables == null) {
      variables = Map();
    }
    if (avator != null) {
      avator!.getFilesVariables(
          field_name: '${field_name}_avator', variables: variables);
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

    if (reviewed != null) {
      reviewed!.getFilesVariables(
          field_name: '${field_name}_reviewed', variables: variables);
    }

    if (comments != null) {
      comments!.getFilesVariables(
          field_name: '${field_name}_comments', variables: variables);
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
          value: ast.StringValueNode(value: '${id!}', isBlock: false),
        ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'email'),
        value: ast.StringValueNode(value: '${email}', isBlock: false),
      ),
      ast.ObjectFieldNode(
        name: ast.NameNode(value: 'displayName'),
        value: ast.StringValueNode(value: '${displayName}', isBlock: false),
      ),
      if (phoneNumber != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'phoneNumber'),
          value: ast.StringValueNode(value: '${phoneNumber!}', isBlock: false),
        ),
      if (dateOfBirth != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'dateOfBirth'),
          value: ast.StringValueNode(
              value: dateOfBirth!.toIso8601String(), isBlock: false),
        ),
      if (emailVerified != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'emailVerified'),
          value: ast.BooleanValueNode(value: emailVerified!),
        ),
      if (disabled != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'disabled'),
          value: ast.BooleanValueNode(value: disabled!),
        ),
      if (role != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'role'),
          value: ast.EnumValueNode(name: ast.NameNode(value: role!.toJson())),
        ),
      if (recordStatus != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'recordStatus'),
          value: ast.EnumValueNode(
              name: ast.NameNode(value: recordStatus!.toJson())),
        ),
      if (state != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'state'),
          value: ast.EnumValueNode(name: ast.NameNode(value: state!.toJson())),
        ),
      if (gender != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'gender'),
          value: ast.EnumValueNode(name: ast.NameNode(value: gender!.toJson())),
        ),
      if (metadata != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'metadata'),
          value: metadata!.toValueNode(field_name: '${field_name}_metadata'),
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
      if (avator != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avator'),
          value: avator!.toValueNode(field_name: '${field_name}_avator'),
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

  UserCreateWithoutReviewsInput(
      {this.id,
      required this.email,
      required this.displayName,
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
      this.avator,
      this.businessProfile,
      this.device,
      this.ordered,
      this.reviewed,
      this.comments,
      this.location,
      this.abuseReports,
      this.favorites,
      this.abuseReported,
      this.favorited});

  static UserCreateWithoutReviewsInput fromJson(Map<dynamic, dynamic> json) {
    return UserCreateWithoutReviewsInput(
      id: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'],
      disabled: json['disabled'],
      role: json['role'] != null ? RoleExt.fromJson(json['role']) : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? AccountStatusExt.fromJson(json['state'])
          : null,
      gender:
          json['gender'] != null ? GenderExt.fromJson(json['gender']) : null,
      metadata: json['metadata'] != null
          ? JSONObject.fromJson(json['metadata'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      avator: json['avator'] != null
          ? AttachmentCreateNestedOneWithoutUsersInput.fromJson(json['avator'])
          : null,
      businessProfile: json['businessProfile'] != null
          ? BusinessCreateNestedOneWithoutOwnerInput.fromJson(
              json['businessProfile'])
          : null,
      device: json['device'] != null
          ? DeviceCreateNestedOneWithoutUserInput.fromJson(json['device'])
          : null,
      ordered: json['ordered'] != null
          ? OrderCreateNestedManyWithoutOwnerInput.fromJson(json['ordered'])
          : null,
      reviewed: json['reviewed'] != null
          ? ReviewCreateNestedManyWithoutAuthorInput.fromJson(json['reviewed'])
          : null,
      comments: json['comments'] != null
          ? CommentCreateNestedManyWithoutAuthorInput.fromJson(json['comments'])
          : null,
      location: json['location'] != null
          ? LocationCreateNestedOneWithoutUsersInput.fromJson(json['location'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportCreateNestedManyWithoutUserInput.fromJson(
              json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteCreateNestedManyWithoutUserInput.fromJson(json['favorites'])
          : null,
      abuseReported: json['abuseReported'] != null
          ? AbuseReportCreateNestedManyWithoutAuthorInput.fromJson(
              json['abuseReported'])
          : null,
      favorited: json['favorited'] != null
          ? FavoriteCreateNestedManyWithoutAuthorInput.fromJson(
              json['favorited'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;

    _data['email'] = email;

    _data['displayName'] = displayName;
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber;
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toString();
    if (emailVerified != null) _data['emailVerified'] = emailVerified;
    if (disabled != null) _data['disabled'] = disabled;
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (avator != null) _data['avator'] = avator!.toJson();
    if (businessProfile != null)
      _data['businessProfile'] = businessProfile!.toJson();
    if (device != null) _data['device'] = device!.toJson();
    if (ordered != null) _data['ordered'] = ordered!.toJson();
    if (reviewed != null) _data['reviewed'] = reviewed!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    if (abuseReported != null) _data['abuseReported'] = abuseReported!.toJson();
    if (favorited != null) _data['favorited'] = favorited!.toJson();
    return _data;
  }

  UserCreateWithoutReviewsInput copyWith(
      {String? id,
      String? email,
      String? displayName,
      String? phoneNumber,
      DateTime? dateOfBirth,
      bool? emailVerified,
      bool? disabled,
      Role? role,
      RecordStatus? recordStatus,
      AccountStatus? state,
      Gender? gender,
      JSONObject? metadata,
      DateTime? createdAt,
      DateTime? updatedAt,
      AttachmentCreateNestedOneWithoutUsersInput? avator,
      BusinessCreateNestedOneWithoutOwnerInput? businessProfile,
      DeviceCreateNestedOneWithoutUserInput? device,
      OrderCreateNestedManyWithoutOwnerInput? ordered,
      ReviewCreateNestedManyWithoutAuthorInput? reviewed,
      CommentCreateNestedManyWithoutAuthorInput? comments,
      LocationCreateNestedOneWithoutUsersInput? location,
      AbuseReportCreateNestedManyWithoutUserInput? abuseReports,
      FavoriteCreateNestedManyWithoutUserInput? favorites,
      AbuseReportCreateNestedManyWithoutAuthorInput? abuseReported,
      FavoriteCreateNestedManyWithoutAuthorInput? favorited}) {
    return UserCreateWithoutReviewsInput(
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
        avator: avator ?? this.avator,
        businessProfile: businessProfile ?? this.businessProfile,
        device: device ?? this.device,
        ordered: ordered ?? this.ordered,
        reviewed: reviewed ?? this.reviewed,
        comments: comments ?? this.comments,
        location: location ?? this.location,
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
        avator,
        businessProfile,
        device,
        ordered,
        reviewed,
        comments,
        location,
        abuseReports,
        favorites,
        abuseReported,
        favorited
      ];
}
