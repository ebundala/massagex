import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class InactivePageIndicator extends StatelessWidget {
  final Color? color;

  const InactivePageIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 4.913707733154297,
        height: 4.717160224914551,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(56),
            topRight: Radius.circular(56),
            bottomLeft: Radius.circular(56),
            bottomRight: Radius.circular(56),
          ),
          color: color ?? const Color.fromRGBO(0, 0, 0, 1),
        ));
  }
}

@WidgetbookUseCase(name: "Default", type: InactivePageIndicator)
Widget getInactivePageIndicator(BuildContext context) =>
    const Center(child: InactivePageIndicator());

@WidgetbookUseCase(name: "primary", type: InactivePageIndicator)
Widget getInactivePageIndicator1(BuildContext context) => Container(
    height: 300,
    width: 300,
    color: Theme.of(context).colorScheme.primary,
    child: Center(
        child: InactivePageIndicator(
      color: Theme.of(context).colorScheme.onPrimary,
    )));

@WidgetbookUseCase(name: "secondary", type: InactivePageIndicator)
Widget getInactivePageIndicator2(BuildContext context) => Container(
    height: 300,
    width: 300,
    color: Theme.of(context).colorScheme.secondary,
    child: Center(
        child: InactivePageIndicator(
      color: Theme.of(context).colorScheme.onSecondary,
    )));
