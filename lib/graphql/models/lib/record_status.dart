enum RecordStatus { DRAFT, ACTIVE, INACTIVE, DELETED }

extension RecordStatusExt on RecordStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case RecordStatus.DRAFT:
        return "DRAFT";
      case RecordStatus.ACTIVE:
        return "ACTIVE";
      case RecordStatus.INACTIVE:
        return "INACTIVE";
      case RecordStatus.DELETED:
        return "DELETED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static RecordStatus fromJson(String json) {
    switch (json) {
      case "DRAFT":
        return RecordStatus.DRAFT;
      case "ACTIVE":
        return RecordStatus.ACTIVE;
      case "INACTIVE":
        return RecordStatus.INACTIVE;
      case "DELETED":
        return RecordStatus.DELETED;
      default:
        return RecordStatus.DRAFT;
    }
    //return RecordStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
