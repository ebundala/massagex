import 'dart:ui';

import 'package:flutter/material.dart' hide Gradient;
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

import 'dart:math' as math;

class PrimarySpinar extends StatefulWidget {
  final double radius;
  final double width;
  final double? angle;
  final Widget? child;
  final bool success;
  final bool error;
  const PrimarySpinar(
      {Key? key,
      this.radius = 70,
      this.width = 14,
      this.angle,
      this.child,
      this.success = false,
      this.error = false})
      : super(key: key);

  @override
  State<PrimarySpinar> createState() => _PrimarySpinarState();
}

class _PrimarySpinarState extends State<PrimarySpinar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _ctr;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: 2 * math.pi,
      duration: const Duration(milliseconds: 750),
    );
    _ctr = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    if (widget.angle == null) {
      _controller.repeat();
    } else {
      _controller.value = widget.angle!;
    }
  }

  Color getColor() {
    if (widget.error) {
      return Theme.of(context).colorScheme.error;
    } else if (widget.success) {
      return const Color.fromRGBO(76, 210, 44, 1);
    }
    return const Color.fromRGBO(255, 155, 37, 0.25);
  }

  Widget? getWidget() {
    if (widget.error) {
      return Center(
        child: Container(
          height: widget.radius * 1.25,
          width: widget.radius * 1.25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.error.withOpacity(0.08),
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.radius / 6),
            child: Icon(IconlyLight.shield_fail,
                size: widget.radius,
                color: Theme.of(context).colorScheme.error),
          ),
        ),
      );
    } else if (widget.success) {
      return Center(
        child: Container(
          height: widget.radius * 1.25,
          width: widget.radius * 1.25,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(76, 210, 44, 0.08),
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.radius / 6),
            child: Icon(
              IconlyLight.shield_done,
              size: widget.radius,
              color: const Color.fromRGBO(76, 210, 44, 1),
            ),
          ),
        ),
      );
    }
    return widget.child;
  }

  @override
  void dispose() {
    _controller.dispose();
    _ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            foregroundPainter: ArchPainter(
                angle: _controller.value,
                radius: widget.radius,
                strokeWidth: widget.width,
                success: widget.success,
                error: widget.error),
            child: child,
          );
        },
        child: Container(
          height: widget.radius * 2 + widget.width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: widget.width,
              color: getColor(),
            ),
          ),
          child: getWidget(),
        ),
      ),
    );
  }
}

class ArchPainter extends CustomPainter {
  final double angle;
  final double radius;
  final double strokeWidth;
  final bool error;
  final bool success;

  ArchPainter({
    Listenable? repaint,
    required this.angle,
    required this.radius,
    required this.strokeWidth,
    required this.error,
    required this.success,
  }) : super(repaint: repaint);
  @override
  void paint(Canvas canvas, Size size) {
    if (success || error) {
      return;
    }
    final center = size.center(Offset.zero);
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..shader = Gradient.sweep(
        center,
        const [
          Color.fromRGBO(255, 155, 37, 0.0),
          Color.fromRGBO(255, 155, 37, 0.75),
          Color.fromRGBO(255, 155, 37, 1)
        ],
        [0, 0.75, 1],
        TileMode.clamp,
        angle,
        angle + math.pi / 4,
      );

    canvas.drawArc(rect, angle, math.pi / 4, false, paint);
    final capPaint = Paint()
      ..color = const Color.fromRGBO(255, 155, 37, 1)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, angle + math.pi / 4, math.pi / 180, false, capPaint);
  }

  @override
  bool shouldRepaint(covariant ArchPainter oldDelegate) {
    if (oldDelegate.angle != angle) {
      return true;
    }
    return false;
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
Widget getSpinar(BuildContext context) {
  final success = context.knobs.boolean(label: 'success');
  final error = context.knobs.boolean(label: 'failed');
  final angle = context.knobs
      .nullableNumber(label: 'angle', initialValue: null)
      ?.toDouble();
  final radius =
      context.knobs.number(label: 'radius', initialValue: 70.0).toDouble();
  final width = context.knobs
      .number(label: 'stroke width', initialValue: 14.0)
      .toDouble();
  return Container(
    color: Theme.of(context).colorScheme.background,
    height: 500,
    width: 500,
    child: Center(
      child: PrimarySpinar(
        radius: radius,
        width: width,
        angle: angle,
        success: success,
        error: error,
        child: const Center(
          child: AppName(),
        ),
      ),
    ),
  );
}

@WidgetbookUseCase(name: "completed", type: CompletedSpinar)
Widget getSpinar1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: CompletedSpinar(),
      ),
    );
