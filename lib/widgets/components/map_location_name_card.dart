import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/components/avators.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/stars_rating.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class MapNavigationDestinationInfo extends StatelessWidget {
  const MapNavigationDestinationInfo(
      {Key? key,
      required this.startingPoint,
      required this.destination,
      required this.destinationSubTitle,
      required this.startingPointSubtitle})
      : super(key: key);
  final String startingPoint;
  final String startingPointSubtitle;
  final String destination;
  final String destinationSubTitle;
  Widget buildDot(Color color, double radius) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Center(
                      child:
                          buildDot(Theme.of(context).colorScheme.primary, 6))),
              Expanded(
                flex: 1,
                child: SizedBox(
                    width: 3,
                    child: CustomPaint(painter: _VerticalDividerPainter())),
              ),
              Flexible(
                  child: Center(
                      child:
                          buildDot(Theme.of(context).colorScheme.secondary, 6)))
            ],
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Nunito(
                text: startingPointSubtitle,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: const Color.fromRGBO(128, 128, 128, 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Flexible(
              child: Gilroy(
                text: startingPoint,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(48, 48, 48, 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const Expanded(
              child: Divider(
                thickness: 1,
                color: Color.fromRGBO(227, 225, 225, 1),
              ),
            ),
            Flexible(
              child: Nunito(
                text: destinationSubTitle,
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: const Color.fromRGBO(128, 128, 128, 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Flexible(
              child: Gilroy(
                text: destination,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color.fromRGBO(48, 48, 48, 1),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ))
      ],
    );
  }
}

class _VerticalDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    // paint0Fill.color = Colors.white.withOpacity(1.0);
    // canvas.drawRect(
    //     Rect.fromLTWH(
    //         0, size.height * 0.002929683, size.width, size.height * 0.9756098),
    //     paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xffE3E1E1).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, size.height * 0.002929683, size.width * 0.7500000,
                size.height * 0.07317073),
            bottomRight: Radius.circular(size.width * 0.3750000),
            bottomLeft: Radius.circular(size.width * 0.3750000),
            topLeft: Radius.circular(size.width * 0.3750000),
            topRight: Radius.circular(size.width * 0.3750000)),
        paint1Fill);

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = const Color(0xffE3E1E1).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, size.height * 0.2224420, size.width * 0.7500000,
                size.height * 0.07317073),
            bottomRight: Radius.circular(size.width * 0.3750000),
            bottomLeft: Radius.circular(size.width * 0.3750000),
            topLeft: Radius.circular(size.width * 0.3750000),
            topRight: Radius.circular(size.width * 0.3750000)),
        paint2Fill);

    Paint paint3Fill = Paint()..style = PaintingStyle.fill;
    paint3Fill.color = const Color(0xffE3E1E1).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, size.height * 0.4419537, size.width * 0.7500000,
                size.height * 0.07317073),
            bottomRight: Radius.circular(size.width * 0.3750000),
            bottomLeft: Radius.circular(size.width * 0.3750000),
            topLeft: Radius.circular(size.width * 0.3750000),
            topRight: Radius.circular(size.width * 0.3750000)),
        paint3Fill);

    Paint paint4Fill = Paint()..style = PaintingStyle.fill;
    paint4Fill.color = const Color(0xffE3E1E1).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, size.height * 0.6614659, size.width * 0.7500000,
                size.height * 0.07317073),
            bottomRight: Radius.circular(size.width * 0.3750000),
            bottomLeft: Radius.circular(size.width * 0.3750000),
            topLeft: Radius.circular(size.width * 0.3750000),
            topRight: Radius.circular(size.width * 0.3750000)),
        paint4Fill);

    Paint paint5Fill = Paint()..style = PaintingStyle.fill;
    paint5Fill.color = const Color(0xffE3E1E1).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(0, size.height * 0.8809780, size.width * 0.7500000,
                size.height * 0.07317073),
            bottomRight: Radius.circular(size.width * 0.3750000),
            bottomLeft: Radius.circular(size.width * 0.3750000),
            topLeft: Radius.circular(size.width * 0.3750000),
            topRight: Radius.circular(size.width * 0.3750000)),
        paint5Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

@WidgetbookUseCase(name: "primary", type: MapNavigationDestinationInfo)
Widget getMapNavigationDestinationInfo(BuildContext context) {
  double height = context.knobs
      .slider(label: "height", min: 50, max: 500, initialValue: 88)
      .toDouble();
  double width = context.knobs
      .slider(label: "width", min: 50, max: 500, initialValue: 100)
      .toDouble();
  String startingPoint =
      context.knobs.text(label: "Starting ", initialValue: "123 kimara mwisho");
  String startingPointSubtitle = context.knobs
      .text(label: "Starting subtitle", initialValue: "123 kimara mwisho");
  String destination = context.knobs
      .text(label: "Destination", initialValue: "123 kimara mwisho");
  String destinationSubTitle = context.knobs
      .text(label: "Destination subtitle", initialValue: "123 kimara mwisho");
  return Center(
    child: SizedBox(
        height: height,
        //width: width,
        child: MapNavigationDestinationInfo(
            startingPoint: startingPoint,
            startingPointSubtitle: startingPointSubtitle,
            destination: destination,
            destinationSubTitle: destinationSubTitle)),
  );
}
