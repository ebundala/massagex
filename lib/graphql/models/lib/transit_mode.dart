enum TransitMode { bus, subway, train, tram, rail }

extension TransitModeExt on TransitMode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TransitMode.bus:
        return "bus";
      case TransitMode.subway:
        return "subway";
      case TransitMode.train:
        return "train";
      case TransitMode.tram:
        return "tram";
      case TransitMode.rail:
        return "rail";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TransitMode fromJson(String json) {
    switch (json) {
      case "bus":
        return TransitMode.bus;
      case "subway":
        return TransitMode.subway;
      case "train":
        return TransitMode.train;
      case "tram":
        return TransitMode.tram;
      case "rail":
        return TransitMode.rail;
      default:
        return TransitMode.bus;
    }
    //return TransitMode.values.firstWhere((e) => e.toJson() == json);
  }
}
