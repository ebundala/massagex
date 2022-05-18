import 'package:flutter/material.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class IntroParagraph extends StatelessWidget {
  final Color? color;

  final String text;

  const IntroParagraph({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = color ?? Theme.of(context).colorScheme.primary;
    return Nunito(
      text: text,
      textAlign: TextAlign.left,
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }
}

const text =
    'It is a long established fact that a reader will be distracted by the readable content of a page.';
@WidgetbookUseCase(name: "Default", type: IntroParagraph)
Widget getIntroParagraph(BuildContext context) => const Center(
        child: IntroParagraph(
      text: text,
    ));

@WidgetbookUseCase(name: "primary", type: IntroParagraph)
Widget getIntroParagraphWhite(BuildContext context) => Center(
      child: Container(
          height: 400,
          color: Theme.of(context).colorScheme.primary,
          child: Center(
            child: IntroParagraph(
              color: Theme.of(context).colorScheme.onPrimary,
              text: text,
            ),
          )),
    );

@WidgetbookUseCase(name: "secondary", type: IntroParagraph)
Widget getIntroParagraphWhite1(BuildContext context) => Center(
      child: Container(
          height: 400,
          color: Theme.of(context).colorScheme.secondary,
          child: Center(
            child: IntroParagraph(
              color: Theme.of(context).colorScheme.onSecondary,
              text: text,
            ),
          )),
    );
