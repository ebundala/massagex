enum Gender { MALE, FEMALE, UNSPECIFIED }

extension GenderExt on Gender {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case Gender.MALE:
        return "MALE";
      case Gender.FEMALE:
        return "FEMALE";
      case Gender.UNSPECIFIED:
        return "UNSPECIFIED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static Gender fromJson(String json) {
    switch (json) {
      case "MALE":
        return Gender.MALE;
      case "FEMALE":
        return Gender.FEMALE;
      case "UNSPECIFIED":
        return Gender.UNSPECIFIED;
      default:
        return Gender.MALE;
    }
    //return Gender.values.firstWhere((e) => e.toJson() == json);
  }
}
