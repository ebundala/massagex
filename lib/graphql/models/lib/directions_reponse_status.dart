enum DirectionsReponseStatus {
  OK,
  NOT$FOUND,
  ZERO$RESULTS,
  MAX$WAYPOINTS$EXCEEDED,
  MAX$ROUTE$LENGTH$EXCEEDED,
  INVALID$REQUEST,
  OVER$DAILY$LIMIT,
  OVER$QUERY$LIMIT,
  REQUEST$DENIED,
  UNKNOWN$ERROR
}

extension DirectionsReponseStatusExt on DirectionsReponseStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case DirectionsReponseStatus.OK:
        return "OK";
      case DirectionsReponseStatus.NOT$FOUND:
        return "NOT_FOUND";
      case DirectionsReponseStatus.ZERO$RESULTS:
        return "ZERO_RESULTS";
      case DirectionsReponseStatus.MAX$WAYPOINTS$EXCEEDED:
        return "MAX_WAYPOINTS_EXCEEDED";
      case DirectionsReponseStatus.MAX$ROUTE$LENGTH$EXCEEDED:
        return "MAX_ROUTE_LENGTH_EXCEEDED";
      case DirectionsReponseStatus.INVALID$REQUEST:
        return "INVALID_REQUEST";
      case DirectionsReponseStatus.OVER$DAILY$LIMIT:
        return "OVER_DAILY_LIMIT";
      case DirectionsReponseStatus.OVER$QUERY$LIMIT:
        return "OVER_QUERY_LIMIT";
      case DirectionsReponseStatus.REQUEST$DENIED:
        return "REQUEST_DENIED";
      case DirectionsReponseStatus.UNKNOWN$ERROR:
        return "UNKNOWN_ERROR";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static DirectionsReponseStatus fromJson(String json) {
    switch (json) {
      case "OK":
        return DirectionsReponseStatus.OK;
      case "NOT_FOUND":
        return DirectionsReponseStatus.NOT$FOUND;
      case "ZERO_RESULTS":
        return DirectionsReponseStatus.ZERO$RESULTS;
      case "MAX_WAYPOINTS_EXCEEDED":
        return DirectionsReponseStatus.MAX$WAYPOINTS$EXCEEDED;
      case "MAX_ROUTE_LENGTH_EXCEEDED":
        return DirectionsReponseStatus.MAX$ROUTE$LENGTH$EXCEEDED;
      case "INVALID_REQUEST":
        return DirectionsReponseStatus.INVALID$REQUEST;
      case "OVER_DAILY_LIMIT":
        return DirectionsReponseStatus.OVER$DAILY$LIMIT;
      case "OVER_QUERY_LIMIT":
        return DirectionsReponseStatus.OVER$QUERY$LIMIT;
      case "REQUEST_DENIED":
        return DirectionsReponseStatus.REQUEST$DENIED;
      case "UNKNOWN_ERROR":
        return DirectionsReponseStatus.UNKNOWN$ERROR;
      default:
        return DirectionsReponseStatus.OK;
    }
    //return DirectionsReponseStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
