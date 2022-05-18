enum OrderStatus { WAITING, ACCEPTED, REJECTED, PROCESSED }

extension OrderStatusExt on OrderStatus {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case OrderStatus.WAITING:
        return "WAITING";
      case OrderStatus.ACCEPTED:
        return "ACCEPTED";
      case OrderStatus.REJECTED:
        return "REJECTED";
      case OrderStatus.PROCESSED:
        return "PROCESSED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static OrderStatus fromJson(String json) {
    switch (json) {
      case "WAITING":
        return OrderStatus.WAITING;
      case "ACCEPTED":
        return OrderStatus.ACCEPTED;
      case "REJECTED":
        return OrderStatus.REJECTED;
      case "PROCESSED":
        return OrderStatus.PROCESSED;
      default:
        return OrderStatus.WAITING;
    }
    //return OrderStatus.values.firstWhere((e) => e.toJson() == json);
  }
}
