enum TransactionType { PAYMENT, DISBURSEMENT }

extension TransactionTypeExt on TransactionType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case TransactionType.PAYMENT:
        return "PAYMENT";
      case TransactionType.DISBURSEMENT:
        return "DISBURSEMENT";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static TransactionType fromJson(String json) {
    switch (json) {
      case "PAYMENT":
        return TransactionType.PAYMENT;
      case "DISBURSEMENT":
        return TransactionType.DISBURSEMENT;
      default:
        return TransactionType.PAYMENT;
    }
    //return TransactionType.values.firstWhere((e) => e.toJson() == json);
  }
}
