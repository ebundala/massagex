enum LocationType { ROOFTOP, RANGE$INTERPOLATED, GEOMETRIC$CENTER, APPROXIMATE }

extension LocationTypeExt on LocationType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case LocationType.ROOFTOP:
        return "ROOFTOP";
      case LocationType.RANGE$INTERPOLATED:
        return "RANGE_INTERPOLATED";
      case LocationType.GEOMETRIC$CENTER:
        return "GEOMETRIC_CENTER";
      case LocationType.APPROXIMATE:
        return "APPROXIMATE";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static LocationType fromJson(String json) {
    switch (json) {
      case "ROOFTOP":
        return LocationType.ROOFTOP;
      case "RANGE_INTERPOLATED":
        return LocationType.RANGE$INTERPOLATED;
      case "GEOMETRIC_CENTER":
        return LocationType.GEOMETRIC$CENTER;
      case "APPROXIMATE":
        return LocationType.APPROXIMATE;
      default:
        return LocationType.ROOFTOP;
    }
    //return LocationType.values.firstWhere((e) => e.toJson() == json);
  }
}
