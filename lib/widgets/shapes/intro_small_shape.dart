import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class IntroSmallShape extends StatelessWidget {
  final Color color;

  const IntroSmallShape({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(
        painter: SmallShapePainter(color: color),
      ),
    );
  }
}

class SmallShapePainter extends CustomPainter {
  final Color color;

  SmallShapePainter({required this.color, Listenable? repaint})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    const width = 84;
    const height = 82;
    final dx = size.width / width;
    final dy = size.height / height;
    final path = Path()
      ..moveTo(39.02806574861487 * dx, 0.005227594824838817 * dy)
      ..cubicTo(
          50.912268222649345 * dx,
          -0.20865907153935892 * dy,
          61.48622034894039 * dx,
          6.1630425467726955 * dy,
          69.43208264942648 * dx,
          15.032648850068114 * dy)
      ..cubicTo(
          78.12864621527208 * dx,
          24.74022887863375 * dy,
          86.34327400255081 * dx,
          36.80801607877705 * dy,
          83.38505700790695 * dx,
          49.51892732732166 * dy)
      ..cubicTo(
          80.43757555078292 * dx,
          62.18370987965665 * dy,
          67.40673927429974 * dx,
          68.51400470437393 * dy,
          55.69060618109624 * dx,
          74.07723601532928 * dy)
      ..cubicTo(
          44.11471308932362 * dx,
          79.57387612365244 * dy,
          31.22638681175352 * dx,
          85.22911841305157 * dy,
          19.620473316282098 * dx,
          79.7965836251962 * dy)
      ..cubicTo(
          7.8987494995384075 * dx,
          74.3098401785588 * dy,
          2.3604467273251344 * dx,
          61.033924876144866 * dy,
          0.4147911467140139 * dx,
          48.20354826697086 * dy)
      ..cubicTo(
          -1.3464810713730464 * dx,
          36.58906421611837 * dy,
          2.626001370336076 * dx,
          25.25961059285482 * dy,
          9.961689888543248 * dx,
          16.102970661299217 * dy)
      ..cubicTo(
          17.256355208721722 * dx,
          6.997537486506742 * dy,
          27.38666921655575 * dx,
          0.21474435393602795 * dy,
          39.02806574861487 * dx,
          0.005227594824838817 * dy)
      ..close();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate != this) {
      return true;
    }
    return false;
  }
}

@WidgetbookUseCase(name: "Default", type: IntroSmallShape)
Widget getIntroSmallShape(BuildContext context) => Center(
    child: SizedBox(
        width: 80,
        child:
            IntroSmallShape(color: Theme.of(context).colorScheme.secondary)));

@WidgetbookUseCase(name: "Primary", type: IntroSmallShape)
Widget getIntroSmallShapePrimary(BuildContext context) => Center(
    child: SizedBox(
        height: 80,
        child: IntroSmallShape(color: Theme.of(context).colorScheme.primary)));
