import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/components/avators.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/stars_rating.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class TravelerMapInfoCard extends StatelessWidget {
  const TravelerMapInfoCard(
      {Key? key,
      required this.avator,
      required this.displayName,
      required this.rating,
      required this.count,
      required this.onCall,
      required this.onCancel,
      required this.eta,
      required this.discription,
      required this.title,
      required this.userSubTitle,
      required this.price,
      this.isProvider = false,
      this.isArrived = false,
      required this.onArrival,
      required this.onPayment})
      : super(key: key);
  final String avator;
  final String displayName;
  final double rating;
  final int count;
  final void Function() onCall;
  final void Function() onCancel;
  final void Function() onArrival;
  final void Function(bool provider) onPayment;
  final String eta;
  final String discription;
  final String title;
  final String userSubTitle;
  final String price;
  final bool isProvider;
  final bool isArrived;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTile(
          avator: avator,
          displayName: displayName,
          userSubTitle: userSubTitle,
          rating: rating,
          count: count,
          action: SizedBox(
            width: 60,
            child: Row(
              children: [
                const Icon(IconlyLight.time_circle),
                Nunito(
                  text: eta,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Nunito(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Nunito(
                    text: discription,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Gordita(
              text: price,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        const Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onCall,
              child: Row(
                children: [
                  Icon(
                    IconlyLight.call,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const Nunito(
                    text: "Call",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(22, 10, 49, 1),
                  )
                ],
              ),
            ),
            TextButton(
                onPressed: onCancel,
                child: Row(
                  children: [
                    Icon(
                      IconlyLight.shield_fail,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const Nunito(
                      text: "Cancel",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(22, 10, 49, 1),
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if (!isArrived)
          PrimaryButton(
              height: 45,
              width: double.infinity,
              onPressed: onArrival,
              child: const Nunito(
                text: "Arrived",
                fontSize: 17,
                fontWeight: FontWeight.w400,
              )),
        if (isArrived)
          SecondaryButton(
              height: 45,
              width: double.infinity,
              onPressed: () {
                onPayment(isProvider);
              },
              child: Nunito(
                text: isProvider ? "Request payment" : "Make payment",
                fontSize: 17,
                fontWeight: FontWeight.w400,
              )),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.avator,
    required this.displayName,
    required this.userSubTitle,
    required this.rating,
    required this.count,
    this.avatorWidth = 68,
    this.action,
  }) : super(key: key);

  final String avator;
  final String displayName;
  final String userSubTitle;
  final double rating;
  final int count;
  final Widget? action;
  final double avatorWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: avatorWidth,
          child: PrimaryAvator(
            radius: avatorWidth * 15 / 34,
            backgroundImage: AssetImage(avator),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gilroy(
                text: displayName,
                fontSize: avatorWidth * 5 / 17,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
              Nunito(
                text: userSubTitle,
                fontSize: avatorWidth * 7 / 34,
                color: const Color.fromRGBO(108, 108, 108, 1),
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
              StarsRating(
                rating: rating,
                count: count,
                iconSize: avatorWidth * 3 / 17,
              )
            ],
          ),
        ),
        if (action != null) action!
      ],
    );
  }
}

class WaitingMapInfoCard extends StatelessWidget {
  const WaitingMapInfoCard(
      {Key? key,
      required this.avator,
      required this.displayName,
      required this.rating,
      required this.onCall,
      required this.eta,
      this.etaTitle = 'ETA',
      required this.destination,
      required this.userSubTitle,
      required this.count})
      : super(key: key);
  final String avator;
  final String displayName;
  final double rating;
  final void Function() onCall;
  final String eta;
  final String etaTitle;
  final String destination;
  final String userSubTitle;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 68,
          child: Column(
            children: [
              PrimaryAvator(
                radius: 30,
                backgroundImage: AssetImage(avator),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      IconlyLight.time_circle,
                      size: 18,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  )),
              Expanded(
                  child: CustomPaint(
                painter: _VerticalDotedLinePainter(),
              )),
              SizedBox(
                height: 18,
                width: 18,
                child: CustomPaint(
                  painter: _ArrowPainter(),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gilroy(
                          text: displayName,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Nunito(
                          text: userSubTitle,
                          fontSize: 14,
                          color: const Color.fromRGBO(108, 108, 108, 1),
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                        StarsRating(
                          rating: rating,
                          count: count,
                          iconSize: 12,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onCall,
                    icon: const Icon(
                      IconlyLight.call,
                    ),
                  )
                ],
              ),
            ),
            Nunito(
              text: etaTitle,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            Nunito(
              text: eta,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
            Nunito(
              text: destination,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ))
      ],
    );
  }
}

class _VerticalDotedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3193360, size.height * 0.01666667);
    path_0.lineTo(size.width * 0.3193345, size.height * 0.9833333);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.5701950;
    paint0Stroke.color = const Color(0xffFEB97A).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    canvas.drawPath(path_0, paint0Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8567067, size.height * 0.4260938);
    path_0.cubicTo(
        size.width * 0.9194511,
        size.height * 0.4612046,
        size.width * 0.9194511,
        size.height * 0.5274292,
        size.width * 0.8567067,
        size.height * 0.5625400);
    path_0.lineTo(size.width * 0.2346589, size.height * 0.9106308);
    path_0.cubicTo(
        size.width * 0.1517978,
        size.height * 0.9570000,
        size.width * 0.02829567,
        size.height * 0.9161692,
        size.width * 0.02829567,
        size.height * 0.8424077);
    path_0.lineTo(size.width * 0.02829567, size.height * 0.1462277);
    path_0.cubicTo(
        size.width * 0.02829567,
        size.height * 0.07246592,
        size.width * 0.1517978,
        size.height * 0.03163646,
        size.width * 0.2346589,
        size.height * 0.07800462);
    path_0.lineTo(size.width * 0.8567067, size.height * 0.4260938);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff0E0D26).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

@WidgetbookUseCase(name: "provider", type: TravelerMapInfoCard)
Widget getTravelerMapInfoCard(BuildContext context) {
  String displayName =
      context.knobs.text(label: "Display Name", initialValue: "User Name");
  double rating = context.knobs.slider(label: "rating", min: 0, max: 5);
  double height = context.knobs
      .slider(label: "height", min: 50, max: 500, initialValue: 225);
  String title =
      context.knobs.text(label: "title", initialValue: "Full body massage");
  String discription = context.knobs.text(
      label: "discription",
      initialValue:
          "Lorem Ipsum is simply dummy text of printing and typesetting industry.");
  bool isProvider =
      context.knobs.boolean(label: "Is provider", initialValue: false);
  bool isArrived =
      context.knobs.boolean(label: "Is arrived", initialValue: false);
  return Center(
    child: SizedBox(
        height: height,
        child: Center(
            child: TravelerMapInfoCard(
          displayName: displayName,
          avator: "assets/images/intro_picture_2.png",
          rating: rating,
          title: title,
          eta: "02:05",
          discription: discription,
          userSubTitle: "Customer",
          price: "Tsh 560",
          count: 100,
          isProvider: isProvider,
          isArrived: isArrived,
          onCall: () {},
          onCancel: () {},
          onArrival: () {},
          onPayment: (provider) {},
        ))),
  );
}

@WidgetbookUseCase(name: "customer", type: TravelerMapInfoCard)
Widget getCustomerTravelerMapInfoCard(BuildContext context) {
  String displayName =
      context.knobs.text(label: "Display Name", initialValue: "User Name");
  double rating = context.knobs.slider(label: "rating", min: 0, max: 5);
  double height = context.knobs
      .slider(label: "height", min: 50, max: 500, initialValue: 225);
  String title =
      context.knobs.text(label: "title", initialValue: "Full body massage");
  String discription = context.knobs.text(
      label: "discription",
      initialValue:
          "Lorem Ipsum is simply dummy text of printing and typesetting industry.");
  return Center(
    child: SizedBox(
      height: height,
      child: TravelerMapInfoCard(
        displayName: displayName,
        avator: "assets/images/intro_picture_2.png",
        rating: rating,
        title: title,
        eta: "2:05:50",
        discription: discription,
        userSubTitle: "Customer",
        price: "Tsh 560",
        count: 100,
        onCall: () {},
        onCancel: () {},
        onArrival: () {},
        onPayment: (provider) {},
      ),
    ),
  );
}

@WidgetbookUseCase(name: "provider", type: WaitingMapInfoCard)
Widget getWaitingMapInfoCard(BuildContext context) {
  String displayName =
      context.knobs.text(label: "Display Name", initialValue: "User Name");
  double rating = context.knobs.slider(label: "rating", min: 0, max: 5);
  double height = context.knobs
      .slider(label: "height", min: 50, max: 500, initialValue: 150);
  return Center(
    child: SizedBox(
        height: height,
        // width: 500,
        child: WaitingMapInfoCard(
          displayName: displayName,
          avator: "assets/images/intro_picture_2.png",
          rating: rating,
          etaTitle: "Estimated tima to arrival",
          eta: "15 Minutes",
          destination: "Kimara Dar es salaam",
          userSubTitle: "Massage specialist",
          count: 100,
          onCall: () {},
        )),
  );
}

@WidgetbookUseCase(name: "customer", type: WaitingMapInfoCard)
Widget getCustomerWaitingMapInfoCard(BuildContext context) {
  String displayName =
      context.knobs.text(label: "Display Name", initialValue: "User Name");
  double rating = context.knobs.slider(label: "rating", min: 0, max: 5);
  return Center(
    child: SizedBox(
      height: 200,
      width: 500,
      child: WaitingMapInfoCard(
        displayName: displayName,
        avator: "assets/images/intro_picture_2.png",
        rating: rating,
        eta: "15 Minutes",
        destination: "Kimara Temboni",
        userSubTitle: "Customer",
        count: 1000,
        onCall: () {},
      ),
    ),
  );
}
