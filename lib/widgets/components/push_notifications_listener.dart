import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:models/notification.dart' as nt;
import 'package:models/notification_type.dart';
import 'package:models/order.dart';
import 'package:models/review.dart';

class PushNotificationsListener extends StatefulWidget {
  const PushNotificationsListener({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  State<PushNotificationsListener> createState() =>
      _PushNotificationsListenerState();
}

class _PushNotificationsListenerState extends State<PushNotificationsListener>
    with WidgetsBindingObserver {
  StreamSubscription<BoxEvent>? newOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? acceptedOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? canceledOrderNotificationSubscription;
  StreamSubscription<BoxEvent>? procesedOrderNotificationSubscription;
  final List<AppLifecycleState> _stateHistoryList = [];
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

  parseNotification(BuildContext context, nt.Notification notification) async {
    switch (notification.notificationType) {
      case NotificationType.ORDER$RECIEVED:
        final order = Order.fromJson(notification.payload!.value);
        print("Order received");

        await context
            .showIncomingRequestNotification(order: order)
            .then((value) {
          context.app
            ..add(const AppResseted())
            ..add(AppNotifiedAck(notification));
        });
        break;
      case NotificationType.ORDER$CANCELLED:
        final order = Order.fromJson(notification.payload!.value);
        print("Order canceled");
        break;
      case NotificationType.ORDER$DISPATCHED:
        break;
      case NotificationType.ORDER$ACCEPTED:
        final order = Order.fromJson(notification.payload!.value);
        print("Order accepted");
        break;
      case NotificationType.ORDER$PAYED:
        final order = Order.fromJson(notification.payload!.value);
        print("Order payed");
        break;
      case NotificationType.ORDER$DELIVERED:
        break;
      case NotificationType.ORDER$UPDATED:
        break;
      case NotificationType.REVIEW$RECIEVED:
        break;
      case NotificationType.REVIEW$UPDATED:
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (WidgetsBinding.instance.lifecycleState != null) {
      _stateHistoryList.add(WidgetsBinding.instance.lifecycleState!);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _stateHistoryList.add(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
        listener: (BuildContext context, state) {
          if (state is AppNewNotification) {
            // handle notifications
            print(state.notification);
            parseNotification(context, state.notification);
          }
        },
        child: widget.child);
  }
}
