import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/pages/notifications_page_view.dart';
import 'package:massagex/pages/orders_page_view.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/pages/home_page_view.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({
    Key? key,
  }) : super(key: key);

  @override
  UserHomePageState createState() => UserHomePageState();
}

int currentPage = 0;
final controller = PageController(initialPage: 0);

class UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayoutWidget(
      title:
          "Hello, ${context.app.currentUser?.data?.displayName?.split(" ").first ?? ''}",
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 6,
        onTap: (value) {
          setState(() {
            currentPage = value;
            controller.animateToPage(currentPage,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn);
          });
        },
        currentIndex: currentPage,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(IconlyLight.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(IconlyLight.calendar), label: "Schedule"),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Positioned.fill(
                        child: Icon(IconlyLight.notification)),
                    Positioned(
                        top: -8,
                        right: -8,

                        // width: 12,
                        child: StreamBuilder<Object>(
                            stream: context.app.userSettings!
                                .watch(key: AppBloc.notificationsKey),
                            builder: (context, snapshot) {
                              final notifications = context.app.userSettings!
                                  .get(AppBloc.notificationsKey,
                                      defaultValue: []) as List;
                              if (notifications.isEmpty) {
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              }
                              return Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                child: Nunito(
                                  text: "${notifications.length}",
                                  fontSize: 12,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              );
                            }))
                  ],
                ),
              ),
              label: "Notification"),
          const BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile), label: "Profile")
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: controller,
          onPageChanged: (i) {
            setState(() {
              currentPage = i;
            });
          },
          children: [
            const HomePage(),
            const OrdersPage(),
            const NotificationsPage(),
            Container(color: Colors.blueGrey)
          ],
        ),
      ),
    );
  }
}
