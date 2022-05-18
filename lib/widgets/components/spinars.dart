import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimarySpinar extends StatelessWidget {
  const PrimarySpinar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CompletedSpinar extends StatelessWidget {
  const CompletedSpinar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@WidgetbookUseCase(name: "primary", type: PrimarySpinar)
Widget getSpinar(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PrimarySpinar(),
      ),
    );

@WidgetbookUseCase(name: "completed", type: CompletedSpinar)
Widget getSpinar1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: CompletedSpinar(),
      ),
    );
