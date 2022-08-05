import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import "package:massagex/widgets/icons/arrow_next.dart";

class SkipIntroActionContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const SkipIntroActionContainer({Key? key, required this.child, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 60,
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius:
              const BorderRadius.only(topLeft: Radius.elliptical(104, 110))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
          child: child,
        ),
      ),
    );
  }
}

@WidgetbookUseCase(name: "primary", type: SkipIntroActionContainer)
Widget getSkipIntroActionContainer(BuildContext context) => Center(
    child: SkipIntroActionContainer(
        child: ArrowNext(color: Theme.of(context).colorScheme.onPrimary)));

@WidgetbookUseCase(name: "secondary", type: SkipIntroActionContainer)
Widget getSkipIntroActionContainerSecondary(BuildContext context) => Center(
      child: SkipIntroActionContainer(
        color: Theme.of(context).colorScheme.secondary,
        child: ArrowNext(color: Theme.of(context).colorScheme.onSecondary),
      ),
    );

@WidgetbookUseCase(name: "Tertiary", type: SkipIntroActionContainer)
Widget getSkipIntroActionContainerTertiary(BuildContext context) => Center(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        height: 300,
        width: 300,
        child: Center(
          child: SkipIntroActionContainer(
            color: Theme.of(context).colorScheme.background,
            child: ArrowNext(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
