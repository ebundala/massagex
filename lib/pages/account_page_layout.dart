import 'package:flutter/material.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class AcountPageLayoutWidget extends StatelessWidget {
  const AcountPageLayoutWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.actions,
      this.children = const []})
      : super(key: key);
  final String title;
  final String subTitle;
  final List<Widget>? actions;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          AppBar(
            // leading: BackButton(
            //   onPressed: () {
            //     if (Navigator.of(context).canPop()) {
            //       Navigator.of(context).pop();
            //     }
            //   },
            // ),
            elevation: 0,
            leadingWidth: 0,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            foregroundColor: Theme.of(context).colorScheme.primary,
          ),
          const AppName(
            isPrimary: false,
          ),
          PlayfairDisplay(
            text: title,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          Nunito(
            text: subTitle,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          ...children
        ],
      ),
    );
  }
}
