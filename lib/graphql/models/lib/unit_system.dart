enum UnitSystem { METRIC, IMPERIAL }

extension UnitSystemExt on UnitSystem {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case UnitSystem.METRIC:
        return "METRIC";
      case UnitSystem.IMPERIAL:
        return "IMPERIAL";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static UnitSystem fromJson(String json) {
    switch (json) {
      case "METRIC":
        return UnitSystem.METRIC;
      case "IMPERIAL":
        return UnitSystem.IMPERIAL;
      default:
        return UnitSystem.METRIC;
    }
    //return UnitSystem.values.firstWhere((e) => e.toJson() == json);
  }
}
