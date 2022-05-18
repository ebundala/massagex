enum QueryMode { default$, insensitive }

extension QueryModeExt on QueryMode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case QueryMode.default$:
        return "default";
      case QueryMode.insensitive:
        return "insensitive";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static QueryMode fromJson(String json) {
    switch (json) {
      case "default":
        return QueryMode.default$;
      case "insensitive":
        return QueryMode.insensitive;
      default:
        return QueryMode.default$;
    }
    //return QueryMode.values.firstWhere((e) => e.toJson() == json);
  }
}
