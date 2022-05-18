enum BusinessMode { OFFICE$MODE, MOBILE$MODE }

extension BusinessModeExt on BusinessMode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case BusinessMode.OFFICE$MODE:
        return "OFFICE_MODE";
      case BusinessMode.MOBILE$MODE:
        return "MOBILE_MODE";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static BusinessMode fromJson(String json) {
    switch (json) {
      case "OFFICE_MODE":
        return BusinessMode.OFFICE$MODE;
      case "MOBILE_MODE":
        return BusinessMode.MOBILE$MODE;
      default:
        return BusinessMode.OFFICE$MODE;
    }
    //return BusinessMode.values.firstWhere((e) => e.toJson() == json);
  }
}
