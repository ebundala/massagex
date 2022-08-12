enum LocationScalarFieldEnum {
  id,
  name,
  lat,
  lon,
  heading,
  recordStatus,
  createdAt,
  updatedAt
}

extension LocationScalarFieldEnumExt on LocationScalarFieldEnum {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case LocationScalarFieldEnum.id:
        return "id";
      case LocationScalarFieldEnum.name:
        return "name";
      case LocationScalarFieldEnum.lat:
        return "lat";
      case LocationScalarFieldEnum.lon:
        return "lon";
      case LocationScalarFieldEnum.heading:
        return "heading";
      case LocationScalarFieldEnum.recordStatus:
        return "recordStatus";
      case LocationScalarFieldEnum.createdAt:
        return "createdAt";
      case LocationScalarFieldEnum.updatedAt:
        return "updatedAt";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static LocationScalarFieldEnum fromJson(String json) {
    switch (json) {
      case "id":
        return LocationScalarFieldEnum.id;
      case "name":
        return LocationScalarFieldEnum.name;
      case "lat":
        return LocationScalarFieldEnum.lat;
      case "lon":
        return LocationScalarFieldEnum.lon;
      case "heading":
        return LocationScalarFieldEnum.heading;
      case "recordStatus":
        return LocationScalarFieldEnum.recordStatus;
      case "createdAt":
        return LocationScalarFieldEnum.createdAt;
      case "updatedAt":
        return LocationScalarFieldEnum.updatedAt;
      default:
        return LocationScalarFieldEnum.id;
    }
    //return LocationScalarFieldEnum.values.firstWhere((e) => e.toJson() == json);
  }
}
