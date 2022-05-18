enum DeviceScalarFieldEnum { id, fcm$id, type, userId, recordStatus }

extension DeviceScalarFieldEnumExt on DeviceScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case DeviceScalarFieldEnum.id:
        return "id";
      case DeviceScalarFieldEnum.fcm$id:
        return "fcm_id";
      case DeviceScalarFieldEnum.type:
        return "type";
      case DeviceScalarFieldEnum.userId:
        return "userId";
      case DeviceScalarFieldEnum.recordStatus:
        return "recordStatus";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static DeviceScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return DeviceScalarFieldEnum.id;
      case "fcm_id":
        return DeviceScalarFieldEnum.fcm$id;
      case "type":
        return DeviceScalarFieldEnum.type;
      case "userId":
        return DeviceScalarFieldEnum.userId;
      case "recordStatus":
        return DeviceScalarFieldEnum.recordStatus;
      default:
        return DeviceScalarFieldEnum.id;
    }
    //return DeviceScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
