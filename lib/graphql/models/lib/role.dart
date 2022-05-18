enum Role { ADMIN, MODERATOR, BUSINESS, USER }

extension RoleExt on Role {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case Role.ADMIN:
        return "ADMIN";
      case Role.MODERATOR:
        return "MODERATOR";
      case Role.BUSINESS:
        return "BUSINESS";
      case Role.USER:
        return "USER";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static Role fromJson(String json) {
    switch (json) {
      case "ADMIN":
        return Role.ADMIN;
      case "MODERATOR":
        return Role.MODERATOR;
      case "BUSINESS":
        return Role.BUSINESS;
      case "USER":
        return Role.USER;
      default:
        return Role.ADMIN;
    }
    //return Role.values.firstWhere((e) => e.toJson() == json);
  }
}
