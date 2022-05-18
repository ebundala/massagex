enum FavoriteRecordTypeScalarFieldEnum { id, name }

extension FavoriteRecordTypeScalarFieldEnumExt
    on FavoriteRecordTypeScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case FavoriteRecordTypeScalarFieldEnum.id:
        return "id";
      case FavoriteRecordTypeScalarFieldEnum.name:
        return "name";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static FavoriteRecordTypeScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return FavoriteRecordTypeScalarFieldEnum.id;
      case "name":
        return FavoriteRecordTypeScalarFieldEnum.name;
      default:
        return FavoriteRecordTypeScalarFieldEnum.id;
    }
    //return FavoriteRecordTypeScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
