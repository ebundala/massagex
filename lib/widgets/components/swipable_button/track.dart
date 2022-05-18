import 'dart:math';

import 'package:flutter/material.dart';

class ButtonSliderTrackShape extends SliderTrackShape {
  final String label;

  final TextStyle labelStyle;

  ButtonSliderTrackShape(
      {required this.label,
      this.labelStyle = const TextStyle(
        color: Colors.white,
        fontFamily: 'Gordita',
        fontSize: 14,
        fontWeight: FontWeight.w600,
      )});

  @override
  Rect getPreferredRect(
      {required RenderBox parentBox,
      Offset offset = Offset.zero,
      required SliderThemeData sliderTheme,
      bool isEnabled = true,
      bool isDiscrete = false}) {
    final double thumbWidth =
        sliderTheme.thumbShape?.getPreferredSize(true, isDiscrete).width ?? 0;
    final double trackHeight = sliderTheme.trackHeight ?? 0;
    assert(thumbWidth >= 0);
    assert(trackHeight >= 0);
    assert(parentBox.size.width >= thumbWidth);
    assert(parentBox.size.height >= trackHeight);

    final double trackLeft = offset.dx + thumbWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - thumbWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      bool isEnabled = true,
      bool isDiscrete = false,
      required TextDirection textDirection}) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final rrect = RRect.fromRectAndRadius(trackRect, const Radius.circular(8));
    final Paint fillPaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.yellow
      ..style = PaintingStyle.fill;

    // final Paint borderPaint = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 1.0
    //   ..style = PaintingStyle.stroke;

    final pathSegment = Path()..addRRect(rrect);
    //   ..moveTo(trackRect.left, trackRect.top + 8)
    //   ..arcToPoint(Offset(trackRect.left + 8, trackRect.top),
    //       radius: const Radius.circular(8))
    //   ..lineTo(trackRect.right - 8, trackRect.top)
    //   ..arcToPoint(Offset(trackRect.right, trackRect.top + 8),
    //       radius: const Radius.circular(8))
    //   ..lineTo(trackRect.right, trackRect.bottom - 8)
    //   ..arcToPoint(Offset(trackRect.right - 8, trackRect.bottom),
    //       radius: const Radius.circular(8))
    //   ..lineTo(trackRect.left + 8, trackRect.bottom)
    //   ..arcToPoint(Offset(trackRect.left, trackRect.bottom - 8),
    //       radius: const Radius.circular(8))
    //   ..close();
    // ..arcTo(
    //     Rect.fromPoints(
    //       Offset(trackRect.right + 7, trackRect.top),
    //       Offset(trackRect.right - 7, trackRect.bottom),
    //     ),
    //     -pi / 2,
    //     pi,
    //     false)
    //  ..lineTo(trackRect.left, trackRect.bottom);
    // ..arcTo(
    //     Rect.fromPoints(
    //       Offset(trackRect.left + 7, trackRect.top),
    //       Offset(trackRect.left - 7, trackRect.bottom),
    //     ),
    //     -pi * 3 / 2,
    //     pi,
    //     false);
    final textPainter = TextPainter(
      textDirection: textDirection,
      textAlign: TextAlign.center,
      text: TextSpan(
        text: label,
        style: labelStyle,
      ),
    );

    //textPainter.layout();

    context.canvas.drawPath(pathSegment, fillPaint);
    textPainter.layout();
    final width = textPainter.width / 2;
    final height = textPainter.height / 2;
    textPainter.paint(context.canvas, rrect.center.translate(-width, -height));
    //context.canvas.drawPath(pathSegment, borderPaint);
  }
}
