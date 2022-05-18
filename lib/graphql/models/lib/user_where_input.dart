import 'string_filter.dart';
import 'string_nullable_filter.dart';
import 'date_time_nullable_filter.dart';
import 'bool_filter.dart';
import 'attachment_relation_filter.dart';
import 'enum_role_filter.dart';
import 'enum_record_status_filter.dart';
import 'enum_account_status_filter.dart';
import 'enum_gender_filter.dart';
import 'business_relation_filter.dart';
import 'json_nullable_filter.dart';
import 'date_time_filter.dart';
import 'device_relation_filter.dart';
import 'order_list_relation_filter.dart';
import 'review_list_relation_filter.dart';
import 'comment_list_relation_filter.dart';
import 'location_relation_filter.dart';
import 'abuse_report_list_relation_filter.dart';
import 'favorite_list_relation_filter.dart';

import "package:gql/ast.dart" as ast;
import "package:equatable/equatable.dart";

class UserWhereInput extends Equatable {
  final List<UserWhereInput>? AND;
  final List<UserWhereInput>? OR;
  final List<UserWhereInput>? NOT;
  final StringFilter? id;
  final StringFilter? email;
  final StringFilter? displayName;
  final StringNullableFilter? phoneNumber;
  final DateTimeNullableFilter? dateOfBirth;
  final BoolFilter? emailVerified;
  final BoolFilter? disabled;
  final AttachmentRelationFilter? avator;
  final StringNullableFilter? avatorId;
  final EnumRoleFilter? role;
  final EnumRecordStatusFilter? recordStatus;
  final EnumAccountStatusFilter? state;
  final EnumGenderFilter? gender;
  final BusinessRelationFilter? businessProfile;
  final JsonNullableFilter? metadata;
  final DateTimeFilter? createdAt;
  final DateTimeFilter? updatedAt;
  final DeviceRelationFilter? device;
  final OrderListRelationFilter? ordered;
  final ReviewListRelationFilter? reviews;
  final ReviewListRelationFilter? reviewed;
  final CommentListRelationFilter? comments;
  final LocationRelationFilter? location;
  final StringNullableFilter? locationId;
  final AbuseReportListRelationFilter? abuseReports;
  final FavoriteListRelationFilter? favorites;
  final AbuseReportListRelationFilter? abuseReported;
  final FavoriteListRelationFilter? favorited;

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

    if (avator != null) {
      avator!.getFilesVariables(
          field_name: '${field_name}_avator', variables: variables);
    }

    if (avatorId != null) {
      avatorId!.getFilesVariables(
          field_name: '${field_name}_avatorId', variables: variables);
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

    if (businessProfile != null) {
      businessProfile!.getFilesVariables(
          field_name: '${field_name}_businessProfile', variables: variables);
    }

    if (metadata != null) {
      metadata!.getFilesVariables(
          field_name: '${field_name}_metadata', variables: variables);
    }

    if (createdAt != null) {
      createdAt!.getFilesVariables(
          field_name: '${field_name}_createdAt', variables: variables);
    }

    if (updatedAt != null) {
      updatedAt!.getFilesVariables(
          field_name: '${field_name}_updatedAt', variables: variables);
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

    if (location != null) {
      location!.getFilesVariables(
          field_name: '${field_name}_location', variables: variables);
    }

    if (locationId != null) {
      locationId!.getFilesVariables(
          field_name: '${field_name}_locationId', variables: variables);
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
      if (avator != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avator'),
          value: avator!.toValueNode(field_name: '${field_name}_avator'),
        ),
      if (avatorId != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'avatorId'),
          value: avatorId!.toValueNode(field_name: '${field_name}_avatorId'),
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
      if (businessProfile != null)
        ast.ObjectFieldNode(
          name: ast.NameNode(value: 'businessProfile'),
          value: businessProfile!
              .toValueNode(field_name: '${field_name}_businessProfile'),
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

  UserWhereInput(
      {this.AND,
      this.OR,
      this.NOT,
      this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.emailVerified,
      this.disabled,
      this.avator,
      this.avatorId,
      this.role,
      this.recordStatus,
      this.state,
      this.gender,
      this.businessProfile,
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.device,
      this.ordered,
      this.reviews,
      this.reviewed,
      this.comments,
      this.location,
      this.locationId,
      this.abuseReports,
      this.favorites,
      this.abuseReported,
      this.favorited});

  static UserWhereInput fromJson(Map<dynamic, dynamic> json) {
    return UserWhereInput(
      AND: json['AND'] != null
          ? List.generate(json['AND'].length,
              (index) => UserWhereInput.fromJson(json['AND'][index]))
          : null,
      OR: json['OR'] != null
          ? List.generate(json['OR'].length,
              (index) => UserWhereInput.fromJson(json['OR'][index]))
          : null,
      NOT: json['NOT'] != null
          ? List.generate(json['NOT'].length,
              (index) => UserWhereInput.fromJson(json['NOT'][index]))
          : null,
      id: json['id'] != null ? StringFilter.fromJson(json['id']) : null,
      email:
          json['email'] != null ? StringFilter.fromJson(json['email']) : null,
      displayName: json['displayName'] != null
          ? StringFilter.fromJson(json['displayName'])
          : null,
      phoneNumber: json['phoneNumber'] != null
          ? StringNullableFilter.fromJson(json['phoneNumber'])
          : null,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTimeNullableFilter.fromJson(json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'] != null
          ? BoolFilter.fromJson(json['emailVerified'])
          : null,
      disabled: json['disabled'] != null
          ? BoolFilter.fromJson(json['disabled'])
          : null,
      avator: json['avator'] != null
          ? AttachmentRelationFilter.fromJson(json['avator'])
          : null,
      avatorId: json['avatorId'] != null
          ? StringNullableFilter.fromJson(json['avatorId'])
          : null,
      role: json['role'] != null ? EnumRoleFilter.fromJson(json['role']) : null,
      recordStatus: json['recordStatus'] != null
          ? EnumRecordStatusFilter.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? EnumAccountStatusFilter.fromJson(json['state'])
          : null,
      gender: json['gender'] != null
          ? EnumGenderFilter.fromJson(json['gender'])
          : null,
      businessProfile: json['businessProfile'] != null
          ? BusinessRelationFilter.fromJson(json['businessProfile'])
          : null,
      metadata: json['metadata'] != null
          ? JsonNullableFilter.fromJson(json['metadata'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTimeFilter.fromJson(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTimeFilter.fromJson(json['updatedAt'])
          : null,
      device: json['device'] != null
          ? DeviceRelationFilter.fromJson(json['device'])
          : null,
      ordered: json['ordered'] != null
          ? OrderListRelationFilter.fromJson(json['ordered'])
          : null,
      reviews: json['reviews'] != null
          ? ReviewListRelationFilter.fromJson(json['reviews'])
          : null,
      reviewed: json['reviewed'] != null
          ? ReviewListRelationFilter.fromJson(json['reviewed'])
          : null,
      comments: json['comments'] != null
          ? CommentListRelationFilter.fromJson(json['comments'])
          : null,
      location: json['location'] != null
          ? LocationRelationFilter.fromJson(json['location'])
          : null,
      locationId: json['locationId'] != null
          ? StringNullableFilter.fromJson(json['locationId'])
          : null,
      abuseReports: json['abuseReports'] != null
          ? AbuseReportListRelationFilter.fromJson(json['abuseReports'])
          : null,
      favorites: json['favorites'] != null
          ? FavoriteListRelationFilter.fromJson(json['favorites'])
          : null,
      abuseReported: json['abuseReported'] != null
          ? AbuseReportListRelationFilter.fromJson(json['abuseReported'])
          : null,
      favorited: json['favorited'] != null
          ? FavoriteListRelationFilter.fromJson(json['favorited'])
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
    if (email != null) _data['email'] = email!.toJson();
    if (displayName != null) _data['displayName'] = displayName!.toJson();
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber!.toJson();
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toJson();
    if (emailVerified != null) _data['emailVerified'] = emailVerified!.toJson();
    if (disabled != null) _data['disabled'] = disabled!.toJson();
    if (avator != null) _data['avator'] = avator!.toJson();
    if (avatorId != null) _data['avatorId'] = avatorId!.toJson();
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (businessProfile != null)
      _data['businessProfile'] = businessProfile!.toJson();
    if (metadata != null) _data['metadata'] = metadata!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toJson();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toJson();
    if (device != null) _data['device'] = device!.toJson();
    if (ordered != null) _data['ordered'] = ordered!.toJson();
    if (reviews != null) _data['reviews'] = reviews!.toJson();
    if (reviewed != null) _data['reviewed'] = reviewed!.toJson();
    if (comments != null) _data['comments'] = comments!.toJson();
    if (location != null) _data['location'] = location!.toJson();
    if (locationId != null) _data['locationId'] = locationId!.toJson();
    if (abuseReports != null) _data['abuseReports'] = abuseReports!.toJson();
    if (favorites != null) _data['favorites'] = favorites!.toJson();
    if (abuseReported != null) _data['abuseReported'] = abuseReported!.toJson();
    if (favorited != null) _data['favorited'] = favorited!.toJson();
    return _data;
  }

  UserWhereInput copyWith(
      {List<UserWhereInput>? AND,
      List<UserWhereInput>? OR,
      List<UserWhereInput>? NOT,
      StringFilter? id,
      StringFilter? email,
      StringFilter? displayName,
      StringNullableFilter? phoneNumber,
      DateTimeNullableFilter? dateOfBirth,
      BoolFilter? emailVerified,
      BoolFilter? disabled,
      AttachmentRelationFilter? avator,
      StringNullableFilter? avatorId,
      EnumRoleFilter? role,
      EnumRecordStatusFilter? recordStatus,
      EnumAccountStatusFilter? state,
      EnumGenderFilter? gender,
      BusinessRelationFilter? businessProfile,
      JsonNullableFilter? metadata,
      DateTimeFilter? createdAt,
      DateTimeFilter? updatedAt,
      DeviceRelationFilter? device,
      OrderListRelationFilter? ordered,
      ReviewListRelationFilter? reviews,
      ReviewListRelationFilter? reviewed,
      CommentListRelationFilter? comments,
      LocationRelationFilter? location,
      StringNullableFilter? locationId,
      AbuseReportListRelationFilter? abuseReports,
      FavoriteListRelationFilter? favorites,
      AbuseReportListRelationFilter? abuseReported,
      FavoriteListRelationFilter? favorited}) {
    return UserWhereInput(
        AND: AND ?? this.AND,
        OR: OR ?? this.OR,
        NOT: NOT ?? this.NOT,
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
        disabled: disabled ?? this.disabled,
        avator: avator ?? this.avator,
        avatorId: avatorId ?? this.avatorId,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        gender: gender ?? this.gender,
        businessProfile: businessProfile ?? this.businessProfile,
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        device: device ?? this.device,
        ordered: ordered ?? this.ordered,
        reviews: reviews ?? this.reviews,
        reviewed: reviewed ?? this.reviewed,
        comments: comments ?? this.comments,
        location: location ?? this.location,
        locationId: locationId ?? this.locationId,
        abuseReports: abuseReports ?? this.abuseReports,
        favorites: favorites ?? this.favorites,
        abuseReported: abuseReported ?? this.abuseReported,
        favorited: favorited ?? this.favorited);
  }

  List<Object?> get props => [
        List.from(AND ?? []),
        List.from(OR ?? []),
        List.from(NOT ?? []),
        id,
        email,
        displayName,
        phoneNumber,
        dateOfBirth,
        emailVerified,
        disabled,
        avator,
        avatorId,
        role,
        recordStatus,
        state,
        gender,
        businessProfile,
        metadata,
        createdAt,
        updatedAt,
        device,
        ordered,
        reviews,
        reviewed,
        comments,
        location,
        locationId,
        abuseReports,
        favorites,
        abuseReported,
        favorited
      ];
}
