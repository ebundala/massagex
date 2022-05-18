enum PaymentMethodStatus { ENABLED, DISABLED }

extension PaymentMethodStatusExt on PaymentMethodStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case PaymentMethodStatus.ENABLED:
        return "ENABLED";
      case PaymentMethodStatus.DISABLED:
        return "DISABLED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static PaymentMethodStatus fromJson(String json) {
    switch (json) {
      case "ENABLED":
        return PaymentMethodStatus.ENABLED;
      case "DISABLED":
        return PaymentMethodStatus.DISABLED;
      default:
        return PaymentMethodStatus.ENABLED;
    }
    //return PaymentMethodStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
