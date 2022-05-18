enum TravelMode { driving, walking, bicycling, transit }

extension TravelModeExt on TravelMode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TravelMode.driving:
        return "driving";
      case TravelMode.walking:
        return "walking";
      case TravelMode.bicycling:
        return "bicycling";
      case TravelMode.transit:
        return "transit";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TravelMode fromJson(String json) {
    switch (json) {
      case "driving":
        return TravelMode.driving;
      case "walking":
        return TravelMode.walking;
      case "bicycling":
        return TravelMode.bicycling;
      case "transit":
        return TravelMode.transit;
      default:
        return TravelMode.driving;
    }
    //return TravelMode.values.firstWhere((e) => e.toJson() == json);
  }
}
