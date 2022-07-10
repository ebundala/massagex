import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class UserLocationMarker extends StatelessWidget {
  const UserLocationMarker({Key? key, this.heading = 0})
      : assert(heading <= 360),
        super(key: key);
  final double heading;
  double angleToRadiansWithOffset() {
    return heading * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angleToRadiansWithOffset(),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: const Color(0xff8809AE).withOpacity(1.0))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomPaint(
            foregroundPainter: HeadingMarkerDrawer(),
          ),
        ),
      ),
    );
  }
}

class HeadingMarkerDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    Paint paint2Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.004779486;
    paint2Stroke.color = const Color(0xff8809AE).withOpacity(1.0);
    canvas.drawCircle(center, size.height / 2, paint2Stroke);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.5091792, size.height * 0.5635625);
    path_2.lineTo(size.width * 0.5097208, size.height * 0.5637028);
    path_2.lineTo(size.width * 0.6056875, size.height * 0.5885306);
    path_2.cubicTo(
        size.width * 0.6056889,
        size.height * 0.5885306,
        size.width * 0.6056903,
        size.height * 0.5885306,
        size.width * 0.6056903,
        size.height * 0.5885306);
    path_2.cubicTo(
        size.width * 0.6141833,
        size.height * 0.5907125,
        size.width * 0.6227917,
        size.height * 0.5884278,
        size.width * 0.6289222,
        size.height * 0.5825444);
    path_2.cubicTo(
        size.width * 0.6297222,
        size.height * 0.5817764,
        size.width * 0.6304681,
        size.height * 0.5809444,
        size.width * 0.6312167,
        size.height * 0.5800181);
    path_2.cubicTo(
        size.width * 0.6373792,
        size.height * 0.5722875,
        size.width * 0.6383736,
        size.height * 0.5620542,
        size.width * 0.6338042,
        size.height * 0.5532528);
    path_2.lineTo(size.width * 0.6338028, size.height * 0.5532500);
    path_2.lineTo(size.width * 0.5345458, size.height * 0.3614750);
    path_2.lineTo(size.width * 0.5345444, size.height * 0.3614736);
    path_2.cubicTo(
        size.width * 0.5303639,
        size.height * 0.3533806,
        size.width * 0.5221181,
        size.height * 0.3482417,
        size.width * 0.5130264,
        size.height * 0.3480306);
    path_2.cubicTo(
        size.width * 0.5039736,
        size.height * 0.3478667,
        size.width * 0.4955875,
        size.height * 0.3525819,
        size.width * 0.4910792,
        size.height * 0.3604306);
    path_2.cubicTo(
        size.width * 0.4910792,
        size.height * 0.3604319,
        size.width * 0.4910778,
        size.height * 0.3604319,
        size.width * 0.4910778,
        size.height * 0.3604319);
    path_2.lineTo(size.width * 0.3835778, size.height * 0.5476889);
    path_2.cubicTo(
        size.width * 0.3786667,
        size.height * 0.5562528,
        size.width * 0.3792083,
        size.height * 0.5665222,
        size.width * 0.3850514,
        size.height * 0.5745458);
    path_2.lineTo(size.width * 0.3850528, size.height * 0.5745472);
    path_2.cubicTo(
        size.width * 0.3908861,
        size.height * 0.5825792,
        size.width * 0.4005000,
        size.height * 0.5862778,
        size.width * 0.4101931,
        size.height * 0.5842569);
    path_2.lineTo(size.width * 0.5091792, size.height * 0.5635625);
    path_2.close();
    path_2.moveTo(size.width * 0.5091792, size.height * 0.5635625);
    path_2.lineTo(size.width * 0.5086319, size.height * 0.5636778);
    path_2.lineTo(size.width * 0.4101944, size.height * 0.5842569);
    path_2.lineTo(size.width * 0.5091792, size.height * 0.5635625);
    path_2.close();
    path_2.moveTo(size.width * 0.5172306, size.height * 0.5479333);
    path_2.lineTo(size.width * 0.5172014, size.height * 0.5498111);
    path_2.lineTo(size.width * 0.5190208, size.height * 0.5502819);
    path_2.lineTo(size.width * 0.6095361, size.height * 0.5736903);
    path_2.cubicTo(
        size.width * 0.6148625,
        size.height * 0.5750722,
        size.width * 0.6181319,
        size.height * 0.5718361,
        size.width * 0.6192153,
        size.height * 0.5704625);
    path_2.cubicTo(
        size.width * 0.6202833,
        size.height * 0.5691111,
        size.width * 0.6227306,
        size.height * 0.5652097,
        size.width * 0.6201972,
        size.height * 0.5602931);
    path_2.lineTo(size.width * 0.6201958, size.height * 0.5602875);
    path_2.lineTo(size.width * 0.5209292, size.height * 0.3685042);
    path_2.lineTo(size.width * 0.5209264, size.height * 0.3684972);
    path_2.cubicTo(
        size.width * 0.5185764,
        size.height * 0.3639903,
        size.width * 0.5143333,
        size.height * 0.3634083,
        size.width * 0.5127056,
        size.height * 0.3633722);
    path_2.cubicTo(
        size.width * 0.5110333,
        size.height * 0.3633167,
        size.width * 0.5068875,
        size.height * 0.3637792,
        size.width * 0.5043958,
        size.height * 0.3680292);
    path_2.lineTo(size.width * 0.5043861, size.height * 0.3680486);
    path_2.lineTo(size.width * 0.3968847, size.height * 0.5553069);
    path_2.lineTo(size.width * 0.3968847, size.height * 0.5553083);
    path_2.cubicTo(
        size.width * 0.3941431,
        size.height * 0.5600889,
        size.width * 0.3964514,
        size.height * 0.5641431,
        size.width * 0.3974569,
        size.height * 0.5655292);
    path_2.lineTo(size.width * 0.3974611, size.height * 0.5655333);
    path_2.cubicTo(
        size.width * 0.3984875,
        size.height * 0.5669403,
        size.width * 0.4016458,
        size.height * 0.5703792,
        size.width * 0.4070486,
        size.height * 0.5692653);
    path_2.lineTo(size.width * 0.4070556, size.height * 0.5692639);
    path_2.lineTo(size.width * 0.4999958, size.height * 0.5498333);
    path_2.lineTo(size.width * 0.5018681, size.height * 0.5494431);
    path_2.lineTo(size.width * 0.5018958, size.height * 0.5475319);
    path_2.lineTo(size.width * 0.5034125, size.height * 0.4465028);
    path_2.cubicTo(
        size.width * 0.5034125,
        size.height * 0.4465028,
        size.width * 0.5034125,
        size.height * 0.4465028,
        size.width * 0.5034125,
        size.height * 0.4465028);
    path_2.cubicTo(
        size.width * 0.5034778,
        size.height * 0.4422764,
        size.width * 0.5069611,
        size.height * 0.4388903,
        size.width * 0.5112014,
        size.height * 0.4389472);
    path_2.cubicTo(
        size.width * 0.5154347,
        size.height * 0.4390042,
        size.width * 0.5188236,
        size.height * 0.4424972,
        size.width * 0.5187597,
        size.height * 0.4467250);
    path_2.lineTo(size.width * 0.5210458, size.height * 0.4467583);
    path_2.lineTo(size.width * 0.5187597, size.height * 0.4467250);
    path_2.lineTo(size.width * 0.5172306, size.height * 0.5479333);
    path_2.close();

    // Paint paint2Stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = size.width * 0.004779486;
    // paint2Stroke.color = const Color(0xff8809AE).withOpacity(1.0);
    // canvas.drawPath(path_2, paint2Stroke);
    // final scale = Float64List.fromList([
    //   2, //size.width / 2,
    //   0,
    //   0,
    //   0,
    //   0,
    //   6, //size.height / 2,
    //   0,
    //   0,
    //   0,
    //   0,
    //   6,
    //   0,
    //   0,
    //   0,
    //   0,
    //   2
    // ]);
    //final path = path_2.transform(scale);
    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xff8809AE).withOpacity(1.0);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant HeadingMarkerDrawer oldDelegate) {
    return oldDelegate != this;
  }
}

class DestinationMarker extends StatelessWidget {
  const DestinationMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DestinationMarkerPainter(),
    );
  }
}

class DestinationMarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff8809AE).withOpacity(0.08);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01838656, size.height * 0.01659754,
                size.width * 0.9602951, size.height * 0.9602951),
            bottomRight: Radius.circular(size.width * 0.4801475),
            bottomLeft: Radius.circular(size.width * 0.4801475),
            topLeft: Radius.circular(size.width * 0.4801475),
            topRight: Radius.circular(size.width * 0.4801475)),
        paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff8809AE).withOpacity(0.31);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.2233049, size.height * 0.2215164,
                size.width * 0.5504590, size.height * 0.5504590),
            bottomRight: Radius.circular(size.width * 0.2752295),
            bottomLeft: Radius.circular(size.width * 0.2752295),
            topLeft: Radius.circular(size.width * 0.2752295),
            topRight: Radius.circular(size.width * 0.2752295)),
        paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.3609197, size.height * 0.3591311,
                size.width * 0.2752295, size.height * 0.2752295),
            bottomRight: Radius.circular(size.width * 0.1376146),
            bottomLeft: Radius.circular(size.width * 0.1376146),
            topLeft: Radius.circular(size.width * 0.1376146),
            topRight: Radius.circular(size.width * 0.1376146)),
        paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xff8809AE).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.4985344, size.height * 0.4967459),
        size.width * 0.06880738, paint3Fill);

    Paint paint4Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint4Stroke.color = const Color(0xff8809AE).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.01838656, size.height * 0.01659754,
                size.width * 0.9602951, size.height * 0.9602951),
            bottomRight: Radius.circular(size.width * 0.4801475),
            bottomLeft: Radius.circular(size.width * 0.4801475),
            topLeft: Radius.circular(size.width * 0.4801475),
            topRight: Radius.circular(size.width * 0.4801475)),
        paint4Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

@WidgetbookUseCase(name: "primary", type: UserLocationMarker)
Widget getUserLocationMarker(BuildContext context) {
  double height = context.knobs
      .slider(label: "heigth", initialValue: 100, max: 1000, min: 0)
      .toDouble();
  double width =
      context.knobs.slider(label: "width", initialValue: 100).toDouble();
  double angle = context.knobs
      .slider(label: "heading", initialValue: 0, max: 360, min: 0)
      .toDouble();

  return Center(
    child: SizedBox(
      height: height,
      width: width,
      child: UserLocationMarker(heading: angle),
    ),
  );
}

@WidgetbookUseCase(name: "primary", type: DestinationMarker)
Widget getDestinationMarker(BuildContext context) {
  double height = context.knobs
      .slider(label: "heigth", initialValue: 100, max: 1000, min: 0)
      .toDouble();
  double width =
      context.knobs.slider(label: "width", initialValue: 100).toDouble();

  return Center(
    child: SizedBox(
      height: height,
      width: width,
      child: const DestinationMarker(),
    ),
  );
}
