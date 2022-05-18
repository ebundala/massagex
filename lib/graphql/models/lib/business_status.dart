enum BusinessStatus { ONLINE, OFFLINE }

extension BusinessStatusExt on BusinessStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case BusinessStatus.ONLINE:
        return "ONLINE";
      case BusinessStatus.OFFLINE:
        return "OFFLINE";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static BusinessStatus fromJson(String json) {
    switch (json) {
      case "ONLINE":
        return BusinessStatus.ONLINE;
      case "OFFLINE":
        return BusinessStatus.OFFLINE;
      default:
        return BusinessStatus.ONLINE;
    }
    //return BusinessStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
