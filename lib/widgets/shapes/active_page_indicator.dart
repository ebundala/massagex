import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ActivePageIndicator extends StatelessWidget {
  final Color? activeColor;

  const ActivePageIndicator({Key? key, this.activeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.010189056396484,
        height: 4.717160224914551,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(56),
            topRight: Radius.circular(56),
            bottomLeft: Radius.circular(56),
            bottomRight: Radius.circular(56),
          ),
          color: activeColor ?? Theme.of(context).colorScheme.secondary,
        ));
  }
}

@WidgetbookUseCase(name: "Default", type: ActivePageIndicator)
Widget getActivePageIndicator(BuildContext context) =>
    const Center(child: ActivePageIndicator());

@WidgetbookUseCase(name: "primary", type: ActivePageIndicator)
Widget getActivePageIndicator1(BuildContext context) => Container(
    height: 300,
    color: Theme.of(context).colorScheme.primary,
    child: Center(
        child: ActivePageIndicator(
      activeColor: Theme.of(context).colorScheme.onPrimary,
    )));

@WidgetbookUseCase(name: "secondary", type: ActivePageIndicator)
Widget getActivePageIndicator2(BuildContext context) => Container(
    height: 300,
    color: Theme.of(context).colorScheme.secondary,
    child: Center(
        child: ActivePageIndicator(
      activeColor: Theme.of(context).colorScheme.onSecondary,
    )));
