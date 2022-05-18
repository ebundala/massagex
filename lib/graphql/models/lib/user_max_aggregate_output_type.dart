import 'role.dart';
import 'record_status.dart';
import 'account_status.dart';
import 'gender.dart';
import 'package:flutter/foundation.dart' show ValueNotifier;
import 'package:flutter/widgets.dart' show TextEditingController;
import 'package:gql/src/ast/ast.dart';
import 'selection_node_data.dart';

import "package:equatable/equatable.dart";

class UserMaxAggregateOutputType extends Equatable {
  final String? id;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final bool? emailVerified;
  final bool? disabled;
  final String? avatorId;
  final Role? role;
  final RecordStatus? recordStatus;
  final AccountStatus? state;
  final Gender? gender;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? locationId;
  UserMaxAggregateOutputType(
      {this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.dateOfBirth,
      this.emailVerified,
      this.disabled,
      this.avatorId,
      this.role,
      this.recordStatus,
      this.state,
      this.gender,
      this.createdAt,
      this.updatedAt,
      this.locationId});

  static UserMaxAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return UserMaxAggregateOutputType(
      id: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      emailVerified: json['emailVerified'],
      disabled: json['disabled'],
      avatorId: json['avatorId'],
      role: json['role'] != null ? RoleExt.fromJson(json['role']) : null,
      recordStatus: json['recordStatus'] != null
          ? RecordStatusExt.fromJson(json['recordStatus'])
          : null,
      state: json['state'] != null
          ? AccountStatusExt.fromJson(json['state'])
          : null,
      gender:
          json['gender'] != null ? GenderExt.fromJson(json['gender']) : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      locationId: json['locationId'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (email != null) _data['email'] = email;
    if (displayName != null) _data['displayName'] = displayName;
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber;
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth!.toString();
    if (emailVerified != null) _data['emailVerified'] = emailVerified;
    if (disabled != null) _data['disabled'] = disabled;
    if (avatorId != null) _data['avatorId'] = avatorId;
    if (role != null) _data['role'] = role!.toJson();
    if (recordStatus != null) _data['recordStatus'] = recordStatus!.toJson();
    if (state != null) _data['state'] = state!.toJson();
    if (gender != null) _data['gender'] = gender!.toJson();
    if (createdAt != null) _data['createdAt'] = createdAt!.toString();
    if (updatedAt != null) _data['updatedAt'] = updatedAt!.toString();
    if (locationId != null) _data['locationId'] = locationId;
    return _data;
  }

  UserMaxAggregateOutputType copyWith(
      {String? id,
      String? email,
      String? displayName,
      String? phoneNumber,
      DateTime? dateOfBirth,
      bool? emailVerified,
      bool? disabled,
      String? avatorId,
      Role? role,
      RecordStatus? recordStatus,
      AccountStatus? state,
      Gender? gender,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? locationId}) {
    return UserMaxAggregateOutputType(
        id: id ?? this.id,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        emailVerified: emailVerified ?? this.emailVerified,
        disabled: disabled ?? this.disabled,
        avatorId: avatorId ?? this.avatorId,
        role: role ?? this.role,
        recordStatus: recordStatus ?? this.recordStatus,
        state: state ?? this.state,
        gender: gender ?? this.gender,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        locationId: locationId ?? this.locationId);
  }

  List<Object?> get props => [
        id,
        email,
        displayName,
        phoneNumber,
        dateOfBirth,
        emailVerified,
        disabled,
        avatorId,
        role,
        recordStatus,
        state,
        gender,
        createdAt,
        updatedAt,
        locationId
      ];
}

extension UserMaxAggregateOutputTypeExt on UserMaxAggregateOutputType {
  bool get isInitialized {
    return isNew || isSaved;
  }

  bool get isSaved {
    return id?.isNotEmpty == true && id?.contains("new") != true;
  }

  bool get isNew {
    return id?.isNotEmpty == true && id?.contains("new") == true;
  }
}

class UserMaxAggregateOutputTypeController
    extends ValueNotifier<UserMaxAggregateOutputType> {
  TextEditingController? idController;

  TextEditingController? emailController;

  TextEditingController? displayNameController;

  TextEditingController? phoneNumberController;

  TextEditingController? dateOfBirthController;

  TextEditingController? emailVerifiedController;

  TextEditingController? disabledController;

  TextEditingController? avatorIdController;

  void Function(Role value)? roleChanged;
  void Function(RecordStatus value)? recordStatusChanged;
  void Function(AccountStatus value)? stateChanged;
  void Function(Gender value)? genderChanged;
  TextEditingController? createdAtController;

  TextEditingController? updatedAtController;

  TextEditingController? locationIdController;

  final UserMaxAggregateOutputType initialValue;
  final SelectionSetNode selectionSet;
  final Map<String, SelectionNodeData> selections = {};
  UserMaxAggregateOutputTypeController({
    required this.initialValue,
    required this.selectionSet,
    this.roleChanged,
    this.recordStatusChanged,
    this.stateChanged,
    this.genderChanged,
  }) : super(initialValue) {
    initSelectionData();
    if (isInSelectionSet('id')) {
      idController = TextEditingController(text: "${initialValue.id ?? ''}")
        ..addListener(() {
          value = value.copyWith(id: idController?.text);
        });
    }
    if (isInSelectionSet('email')) {
      emailController =
          TextEditingController(text: "${initialValue.email ?? ''}")
            ..addListener(() {
              value = value.copyWith(email: emailController?.text);
            });
    }
    if (isInSelectionSet('displayName')) {
      displayNameController =
          TextEditingController(text: "${initialValue.displayName ?? ''}")
            ..addListener(() {
              value = value.copyWith(displayName: displayNameController?.text);
            });
    }
    if (isInSelectionSet('phoneNumber')) {
      phoneNumberController =
          TextEditingController(text: "${initialValue.phoneNumber ?? ''}")
            ..addListener(() {
              value = value.copyWith(phoneNumber: phoneNumberController?.text);
            });
    }
    if (isInSelectionSet('dateOfBirth')) {
      dateOfBirthController =
          TextEditingController(text: "${initialValue.dateOfBirth ?? ''}")
            ..addListener(() {
              value = value.copyWith(
                  dateOfBirth:
                      DateTime.tryParse(dateOfBirthController?.text ?? ''));
            });
    }
    if (isInSelectionSet('avatorId')) {
      avatorIdController =
          TextEditingController(text: "${initialValue.avatorId ?? ''}")
            ..addListener(() {
              value = value.copyWith(avatorId: avatorIdController?.text);
            });
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController = TextEditingController(
          text: "${initialValue.createdAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              createdAt: DateTime.tryParse(createdAtController?.text ?? ''));
        });
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController = TextEditingController(
          text: "${initialValue.updatedAt ?? ''}")
        ..addListener(() {
          value = value.copyWith(
              updatedAt: DateTime.tryParse(updatedAtController?.text ?? ''));
        });
    }
    if (isInSelectionSet('locationId')) {
      locationIdController =
          TextEditingController(text: "${initialValue.locationId ?? ''}")
            ..addListener(() {
              value = value.copyWith(locationId: locationIdController?.text);
            });
    }
  }
  @override
  dispose() {
    if (isInSelectionSet('id')) {
      idController?.dispose();
    }
    if (isInSelectionSet('email')) {
      emailController?.dispose();
    }
    if (isInSelectionSet('displayName')) {
      displayNameController?.dispose();
    }
    if (isInSelectionSet('phoneNumber')) {
      phoneNumberController?.dispose();
    }
    if (isInSelectionSet('dateOfBirth')) {
      dateOfBirthController?.dispose();
    }
    if (isInSelectionSet('avatorId')) {
      avatorIdController?.dispose();
    }
    if (isInSelectionSet('createdAt')) {
      createdAtController?.dispose();
    }
    if (isInSelectionSet('updatedAt')) {
      updatedAtController?.dispose();
    }
    if (isInSelectionSet('locationId')) {
      locationIdController?.dispose();
    }

    super.dispose();
  }

  void onRoleChanged(Role v) {
    if (value.role != v) {
      value = value.copyWith(role: v);
      roleChanged?.call(v);
    }
  }

  void onRecordStatusChanged(RecordStatus v) {
    if (value.recordStatus != v) {
      value = value.copyWith(recordStatus: v);
      recordStatusChanged?.call(v);
    }
  }

  void onStateChanged(AccountStatus v) {
    if (value.state != v) {
      value = value.copyWith(state: v);
      stateChanged?.call(v);
    }
  }

  void onGenderChanged(Gender v) {
    if (value.gender != v) {
      value = value.copyWith(gender: v);
      genderChanged?.call(v);
    }
  }

  bool isInSelectionSet(String field) {
    return selections.containsKey(field);
  }

  SelectionNodeData? getSelectionNodeData(String field) {
    return selections[field];
  }

  Map<String, SelectionNodeData> initSelectionData() {
    var sel = selectionSet.selections;
    sel.forEach((el) {
      var e = el as FieldNode;
      selections[e.name.value] =
          SelectionNodeData(selected: true, selectionSet: e.selectionSet);
    });
    return selections;
  }
}
