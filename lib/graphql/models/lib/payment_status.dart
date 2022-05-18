enum PaymentStatus { PENDING, SUCCESS, FAILED }

extension PaymentStatusExt on PaymentStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case PaymentStatus.PENDING:
        return "PENDING";
      case PaymentStatus.SUCCESS:
        return "SUCCESS";
      case PaymentStatus.FAILED:
        return "FAILED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static PaymentStatus fromJson(String json) {
    switch (json) {
      case "PENDING":
        return PaymentStatus.PENDING;
      case "SUCCESS":
        return PaymentStatus.SUCCESS;
      case "FAILED":
        return PaymentStatus.FAILED;
      default:
        return PaymentStatus.PENDING;
    }
    //return PaymentStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
