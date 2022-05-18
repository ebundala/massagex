enum CasbinRuleScalarFieldEnum {
  id,
  ptype,
  v0,
  v1,
  v2,
  v3,
  v4,
  v5,
  createdAt,
  updatedAt
}

extension CasbinRuleScalarFieldEnumExt on CasbinRuleScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case CasbinRuleScalarFieldEnum.id:
        return "id";
      case CasbinRuleScalarFieldEnum.ptype:
        return "ptype";
      case CasbinRuleScalarFieldEnum.v0:
        return "v0";
      case CasbinRuleScalarFieldEnum.v1:
        return "v1";
      case CasbinRuleScalarFieldEnum.v2:
        return "v2";
      case CasbinRuleScalarFieldEnum.v3:
        return "v3";
      case CasbinRuleScalarFieldEnum.v4:
        return "v4";
      case CasbinRuleScalarFieldEnum.v5:
        return "v5";
      case CasbinRuleScalarFieldEnum.createdAt:
        return "createdAt";
      case CasbinRuleScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static CasbinRuleScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return CasbinRuleScalarFieldEnum.id;
      case "ptype":
        return CasbinRuleScalarFieldEnum.ptype;
      case "v0":
        return CasbinRuleScalarFieldEnum.v0;
      case "v1":
        return CasbinRuleScalarFieldEnum.v1;
      case "v2":
        return CasbinRuleScalarFieldEnum.v2;
      case "v3":
        return CasbinRuleScalarFieldEnum.v3;
      case "v4":
        return CasbinRuleScalarFieldEnum.v4;
      case "v5":
        return CasbinRuleScalarFieldEnum.v5;
      case "createdAt":
        return CasbinRuleScalarFieldEnum.createdAt;
      case "updatedAt":
        return CasbinRuleScalarFieldEnum.updatedAt;
      default:
        return CasbinRuleScalarFieldEnum.id;
    }
    //return CasbinRuleScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
