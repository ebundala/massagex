import 'package:flutter/material.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class IntroSkipTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  const IntroSkipTextWidget(
      {Key? key,
      required this.text,
      this.color = const Color.fromRGBO(0, 0, 0, 1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Nunito(
        text: text,
        textAlign: TextAlign.center,
        color: color,
        fontSize: 14,
        letterSpacing: 0,
        fontWeight: FontWeight.normal,
        height: 1.5);
  }
}

@WidgetbookUseCase(name: "default", type: IntroSkipTextWidget)
Widget getIntroSkipText(BuildContext context) => Center(
      child: Container(
        height: 200,
        width: 200,
        color: Theme.of(context).colorScheme.background,
        child: const Center(child: IntroSkipTextWidget(text: "Skip")),
      ),
    );

@WidgetbookUseCase(name: "onprimary", type: IntroSkipTextWidget)
Widget getIntroSkipText1(BuildContext context) => Center(
      child: Container(
        height: 200,
        width: 200,
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: IntroSkipTextWidget(
              text: "Skip", color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );

@WidgetbookUseCase(name: "onsecondry", type: IntroSkipTextWidget)
Widget getIntroSkipText2(BuildContext context) => Center(
      child: Container(
        height: 200,
        width: 200,
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
          child: IntroSkipTextWidget(
              text: "Skip", color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
