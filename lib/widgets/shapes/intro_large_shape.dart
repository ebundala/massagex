import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class IntroLargeShape extends StatelessWidget {
  final double angle;
  final String assetName;
  final Color? color;
  const IntroLargeShape(
      {Key? key, required this.assetName, this.color, this.angle = 75})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: angle * (math.pi / 180),
        child: ClipPath(
          clipper: ShapeClipper(),
          child: Transform.rotate(
              angle: -(angle * (math.pi / 180)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: color,
                      image: DecorationImage(
                          image: AssetImage(assetName), fit: BoxFit.cover)),

                  // child: Image.asset(assetName)
                ),
              )),
        ),
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const width = 408;
    const height = 408;

    final dx = size.width / width;
    final dy = size.height / height;

    final path = Path()
      ..moveTo(189.21838261816302 * dx, 0.02352630123151312 * dy)
      ..cubicTo(
          246.83613865372524 * dx,
          -0.9390506219797099 * dy,
          298.1014545447565 * dx,
          27.736196150679447 * dy,
          336.6250960362125 * dx,
          67.65302916626983 * dy)
      ..cubicTo(
          378.7883357638629 * dx,
          111.34108450213793 * dy,
          418.615023402726 * dx,
          165.6510313096783 * dy,
          404.2728051958209 * dx,
          222.8552977037383 * dy)
      ..cubicTo(
          389.9826357135214 * dx,
          279.85196621793045 * dy,
          326.80569580878785 * dx,
          308.3408655914926 * dy,
          270.00278457269155 * dx,
          333.37766741481613 * dy)
      ..cubicTo(
          213.87979394603673 * dx,
          358.11478176330905 * dy,
          151.39378019877495 * dx,
          383.5656703833348 * dy,
          95.12524271694106 * dx,
          359.1170560296583 * dy)
      ..cubicTo(
          38.295226174813074 * dx,
          334.4244806808023 * dy,
          11.444069887492423 * dx,
          274.677466423959 * dy,
          2.0110171590644197 * dx,
          216.93555735576828 * dy)
      ..cubicTo(
          -6.528096272878228 * dx,
          164.66565894462173 * dy,
          12.731549015229042 * dx,
          113.67851329536526 * dy,
          48.296906666986416 * dx,
          72.46991230075378 * dy)
      ..cubicTo(
          83.66337300727545 * dx,
          31.491762522249168 * dy,
          132.77781399246584 * dx,
          0.966436865852823 * dy,
          189.21838261816302 * dx,
          0.02352630123151312 * dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    if (oldClipper != this) {
      return true;
    }
    return false;
  }
}

@WidgetbookUseCase(name: "Default", type: IntroLargeShape)
Widget getIntroLargeShape(BuildContext context) => Center(
        child: Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 240,
            width: 240,
            child: IntroLargeShape(
              angle: 75,
              assetName: "assets/images/intro_picture_1.png",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: 240,
            width: 240,
            child: IntroLargeShape(
              angle: 56,
              assetName: "assets/images/intro_picture_2.png",
            ),
          ),
        ),
      ],
    ));
