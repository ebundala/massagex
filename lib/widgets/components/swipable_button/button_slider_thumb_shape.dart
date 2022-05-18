import 'package:flutter/material.dart';

class ButtonSliderThumbShape extends SliderComponentShape {
  final double height;

  const ButtonSliderThumbShape({
    this.height = 50.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(height, height);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final d = (height - 8);
    final rect = Rect.fromCircle(
        center: Offset(
            center.dx < d
                ? (center.dx + (d - center.dx)) + 8
                : center.dx - ((d / 2) + 4),
            center.dy),
        radius: (height - 8) / 2);

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(
        Offset(rect.left - 1, rect.top),
        Offset(rect.right + 1, rect.bottom),
      ),
      const Radius.circular(8),
    );

    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;

    //labelPainter.paint(canvas, parentBox);

    canvas.drawRRect(rrect, fillPaint);

    const width = 14.68610954284668;
    const height1 = 13.67510986328125;
    final dx = (rrect.width - 20) / width;
    final dy = (rrect.height - 20) / height1;
    final arrow = Path()
      ..moveTo(1.1402259141945836 * dx, 5.697328969667368 * dy)
      ..lineTo(10.794138509388167 * dx, 5.697328969667368 * dy)
      ..lineTo(7.023791457453967 * dx, 1.957387937634231 * dy)
      ..cubicTo(
          6.582904116651777 * dx,
          1.5012975347215247 * dy,
          6.582904116651777 * dx,
          0.7867559336972909 * dy,
          7.023791457453967 * dx,
          0.33066553078458477 * dy)
      ..cubicTo(
          7.464678798256157 * dx,
          -0.11022182849202528 * dy,
          8.194423321721121 * dx,
          -0.11022182849202528 * dy,
          8.635310662523311 * dx,
          0.33066553078458477 * dy)
      ..lineTo(14.366846228877307 * dx, 6.031795295342358 * dy)
      ..cubicTo(
          14.792530571988959 * dx,
          6.457479656291381 * dy,
          14.792530571988959 * dx,
          7.217630569457939 * dy,
          14.366846228877307 * dx,
          7.643314930406962 * dy)
      ..lineTo(8.635310662523311 * dx, 13.344444740273245 * dy)
      ..cubicTo(
          8.194423321721121 * dx,
          13.785332099549855 * dy,
          7.464678798256157 * dx,
          13.785332099549855 * dy,
          7.023791457453967 * dx,
          13.344444740273245 * dy)
      ..cubicTo(
          6.8109492858981415 * dx,
          13.116399538816891 * dy,
          6.689325508262113 * dx,
          12.826022402154653 * dy,
          6.689325508262113 * dx,
          12.53868546644305 * dy)
      ..cubicTo(
          6.689325508262113 * dx,
          12.249828226367839 * dy,
          6.8109492858981415 * dx,
          11.945767648151225 * dy,
          7.023791457453967 * dx,
          11.732925467676713 * dy)
      ..lineTo(10.794138509388167 * dx, 7.977780893613881 * dy)
      ..lineTo(1.1402259141945836 * dx, 7.977780893613881 * dy)
      ..cubicTo(0.50169942218136 * dx, 7.977780893613881 * dy, 0.0 * dx,
          7.476081450409904 * dy, 0 * dx, 6.837554931640624 * dy)
      ..cubicTo(
          0.0 * dx,
          6.214231411198932 * dy,
          0.50169942218136 * dx,
          5.697328969667368 * dy,
          1.1402259141945836 * dx,
          5.697328969667368 * dy)
      ..close();
    final arrowPaint = Paint()
      ..color = const Color.fromRGBO(135, 8, 174, 1)
      //..strokeWidth = 2.8
      ..style = PaintingStyle.fill;
    var t = arrow.transform(
        Matrix4.translationValues(rrect.center.dx - 11, rrect.center.dy - 11, 0)
            .storage);

    canvas.drawPath(t, arrowPaint);
  }

  // @override
  // void paint(
  //   PaintingContext context,
  //   Offset center, {
  //   Animation<double> activationAnimation,
  //   Animation<double> enableAnimation,
  //   bool isDiscrete,
  //   TextPainter labelPainter,
  //   RenderBox parentBox,
  //   SliderThemeData sliderTheme,
  //   TextDirection textDirection,
  //   double value,
  // }) {
  //   final Canvas canvas = context.canvas;

  //   final rect = Rect.fromCircle(center: center, radius: thumbRadius);

  //   final rrect = RRect.fromRectAndRadius(
  //     Rect.fromPoints(
  //       Offset(rect.left - 1, rect.top),
  //       Offset(rect.right + 1, rect.bottom),
  //     ),
  //     Radius.circular(thumbRadius - 2),
  //   );

  //   final fillPaint = Paint()
  //     ..color = sliderTheme.activeTrackColor
  //     ..style = PaintingStyle.fill;

  //   final borderPaint = Paint()
  //     ..color = Colors.black
  //     ..strokeWidth = 2.8
  //     ..style = PaintingStyle.stroke;

  //   canvas.drawRRect(rrect, fillPaint);
  //   canvas.drawRRect(rrect, borderPaint);
  // }
}
