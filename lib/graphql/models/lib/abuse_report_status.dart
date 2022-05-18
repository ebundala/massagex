enum AbuseReportStatus { SUBMITED, PROCESSING, MITIGATED }

extension AbuseReportStatusExt on AbuseReportStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AbuseReportStatus.SUBMITED:
        return "SUBMITED";
      case AbuseReportStatus.PROCESSING:
        return "PROCESSING";
      case AbuseReportStatus.MITIGATED:
        return "MITIGATED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AbuseReportStatus fromJson(String json) {
    switch (json) {
      case "SUBMITED":
        return AbuseReportStatus.SUBMITED;
      case "PROCESSING":
        return AbuseReportStatus.PROCESSING;
      case "MITIGATED":
        return AbuseReportStatus.MITIGATED;
      default:
        return AbuseReportStatus.SUBMITED;
    }
    //return AbuseReportStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
