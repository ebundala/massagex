import 'package:flutter/material.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class IntroHeading extends StatelessWidget {
  final Color? color;
  final String text;
  const IntroHeading({Key? key, this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? Theme.of(context).colorScheme.secondary;

    return PlayfairDisplay(
      text: text,
      textAlign: TextAlign.left,
      color: textColor,
      fontSize: 26,
      letterSpacing: 0,
      fontWeight: FontWeight.normal,
      height: 1,
    );
  }
}

const text = 'Find amazing massage service near you';
@WidgetbookUseCase(name: "Default", type: IntroHeading)
Widget getIntroHeading(BuildContext context) =>
    const Center(child: IntroHeading(text: text));

@WidgetbookUseCase(name: "secondary", type: IntroHeading)
Widget getIntroHeadingWhite(BuildContext context) => Center(
      child: Container(
        height: 400,
        color: Theme.of(context).colorScheme.secondary,
        child: IntroHeading(
            text: text, color: Theme.of(context).colorScheme.background),
      ),
    );
