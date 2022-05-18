import 'package:flutter/material.dart';
import 'package:massagex/widgets/shapes/active_page_indicator.dart';
import 'package:massagex/widgets/shapes/inactive_page_indicator.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class PageIndicator extends StatelessWidget {
  final int selected;
  final int pageCount;
  final Color? activeColor;
  final Color? inactiveColor;
  final Duration duration;
  const PageIndicator(
      {Key? key,
      this.selected = 0,
      required this.pageCount,
      this.duration = const Duration(milliseconds: 500),
      this.activeColor,
      this.inactiveColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(pageCount, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: AnimatedCrossFade(
              firstChild: InactivePageIndicator(
                color: inactiveColor,
              ),
              secondChild: ActivePageIndicator(
                activeColor: activeColor,
              ),
              crossFadeState: selected == index
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: duration,
            ),
          );
        })
      ],
    );
  }
}

@WidgetbookUseCase(name: "default", type: PageIndicator)
Widget getPageIndicator(BuildContext context) {
  final page = context.knobs.number(label: "pages", initialValue: 0);
  return Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 160,
          child: PageIndicator(
            pageCount: 6,
            selected: page as int,
          ),
        ),
      ));
}

@WidgetbookUseCase(name: "primary", type: PageIndicator)
Widget getPageIndicator1(BuildContext context) {
  final page = context.knobs.number(label: "pages", initialValue: 0);
  return Container(
      color: Theme.of(context).colorScheme.primary,
      height: 500,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 160,
          child: PageIndicator(
            pageCount: 6,
            selected: page as int,
            activeColor: Theme.of(context).colorScheme.onPrimary,
            inactiveColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ));
}

@WidgetbookUseCase(name: "secondary", type: PageIndicator)
Widget getPageIndicator2(BuildContext context) {
  final page = context.knobs.number(label: "pages", initialValue: 0);
  return Container(
      color: Theme.of(context).colorScheme.secondary,
      height: 500,
      child: Center(
        child: SizedBox(
          height: 20,
          width: 160,
          child: PageIndicator(
            pageCount: 6,
            selected: page as int,
            activeColor: Theme.of(context).colorScheme.onSecondary,
            inactiveColor: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ));
}
