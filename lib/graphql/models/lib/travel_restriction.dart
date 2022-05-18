enum TravelRestriction { tolls, highways, ferries, traffic, indoor }

extension TravelRestrictionExt on TravelRestriction {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TravelRestriction.tolls:
        return "tolls";
      case TravelRestriction.highways:
        return "highways";
      case TravelRestriction.ferries:
        return "ferries";
      case TravelRestriction.traffic:
        return "traffic";
      case TravelRestriction.indoor:
        return "indoor";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TravelRestriction fromJson(String json) {
    switch (json) {
      case "tolls":
        return TravelRestriction.tolls;
      case "highways":
        return TravelRestriction.highways;
      case "ferries":
        return TravelRestriction.ferries;
      case "traffic":
        return TravelRestriction.traffic;
      case "indoor":
        return TravelRestriction.indoor;
      default:
        return TravelRestriction.tolls;
    }
    //return TravelRestriction.values.firstWhere((e) => e.toJson() == json);
  }
}
