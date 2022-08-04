import 'package:flutter/material.dart';
import 'package:massagex/widgets/components/spinars.dart';
import 'package:massagex/widgets/texts/app_name.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: PrimarySpinar(
        child: Center(
          child: AppName(
            fontSize: 20,
          ),
        ),
      )),
    );
  }
}
