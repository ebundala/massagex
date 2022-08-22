import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/pages/orders_page_view.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/pages/home_page_view.dart';

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
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.calendar), label: "Schedule"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.notification), label: "Notification"),
          BottomNavigationBarItem(
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
            Container(color: Colors.black),
            Container(color: Colors.blueGrey)
          ],
        ),
      ),
    );
  }
}
