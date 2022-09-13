import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/notification.dart' as nt;
import 'package:models/notification_type.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: StreamBuilder<BoxEvent>(
          initialData: BoxEvent(AppBloc.notificationsKey,
              context.app.userSettings!.get(AppBloc.notificationsKey), false),
          stream:
              context.app.userSettings!.watch(key: AppBloc.notificationsKey),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final items = ((snapshot.data?.value ?? []) as List)
                .map((e) => nt.Notification.fromJson(e))
                .toList();

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) {
                final item = items[index];

                return ListTile(
                  leading: const Icon(
                    IconlyLight.notification,
                  ),
                  onTap: () => context.app.removeSeenNotification(item),
                  title: Nunito(
                    text: "${item.message}",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: Nunito(
                      text: item.notificationType!
                          .toJson()
                          .replaceAll("_", " ")
                          .toLowerCase(),
                      fontWeight: FontWeight.w500),
                );
              }),
            );
          },
        ));
  }
}
