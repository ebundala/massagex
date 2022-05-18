enum TransitRoutingPreference { less$walking, fewer$transfers }

extension TransitRoutingPreferenceExt on TransitRoutingPreference {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TransitRoutingPreference.less$walking:
        return "less_walking";
      case TransitRoutingPreference.fewer$transfers:
        return "fewer_transfers";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TransitRoutingPreference fromJson(String json) {
    switch (json) {
      case "less_walking":
        return TransitRoutingPreference.less$walking;
      case "fewer_transfers":
        return TransitRoutingPreference.fewer$transfers;
      default:
        return TransitRoutingPreference.less$walking;
    }
    //return TransitRoutingPreference.values.firstWhere((e) => e.toJson() == json);
  }
}
