import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryBadge extends StatelessWidget {
  const PrimaryBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SecondaryBadge extends StatelessWidget {
  const SecondaryBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryBadge)
Widget getBadge(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PrimaryBadge(),
      ),
    );

@WidgetbookUseCase(name: "secondary", type: SecondaryBadge)
Widget getBadge1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: SecondaryBadge(),
      ),
    );
