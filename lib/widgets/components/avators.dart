import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryAvator extends StatelessWidget {
  const PrimaryAvator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OutlinedAvator extends StatelessWidget {
  const OutlinedAvator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryAvator)
Widget getAvator(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PrimaryAvator(),
      ),
    );

@WidgetbookUseCase(name: "outlined", type: OutlinedAvator)
Widget getAvator1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: OutlinedAvator(),
      ),
    );
