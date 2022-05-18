import "package:equatable/equatable.dart";

class UserCountAggregateOutputType extends Equatable {
  final int? id;
  final int? email;
  final int? displayName;
  final int? phoneNumber;
  final int? dateOfBirth;
  final int? emailVerified;
  final int? disabled;
  final int? avatorId;
  final int? role;
  final int? recordStatus;
  final int? state;
  final int? gender;
  final int? metadata;
  final int? createdAt;
  final int? updatedAt;
  final int? locationId;
  final int? $all;
  UserCountAggregateOutputType(
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
      this.metadata,
      this.createdAt,
      this.updatedAt,
      this.locationId,
      this.$all});

  static UserCountAggregateOutputType fromJson(Map<dynamic, dynamic> json) {
    return UserCountAggregateOutputType(
      id: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'],
      emailVerified: json['emailVerified'],
      disabled: json['disabled'],
      avatorId: json['avatorId'],
      role: json['role'],
      recordStatus: json['recordStatus'],
      state: json['state'],
      gender: json['gender'],
      metadata: json['metadata'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      locationId: json['locationId'],
      $all: json['_all'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (id != null) _data['id'] = id;
    if (email != null) _data['email'] = email;
    if (displayName != null) _data['displayName'] = displayName;
    if (phoneNumber != null) _data['phoneNumber'] = phoneNumber;
    if (dateOfBirth != null) _data['dateOfBirth'] = dateOfBirth;
    if (emailVerified != null) _data['emailVerified'] = emailVerified;
    if (disabled != null) _data['disabled'] = disabled;
    if (avatorId != null) _data['avatorId'] = avatorId;
    if (role != null) _data['role'] = role;
    if (recordStatus != null) _data['recordStatus'] = recordStatus;
    if (state != null) _data['state'] = state;
    if (gender != null) _data['gender'] = gender;
    if (metadata != null) _data['metadata'] = metadata;
    if (createdAt != null) _data['createdAt'] = createdAt;
    if (updatedAt != null) _data['updatedAt'] = updatedAt;
    if (locationId != null) _data['locationId'] = locationId;
    if ($all != null) _data['_all'] = $all;
    return _data;
  }

  UserCountAggregateOutputType copyWith(
      {int? id,
      int? email,
      int? displayName,
      int? phoneNumber,
      int? dateOfBirth,
      int? emailVerified,
      int? disabled,
      int? avatorId,
      int? role,
      int? recordStatus,
      int? state,
      int? gender,
      int? metadata,
      int? createdAt,
      int? updatedAt,
      int? locationId,
      int? $all}) {
    return UserCountAggregateOutputType(
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
        metadata: metadata ?? this.metadata,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        locationId: locationId ?? this.locationId,
        $all: $all ?? this.$all);
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
        metadata,
        createdAt,
        updatedAt,
        locationId,
        $all
      ];
}
