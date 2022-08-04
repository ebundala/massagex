import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:massagex/utils.dart';

import 'package:models/notification.dart' as _;
import 'package:models/notification_type.dart';
import 'package:models/order.dart';
import 'package:models/review.dart';

import 'app_bloc.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //await Firebase.initializeApp();
  await Hive.initFlutter();
  var settings = await Hive.openBox(AppBloc.userSettingsKey);
  final notification = await handleNotificationPayload(settings, message);
  await settings.close();
  AndroidNotificationChannel channel;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(
          "logo",
        ),
      ), onSelectNotification: (payload) {
    try {
      // final data = jsonDecode(payload!);
      // final item = _.Notification.fromJson(data);

      return;
    } catch (e) {
      return;
    }
  });
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

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
        notification.notificationType!.toJson().replaceAll(RegExp("_"), " "),
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            //  icon: 'launch_background',
          ),
        ),
        payload: message.data["payload"]);
  }
}
