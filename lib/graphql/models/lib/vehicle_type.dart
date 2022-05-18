enum VehicleType {
  RAIL,
  METRO$RAIL,
  SUBWAY,
  TRAM,
  MONORAIL,
  HEAVY$RAIL,
  COMMUTER$TRAIN,
  HIGH$SPEED$TRAIN,
  BUS,
  INTERCITY$BUS,
  TROLLEYBUS,
  SHARE$TAXI,
  FERRY,
  CABLE$CAR,
  GONDOLA$LIFT,
  FUNICULAR,
  OTHER
}

extension VehicleTypeExt on VehicleType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case VehicleType.RAIL:
        return "RAIL";
      case VehicleType.METRO$RAIL:
        return "METRO_RAIL";
      case VehicleType.SUBWAY:
        return "SUBWAY";
      case VehicleType.TRAM:
        return "TRAM";
      case VehicleType.MONORAIL:
        return "MONORAIL";
      case VehicleType.HEAVY$RAIL:
        return "HEAVY_RAIL";
      case VehicleType.COMMUTER$TRAIN:
        return "COMMUTER_TRAIN";
      case VehicleType.HIGH$SPEED$TRAIN:
        return "HIGH_SPEED_TRAIN";
      case VehicleType.BUS:
        return "BUS";
      case VehicleType.INTERCITY$BUS:
        return "INTERCITY_BUS";
      case VehicleType.TROLLEYBUS:
        return "TROLLEYBUS";
      case VehicleType.SHARE$TAXI:
        return "SHARE_TAXI";
      case VehicleType.FERRY:
        return "FERRY";
      case VehicleType.CABLE$CAR:
        return "CABLE_CAR";
      case VehicleType.GONDOLA$LIFT:
        return "GONDOLA_LIFT";
      case VehicleType.FUNICULAR:
        return "FUNICULAR";
      case VehicleType.OTHER:
        return "OTHER";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static VehicleType fromJson(String json) {
    switch (json) {
      case "RAIL":
        return VehicleType.RAIL;
      case "METRO_RAIL":
        return VehicleType.METRO$RAIL;
      case "SUBWAY":
        return VehicleType.SUBWAY;
      case "TRAM":
        return VehicleType.TRAM;
      case "MONORAIL":
        return VehicleType.MONORAIL;
      case "HEAVY_RAIL":
        return VehicleType.HEAVY$RAIL;
      case "COMMUTER_TRAIN":
        return VehicleType.COMMUTER$TRAIN;
      case "HIGH_SPEED_TRAIN":
        return VehicleType.HIGH$SPEED$TRAIN;
      case "BUS":
        return VehicleType.BUS;
      case "INTERCITY_BUS":
        return VehicleType.INTERCITY$BUS;
      case "TROLLEYBUS":
        return VehicleType.TROLLEYBUS;
      case "SHARE_TAXI":
        return VehicleType.SHARE$TAXI;
      case "FERRY":
        return VehicleType.FERRY;
      case "CABLE_CAR":
        return VehicleType.CABLE$CAR;
      case "GONDOLA_LIFT":
        return VehicleType.GONDOLA$LIFT;
      case "FUNICULAR":
        return VehicleType.FUNICULAR;
      case "OTHER":
        return VehicleType.OTHER;
      default:
        return VehicleType.RAIL;
    }
    //return VehicleType.values.firstWhere((e) => e.toJson() == json);
  }
}
