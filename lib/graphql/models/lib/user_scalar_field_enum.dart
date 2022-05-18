enum UserScalarFieldEnum {
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
  locationId
}

extension UserScalarFieldEnumExt on UserScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case UserScalarFieldEnum.id:
        return "id";
      case UserScalarFieldEnum.email:
        return "email";
      case UserScalarFieldEnum.displayName:
        return "displayName";
      case UserScalarFieldEnum.phoneNumber:
        return "phoneNumber";
      case UserScalarFieldEnum.dateOfBirth:
        return "dateOfBirth";
      case UserScalarFieldEnum.emailVerified:
        return "emailVerified";
      case UserScalarFieldEnum.disabled:
        return "disabled";
      case UserScalarFieldEnum.avatorId:
        return "avatorId";
      case UserScalarFieldEnum.role:
        return "role";
      case UserScalarFieldEnum.recordStatus:
        return "recordStatus";
      case UserScalarFieldEnum.state:
        return "state";
      case UserScalarFieldEnum.gender:
        return "gender";
      case UserScalarFieldEnum.metadata:
        return "metadata";
      case UserScalarFieldEnum.createdAt:
        return "createdAt";
      case UserScalarFieldEnum.updatedAt:
        return "updatedAt";
      case UserScalarFieldEnum.locationId:
        return "locationId";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static UserScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return UserScalarFieldEnum.id;
      case "email":
        return UserScalarFieldEnum.email;
      case "displayName":
        return UserScalarFieldEnum.displayName;
      case "phoneNumber":
        return UserScalarFieldEnum.phoneNumber;
      case "dateOfBirth":
        return UserScalarFieldEnum.dateOfBirth;
      case "emailVerified":
        return UserScalarFieldEnum.emailVerified;
      case "disabled":
        return UserScalarFieldEnum.disabled;
      case "avatorId":
        return UserScalarFieldEnum.avatorId;
      case "role":
        return UserScalarFieldEnum.role;
      case "recordStatus":
        return UserScalarFieldEnum.recordStatus;
      case "state":
        return UserScalarFieldEnum.state;
      case "gender":
        return UserScalarFieldEnum.gender;
      case "metadata":
        return UserScalarFieldEnum.metadata;
      case "createdAt":
        return UserScalarFieldEnum.createdAt;
      case "updatedAt":
        return UserScalarFieldEnum.updatedAt;
      case "locationId":
        return UserScalarFieldEnum.locationId;
      default:
        return UserScalarFieldEnum.id;
    }
    //return UserScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
