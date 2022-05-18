enum GeocodedWaypointStatus { OK, ZERO$RESULTS }

extension GeocodedWaypointStatusExt on GeocodedWaypointStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case GeocodedWaypointStatus.OK:
        return "OK";
      case GeocodedWaypointStatus.ZERO$RESULTS:
        return "ZERO_RESULTS";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static GeocodedWaypointStatus fromJson(String json) {
    switch (json) {
      case "OK":
        return GeocodedWaypointStatus.OK;
      case "ZERO_RESULTS":
        return GeocodedWaypointStatus.ZERO$RESULTS;
      default:
        return GeocodedWaypointStatus.OK;
    }
    //return GeocodedWaypointStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
