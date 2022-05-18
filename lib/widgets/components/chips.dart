import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class OutlinedChip extends StatelessWidget {
  const OutlinedChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DistanceChip extends StatelessWidget {
  const DistanceChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@WidgetbookUseCase(name: "outlined", type: OutlinedChip)
Widget getChip(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: OutlinedChip(),
      ),
    );

@WidgetbookUseCase(name: "distance", type: DistanceChip)
Widget getChip1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: DistanceChip(),
      ),
    );
