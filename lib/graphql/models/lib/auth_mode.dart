enum AuthMode { EMAIL, PHONE, OAUTH, ANONYMOUS }

extension AuthModeExt on AuthMode {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case AuthMode.EMAIL:
        return "EMAIL";
      case AuthMode.PHONE:
        return "PHONE";
      case AuthMode.OAUTH:
        return "OAUTH";
      case AuthMode.ANONYMOUS:
        return "ANONYMOUS";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static AuthMode fromJson(String json) {
    switch (json) {
      case "EMAIL":
        return AuthMode.EMAIL;
      case "PHONE":
        return AuthMode.PHONE;
      case "OAUTH":
        return AuthMode.OAUTH;
      case "ANONYMOUS":
        return AuthMode.ANONYMOUS;
      default:
        return AuthMode.EMAIL;
    }
    //return AuthMode.values.firstWhere((e) => e.toJson() == json);
  }
}
