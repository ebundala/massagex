import 'package:models/image_size.dart';
import 'package:models/notification_type.dart';
import 'package:models/notification.dart' as _;
import 'package:models/order.dart';
import 'package:models/review.dart';
import 'package:url_launcher/url_launcher_string.dart';

const debug = false;
const url = debug ? "192.168.8.100" /* "10.0.2.2" */ : "itahuduma.com";
const _port = debug ? 3000 : null;
const _protocol = debug ? "http" : "https";
const _isSubscriotion = debug ? "ws" : "wss";

String serverUrl({
  bool isBase = false,
  int? port,
  String? protocal,
  bool isSubscription = false,
  String? path = "uploads/placeholder.png",
  ImageSize? thumbnail,
}) {
  port = port ?? _port;
  protocal = protocal ?? (isSubscription ? _isSubscriotion : _protocol);
  return "$protocal://$url${port != null ? ":$port/" : "/"}${isBase ? "" : path ?? "uploads/placeholder.png"}${thumbnail != null && path != null ? ".thumbnail-${thumbnail.toJson()}.webp" : ""}";
}

Future<void> launchUrl(
  String url, {
  LaunchMode mode = LaunchMode.platformDefault,
  WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
  String? webOnlyWindowName,
}) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url,
        mode: mode,
        webViewConfiguration: webViewConfiguration,
        webOnlyWindowName: webOnlyWindowName);
  }
}

parseNotification(_.Notification notification) {
  switch (notification.notificationType) {
    case NotificationType.ORDER$RECIEVED:

    case NotificationType.ORDER$CANCELLED:

    case NotificationType.ORDER$DISPATCHED:

    case NotificationType.ORDER$ACCEPTED:

    case NotificationType.ORDER$PAYED:

    case NotificationType.ORDER$DELIVERED:
    case NotificationType.ORDER$UPDATED:
      return Order.fromJson(notification.payload!.toJson());
    case NotificationType.REVIEW$RECIEVED:
    case NotificationType.REVIEW$UPDATED:
      return Review.fromJson(notification.payload!.toJson());
    default:
      return Null;
  }
}
