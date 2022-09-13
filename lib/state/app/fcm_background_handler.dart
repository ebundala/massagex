import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:massagex/utils.dart';
import 'package:models/order.dart';
import 'package:models/review.dart';
import 'package:models/notification.dart' as nt;

import 'app_bloc.dart';

const AndroidNotificationChannel androidNotificationChanel =
    AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
  playSound: true,
);

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();
  await Hive.initFlutter();
  var settings = await Hive.openBox(AppBloc.userSettingsKey);
  final notification = await handleNotificationPayload(settings, message);
  await settings.close();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(
    android: AndroidInitializationSettings(
      "launch_background",
    ),
  ));
  if (!kIsWeb) {
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChanel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    // await FirebaseMessaging.instance
    //     .setForegroundNotificationPresentationOptions(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );
    final data = parseNotification(notification!);
    var body = "";
    if (data is Order) {
      body = data.service!.name!;
    }

    if (data is Review) {
      body = data.author!.displayName!;
    }
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.message ?? " ",
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              androidNotificationChanel.id, androidNotificationChanel.name,
              channelDescription: androidNotificationChanel.description,
              fullScreenIntent: true,
              importance: Importance.max,
              priority: Priority.max
              // icon: 'ic_launcher',
              ),
        ),
        payload: message.data["payload"]);
  }
}

Future<nt.Notification?> handleNotificationPayload(
    Box box, RemoteMessage message) async {
  try {
    if (message.data['payload'] != null) {
      // await box.delete(AppBloc.notificationsKey);
      var notifications =
          await box.get(AppBloc.notificationsKey, defaultValue: <dynamic>[])
              as List<dynamic>;
      final notification =
          jsonDecode(message.data["payload"]) as Map<dynamic, dynamic>;
      notifications.add(notification);

      await box.put(AppBloc.notificationsKey, notifications);
      return nt.Notification.fromJson(notification);
    }
  } catch (e) {
    return null;
  }
  return null;
}
