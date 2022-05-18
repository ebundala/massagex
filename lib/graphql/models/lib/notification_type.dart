enum NotificationType {
  ORDER$RECIEVED,
  ORDER$CANCELLED,
  ORDER$DISPATCHED,
  ORDER$ACCEPTED,
  ORDER$PAYED,
  ORDER$DELIVERED,
  ORDER$UPDATED,
  REVIEW$RECIEVED,
  REVIEW$UPDATED
}

extension NotificationTypeExt on NotificationType {
  String toJson() {
    //final v = toString().split(".").last;
    switch (this) {
      case NotificationType.ORDER$RECIEVED:
        return "ORDER_RECIEVED";
      case NotificationType.ORDER$CANCELLED:
        return "ORDER_CANCELLED";
      case NotificationType.ORDER$DISPATCHED:
        return "ORDER_DISPATCHED";
      case NotificationType.ORDER$ACCEPTED:
        return "ORDER_ACCEPTED";
      case NotificationType.ORDER$PAYED:
        return "ORDER_PAYED";
      case NotificationType.ORDER$DELIVERED:
        return "ORDER_DELIVERED";
      case NotificationType.ORDER$UPDATED:
        return "ORDER_UPDATED";
      case NotificationType.REVIEW$RECIEVED:
        return "REVIEW_RECIEVED";
      case NotificationType.REVIEW$UPDATED:
        return "REVIEW_UPDATED";
      default:
        return '';
    }
    //return toString().split(".").last;
  }

  static NotificationType fromJson(String json) {
    switch (json) {
      case "ORDER_RECIEVED":
        return NotificationType.ORDER$RECIEVED;
      case "ORDER_CANCELLED":
        return NotificationType.ORDER$CANCELLED;
      case "ORDER_DISPATCHED":
        return NotificationType.ORDER$DISPATCHED;
      case "ORDER_ACCEPTED":
        return NotificationType.ORDER$ACCEPTED;
      case "ORDER_PAYED":
        return NotificationType.ORDER$PAYED;
      case "ORDER_DELIVERED":
        return NotificationType.ORDER$DELIVERED;
      case "ORDER_UPDATED":
        return NotificationType.ORDER$UPDATED;
      case "REVIEW_RECIEVED":
        return NotificationType.REVIEW$RECIEVED;
      case "REVIEW_UPDATED":
        return NotificationType.REVIEW$UPDATED;
      default:
        return NotificationType.ORDER$RECIEVED;
    }
    //return NotificationType.values.firstWhere((e) => e.toJson() == json);
  }
}
