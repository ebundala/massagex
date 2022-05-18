enum ReverseGeocodingLocationType {
  ROOFTOP,
  RANGE$INTERPOLATED,
  GEOMETRIC$CENTER,
  APPROXIMATE
}

extension ReverseGeocodingLocationTypeExt on ReverseGeocodingLocationType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case ReverseGeocodingLocationType.ROOFTOP:
        return "ROOFTOP";
      case ReverseGeocodingLocationType.RANGE$INTERPOLATED:
        return "RANGE_INTERPOLATED";
      case ReverseGeocodingLocationType.GEOMETRIC$CENTER:
        return "GEOMETRIC_CENTER";
      case ReverseGeocodingLocationType.APPROXIMATE:
        return "APPROXIMATE";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static ReverseGeocodingLocationType fromJson(String json) {
    switch (json) {
      case "ROOFTOP":
        return ReverseGeocodingLocationType.ROOFTOP;
      case "RANGE_INTERPOLATED":
        return ReverseGeocodingLocationType.RANGE$INTERPOLATED;
      case "GEOMETRIC_CENTER":
        return ReverseGeocodingLocationType.GEOMETRIC$CENTER;
      case "APPROXIMATE":
        return ReverseGeocodingLocationType.APPROXIMATE;
      default:
        return ReverseGeocodingLocationType.ROOFTOP;
    }
    //return ReverseGeocodingLocationType.values.firstWhere((e) => e.toJson() == json);
  }
}
