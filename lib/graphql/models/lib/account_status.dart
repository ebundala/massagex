enum AccountStatus { ENABLED, DISABLED, DELETED }

extension AccountStatusExt on AccountStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AccountStatus.ENABLED:
        return "ENABLED";
      case AccountStatus.DISABLED:
        return "DISABLED";
      case AccountStatus.DELETED:
        return "DELETED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AccountStatus fromJson(String json) {
    switch (json) {
      case "ENABLED":
        return AccountStatus.ENABLED;
      case "DISABLED":
        return AccountStatus.DISABLED;
      case "DELETED":
        return AccountStatus.DELETED;
      default:
        return AccountStatus.ENABLED;
    }
    //return AccountStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
