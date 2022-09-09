import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:models/notification.dart' as nt;
import 'package:models/notification_type.dart';
import 'package:models/order.dart';

class PushNotificationsListener extends StatefulWidget {
  const PushNotificationsListener({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  State<PushNotificationsListener> createState() =>
      _PushNotificationsListenerState();
}

class _PushNotificationsListenerState extends State<PushNotificationsListener> {
  StreamSubscription<BoxEvent>? newOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? acceptedOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? canceledOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? procesedOrderNotificationSubscription;

  void stop() {
    newOrderNotificationSubscription?.cancel();
    acceptedOrderNotificationSubscription?.cancel();
    canceledOrderNotificationSubscription?.cancel();
    procesedOrderNotificationSubscription?.cancel();
  }

  void start() {
    newOrderNotificationSubscription = context.app.userSettings!
        .watch(key: AppBloc.notificationsKey)
        .listen((event) async {
      if (event.value != null && !event.deleted) {
        final rawData = (event.value as List)
            .map<nt.Notification?>((json) => nt.Notification.fromJson(json))
            .firstWhere(
                (element) =>
                    element?.notificationType ==
                    NotificationType.ORDER$RECIEVED,
                orElse: () => null);
        if (rawData != null) {
          final order = Order.fromJson(rawData.payload!.value);
          print("Order new order");

          await context
              .showIncomingRequestNotification(order: order)
              .then((value) {
            return context.app.removeSeenNotification(rawData);
          });
        }
      }
    });
    canceledOrderNotificationSubscription = context.app.userSettings!
        .watch(key: AppBloc.notificationsKey)
        .listen((event) async {
      if (event.value != null && !event.deleted) {
        final rawData = (event.value as List)
            .map<nt.Notification?>((json) => nt.Notification.fromJson(json))
            .firstWhere(
                (element) =>
                    element?.notificationType ==
                    NotificationType.ORDER$CANCELLED,
                orElse: () => null);
        if (rawData != null) {
          final order = Order.fromJson(rawData.payload!.value);

          // await context
          //     .showIncomingRequestNotification(order: order)
          //     .then((value) {
          //   return context.app.removeSeenNotification(rawData);
          // });
          context.app.removeSeenNotification(rawData);
          print("Order canceled");
        }
      }
    });
    procesedOrderNotificationSubscription = context.app.userSettings!
        .watch(key: AppBloc.notificationsKey)
        .listen((event) async {
      if (event.value != null && !event.deleted) {
        final rawData = (event.value as List)
            .map<nt.Notification?>((json) => nt.Notification.fromJson(json))
            .firstWhere(
                (element) =>
                    element?.notificationType ==
                    NotificationType.ORDER$DELIVERED,
                orElse: () => null);
        if (rawData != null) {
          final order = Order.fromJson(rawData.payload!.value);

          // await context
          //     .showIncomingRequestNotification(order: order)
          //     .then((value) {
          //   return context.app.removeSeenNotification(rawData);
          // });
          context.app.removeSeenNotification(rawData);
        }
      }
    });
    acceptedOrderNotificationSubscription = context.app.userSettings!
        .watch(key: AppBloc.notificationsKey)
        .listen((event) async {
      if (event.value != null && !event.deleted) {
        final rawData = (event.value as List)
            .map<nt.Notification?>((json) => nt.Notification.fromJson(json))
            .firstWhere(
                (element) =>
                    element?.notificationType ==
                    NotificationType.ORDER$ACCEPTED,
                orElse: () => null);
        if (rawData != null) {
          final order = Order.fromJson(rawData.payload!.value);
          print("Order accepted");
          // await context
          //     .showIncomingRequestNotification(order: order)
          //     .then((value) {
          //   return context.app.removeSeenNotification(rawData);
          // });
          context.app.removeSeenNotification(rawData);
        }
      }
    });
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
        listener: (BuildContext context, state) {
          if (state is AppAuthenticated) {
            start();
            //Start geolocation service
            context.app.startGeolocation();
          }
          if (state is AppLoggedOut) {
            stop();
            context.app.stopGeolocation();
          }
        },
        child: widget.child);
  }
}
