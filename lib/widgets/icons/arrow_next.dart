import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'dart:math' as math;

class ArrowNext extends StatelessWidget {
  final Color color;

  final double angle;

  final Size size;

  const ArrowNext(
      {Key? key,
      this.color = Colors.black,
      this.angle = 270,
      this.size = const Size(15, 18)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * (math.pi / 180),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: AspectRatio(
          aspectRatio: 1,
          child: CustomPaint(
            size: size,
            painter: ArrowNextPainter(color: color),
          ),
        ),
      ),
    );
  }
}

class ArrowNextPainter extends CustomPainter {
  final Color color;

  ArrowNextPainter({this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    const width = 15;
    const height = 18;
    final dx = size.width / width;
    final dy = size.height / height;
    final path = Path()
      ..moveTo(7.339150190355743 * dx, 0 * dy)
      ..cubicTo(
          7.750487286816052 * dx,
          0 * dy,
          8.090431772923681 * dx,
          0.30566666523615516 * dy,
          8.144232727641006 * dx,
          0.7022485385338465 * dy)
      ..lineTo(8.151650207952509 * dx, 0.8125 * dy)
      ..lineTo(8.150999841791064 * dx, 15.09516668319702 * dy)
      ..lineTo(13.28982389940248 * dx, 9.935263951619465 * dy)
      ..cubicTo(
          13.606440962987042 * dx,
          9.617280428608257 * dy,
          14.120885956140777 * dx,
          9.61617257197698 * dy,
          14.43886955061043 * dx,
          9.93278956413269 * dy)
      ..cubicTo(
          14.727945460465602 * dx,
          10.220623172819614 * dy,
          14.75514118788635 * dx,
          10.671951482693354 * dy,
          14.51981766675871 * dx,
          10.990538040796915 * dy)
      ..lineTo(14.441343938150796 * dx, 11.081836223602295 * dy)
      ..lineTo(7.915343614979664 * dx, 17.63600206375122 * dy)
      ..cubicTo(
          7.873608556356732 * dx,
          17.677917203865945 * dy,
          7.828440228521307 * dx,
          17.714323526558776 * dy,
          7.780741581946206 * dx,
          17.74522225062052 * dy)
      ..cubicTo(
          7.766383298692294 * dx,
          17.753949475862704 * dy,
          7.751694664603804 * dx,
          17.762833226433333 * dy,
          7.736711947788489 * dx,
          17.771255493164062 * dy)
      ..cubicTo(
          7.723867883004547 * dx,
          17.77900219312869 * dy,
          7.710530470254674 * dx,
          17.786002404405732 * dy,
          7.697047877117959 * dx,
          17.792606512705483 * dy)
      ..cubicTo(
          7.677428179764235 * dx,
          17.801778879094247 * dy,
          7.657160315722595 * dx,
          17.810740895608127 * dy,
          7.636478072886142 * dx,
          17.818877379099526 * dy)
      ..cubicTo(
          7.620532120853619 * dx,
          17.82548874566176 * dy,
          7.605023022603208 * dx,
          17.83100892770259 * dy,
          7.589391356168116 * dx,
          17.836044152577717 * dy)
      ..cubicTo(
          7.57000592897738 * dx,
          17.84203032737908 * dy,
          7.549348764174876 * dx,
          17.84784649145634 * dy,
          7.528376265493753 * dx,
          17.85284932454427 * dy)
      ..cubicTo(
          7.5137336932238155 * dx,
          17.856568624614738 * dy,
          7.499640927790981 * dx,
          17.859514252321482 * dy,
          7.485492908152752 * dx,
          17.86208359400431 * dy)
      ..cubicTo(
          7.464442354393636 * dx,
          17.865696727356404 * dy,
          7.442659047037595 * dx,
          17.868772193362624 * dy,
          7.4206164298240616 * dx,
          17.870966593424477 * dy)
      ..cubicTo(
          7.403805273513048 * dx,
          17.872861343474746 * dy,
          7.387148628199512 * dx,
          17.874001807930956 * dy,
          7.370476246560922 * dx,
          17.874632199605305 * dy)
      ..cubicTo(
          7.3603659185232155 * dx,
          17.87479513293389 * dy,
          7.349781893503938 * dx,
          17.875 * dy,
          7.339150190355743 * dx,
          17.875 * dy)
      ..lineTo(7.307675877527581 * dx, 17.87459294001261 * dy)
      ..cubicTo(
          7.291729145589995 * dx,
          17.87397013166628 * dy,
          7.275796871659593 * dx,
          17.872881029014632 * dy,
          7.259902117922565 * dx,
          17.871324062347412 * dy)
      ..lineTo(7.339150190355743 * dx, 17.875 * dy)
      ..cubicTo(
          7.287877613191367 * dx,
          17.875 * dy,
          7.237713925829461 * dx,
          17.870250783860683 * dy,
          7.189075744877815 * dx,
          17.86116822560628 * dy)
      ..cubicTo(
          7.177459128582035 * dx,
          17.859061900584493 * dy,
          7.1655337314262395 * dx,
          17.856552033219486 * dy,
          7.153658425766646 * dx,
          17.85377295811971 * dy)
      ..cubicTo(
          7.129198978611751 * dx,
          17.848001282933787 * dy,
          7.105646275517043 * dx,
          17.841331350345474 * dy,
          7.082554136125505 * dx,
          17.833651383717854 * dy)
      ..cubicTo(
          7.0710825892339555 * dx,
          17.829881817102432 * dy,
          7.0588250756111615 * dx,
          17.825490508267347 * dy,
          7.0466579532878395 * dx,
          17.820796966552734 * dy)
      ..cubicTo(
          7.022210250110865 * dx,
          17.811302199726924 * dy,
          6.99890385778331 * dx,
          17.80098220760313 * dy,
          6.976202996660944 * dx,
          17.789628982543945 * dy)
      ..cubicTo(
          6.965528664083617 * dx,
          17.78435466582111 * dy,
          6.9543527708272785 * dx,
          17.778447395112984 * dy,
          6.943291059506095 * dx,
          17.772261778513588 * dy)
      ..cubicTo(
          6.925245077390206 * dx,
          17.762108237094555 * dy,
          6.908095963900149 * dx,
          17.751648385698594 * dy,
          6.891379545371157 * dx,
          17.740587552388508 * dy)
      ..cubicTo(
          6.879549014131851 * dx,
          17.732783868908882 * dy,
          6.867234396929819 * dx,
          17.724142249595996 * dy,
          6.855114528983633 * dx,
          17.715118408203125 * dy)
      ..lineTo(6.84575059935019 * dx, 17.70808680852254 * dy)
      ..cubicTo(
          6.8171519427842595 * dx,
          17.686196758567043 * dy,
          6.790050381080631 * dx,
          17.662449412668746 * dy,
          6.7646258150309695 * dx,
          17.637024879455566 * dy)
      ..lineTo(6.763871101002478 * dx, 17.63604958852132 * dy)
      ..lineTo(0.23678749070788835 * dx, 11.081883748372395 * dy)
      ..cubicTo(
          -0.07985588584438469 * dx,
          10.76392647375663 * dy,
          -0.07879077565444939 * dx,
          10.249480458597342 * dy,
          0.23916647356164342 * dx,
          9.93283708890279 * dy)
      ..cubicTo(
          0.5282185241737005 * dx,
          9.644979459544022 * dy,
          0.9796575842874469 * dx,
          9.619691325972477 * dy,
          1.2972473882452296 * dx,
          9.856358369191486 * dy)
      ..lineTo(1.3882126413431934 * dx, 9.935216426849365 * dy)
      ..lineTo(6.525999806597532 * dx, 15.093000173568724 * dy)
      ..lineTo(6.526650172758977 * dx, 0.8125 * dy)
      ..cubicTo(6.526650172758977 * dx, 0.36376863469680154 * dy,
          6.890418815334119 * dx, 0 * dy, 7.339150190355743 * dx, 0 * dy)
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

@WidgetbookUseCase(name: "default", type: ArrowNext)
Widget getArrowNext(BuildContext context) => Center(
      child: Container(
        height: 300,
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: ArrowNext(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
@WidgetbookUseCase(name: "primary", type: ArrowNext)
Widget getArrowNext1(BuildContext context) => Center(
      child: Container(
        height: 300,
        width: double.infinity,
        color: Theme.of(context).colorScheme.primary,
        child: ArrowNext(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
@WidgetbookUseCase(name: "secondary", type: ArrowNext)
Widget getArrowNext2(BuildContext context) => Center(
      child: Container(
        height: 300,
        width: double.infinity,
        color: Theme.of(context).colorScheme.secondary,
        child: ArrowNext(color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
