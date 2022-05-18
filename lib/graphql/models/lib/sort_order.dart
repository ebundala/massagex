enum SortOrder { asc, desc }

extension SortOrderExt on SortOrder {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case SortOrder.asc:
        return "asc";
      case SortOrder.desc:
        return "desc";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static SortOrder fromJson(String json) {
    switch (json) {
      case "asc":
        return SortOrder.asc;
      case "desc":
        return SortOrder.desc;
      default:
        return SortOrder.asc;
    }
    //return SortOrder.values.firstWhere((e) => e.toJson() == json);
  }
}
