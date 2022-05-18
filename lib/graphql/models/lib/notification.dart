import 'notification_type.dart';
import 'scalars/json_object.dart';

import "package:equatable/equatable.dart";

class Notification extends Equatable {
  final NotificationType? notificationType;
  final String? message;
  final JSONObject? payload;
  Notification({this.notificationType, this.message, this.payload});

  static Notification fromJson(Map<dynamic, dynamic> json) {
    return Notification(
      notificationType: json['notificationType'] != null
          ? NotificationTypeExt.fromJson(json['notificationType'])
          : null,
      message: json['message'],
      payload:
          json['payload'] != null ? JSONObject.fromJson(json['payload']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    if (notificationType != null)
      _data['notificationType'] = notificationType!.toJson();
    if (message != null) _data['message'] = message;
    if (payload != null) _data['payload'] = payload!.toJson();
    return _data;
  }

  Notification copyWith(
      {NotificationType? notificationType,
      String? message,
      JSONObject? payload}) {
    return Notification(
        notificationType: notificationType ?? this.notificationType,
        message: message ?? this.message,
        payload: payload ?? this.payload);
  }

  List<Object?> get props => [notificationType, message, payload];
}
