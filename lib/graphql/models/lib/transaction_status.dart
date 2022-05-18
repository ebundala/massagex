enum TransactionStatus { PENDING, SUCCESS, FAILED }

extension TransactionStatusExt on TransactionStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TransactionStatus.PENDING:
        return "PENDING";
      case TransactionStatus.SUCCESS:
        return "SUCCESS";
      case TransactionStatus.FAILED:
        return "FAILED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TransactionStatus fromJson(String json) {
    switch (json) {
      case "PENDING":
        return TransactionStatus.PENDING;
      case "SUCCESS":
        return TransactionStatus.SUCCESS;
      case "FAILED":
        return TransactionStatus.FAILED;
      default:
        return TransactionStatus.PENDING;
    }
    //return TransactionStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
