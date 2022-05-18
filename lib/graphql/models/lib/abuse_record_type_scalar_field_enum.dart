enum AbuseRecordTypeScalarFieldEnum { id, name }

extension AbuseRecordTypeScalarFieldEnumExt on AbuseRecordTypeScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AbuseRecordTypeScalarFieldEnum.id:
        return "id";
      case AbuseRecordTypeScalarFieldEnum.name:
        return "name";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AbuseRecordTypeScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return AbuseRecordTypeScalarFieldEnum.id;
      case "name":
        return AbuseRecordTypeScalarFieldEnum.name;
      default:
        return AbuseRecordTypeScalarFieldEnum.id;
    }
    //return AbuseRecordTypeScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
