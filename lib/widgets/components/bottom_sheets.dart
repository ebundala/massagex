import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/components/avators.dart';
import 'package:massagex/widgets/components/badges.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/spinars.dart';
import 'package:massagex/widgets/components/stars_rating.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class RequestBottomSheet extends StatelessWidget {
  const RequestBottomSheet(
      {Key? key,
      this.success = false,
      this.error = false,
      required this.waitingText,
      required this.waitingTextSubTitle,
      required this.waitingButtonText,
      required this.avator,
      required this.displayName,
      required this.userSubTitle,
      required this.count,
      required this.rating,
      required this.onCall,
      required this.onCancel,
      required this.badgeIcon1,
      required this.badgeText1,
      required this.badgeSubText1,
      required this.badgeIcon2,
      required this.badgeText2,
      required this.badgeSubText2,
      required this.badgeIcon3,
      required this.badgeText3,
      required this.badgeSubText3,
      required this.onComplete,
      this.cancelText = "Cancel",
      required this.successText,
      required this.successTextSubTitle,
      required this.successButtonText,
      required this.errorText,
      required this.errorTextSubTitle,
      required this.errorButtonText})
      : super(key: key);
  final bool success;
  final bool error;
  final String waitingText;
  final String waitingTextSubTitle;
  final String waitingButtonText;
  final String avator;
  final String displayName;
  final String userSubTitle;
  final int count;
  final double rating;
  final void Function(BuildContext context) onCall;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, bool status) onComplete;
  final Widget badgeIcon1;
  final String badgeText1;
  final String badgeSubText1;
  final Widget badgeIcon2;
  final String badgeText2;
  final String badgeSubText2;
  final Widget badgeIcon3;
  final String badgeText3;
  final String badgeSubText3;
  final String cancelText;
  final String successText;
  final String successTextSubTitle;
  final String successButtonText;
  final String errorText;
  final String errorTextSubTitle;
  final String errorButtonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextsButton(
                  onPressed: () => onCancel(context),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Nunito(
                        text: cancelText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const Icon(
                        IconlyLight.close_square,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          PrimarySpinar(
            radius: 40,
            width: 6,
            success: success,
            error: error,
            child: const Center(
                child: AppName(
              fontSize: 12,
            )),
          ),
          if (!success && !error) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Gilroy(
                text: waitingText,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Nunito(
                text: waitingTextSubTitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TimeoutCounterWidget(
                    timeout: const Duration(seconds: 60),
                    onTimeout: () {
                      print("Timedout");
                    })),
          ],
          if (error && !success) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Gilroy(
                text: errorText,
                fontSize: 19,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Nunito(
                text: errorTextSubTitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                height: 32,
                width: double.infinity,
                onPressed: () => onComplete(context, true),
                child: Gordita(
                    text: errorButtonText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
          if (success && !error) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Gilroy(
                text: successText,
                fontSize: 19,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Nunito(
                text: successTextSubTitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                height: 32,
                width: double.infinity,
                onPressed: () => onComplete(context, false),
                child: Gordita(
                    text: successButtonText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileTile(
              avatorWidth: 56,
              avator: avator,
              displayName: displayName,
              userSubTitle: userSubTitle,
              rating: rating,
              count: count,
              action: IconButton(
                icon: const Icon(
                  IconlyLight.call,
                ),
                onPressed: () => onCall(context),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SecondaryBadge(
                      width: 72,
                      subText: badgeSubText1,
                      text: badgeText1,
                      icon: badgeIcon1),
                  SecondaryBadge(
                      width: 72,
                      subText: badgeSubText2,
                      text: badgeText2,
                      icon: badgeIcon2),
                  SecondaryBadge(
                      width: 72,
                      subText: badgeSubText3,
                      text: badgeText3,
                      icon: badgeIcon3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension CustomBottomSheetExt on BuildContext {
  Future<T?> showCustomBottomSheet<T>(
      {double heightFactor = 1,
      BuildContext? context,
      widthFactor = 1,
      Color? backgroundColor,
      double? elevation,
      required Widget Function(BuildContext) builder}) {
    final size = MediaQuery.of(this).size;
    final constraints = BoxConstraints(
        maxHeight: size.height * heightFactor,
        maxWidth: size.width * widthFactor);

    return showModalBottomSheet<T?>(
        context: context ?? this,
        backgroundColor: backgroundColor,
        clipBehavior: Clip.antiAlias,
        // constraints: constraints,
        elevation: elevation,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        builder: builder);
  }
}

abstract class NotificationData {
  final String avator;
  final String cancelText;
  final String title;
  final String userName;
  final String dateTime;

  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, bool status) onComplete;
  NotificationData(
      {required this.avator,
      required this.cancelText,
      required this.title,
      required this.userName,
      required this.dateTime,
      required this.onCancel,
      required this.onComplete});
}

class IncomingRequestNotificationData extends NotificationData {
  final String serviceTitle;
  final double price;
  final String description;
  final String descriptionUnderline;
  final String distanceText;
  final String acceptText;
  final String declineText;
  final List<String> extras;
  final void Function(BuildContext context) onAccept;
  final void Function(BuildContext context) onDecline;

  IncomingRequestNotificationData({
    required super.avator,
    required super.cancelText,
    required super.title,
    required super.userName,
    required super.dateTime,
    required super.onCancel,
    required super.onComplete,
    required this.serviceTitle,
    required this.price,
    required this.description,
    required this.descriptionUnderline,
    required this.extras,
    required this.onAccept,
    required this.onDecline,
    required this.distanceText,
    required this.declineText,
    required this.acceptText,
  });
}

class PaymentReceivedNotificationData extends IncomingRequestNotificationData {
  PaymentReceivedNotificationData(
      {required super.avator,
      required super.cancelText,
      required super.title,
      required super.userName,
      required super.dateTime,
      required super.onCancel,
      required super.onComplete,
      required super.serviceTitle,
      required super.price,
      required super.description,
      required super.descriptionUnderline,
      required super.extras,
      required super.onAccept,
      required super.onDecline,
      required super.distanceText,
      required super.acceptText,
      required super.declineText});
}

class ReviewNotificationData extends NotificationData {
  final String ratingSubtitle;
  final String reviewComment;
  final double rating;
  final void Function() onReply;
  final String replyText;
  ReviewNotificationData(
      {required super.avator,
      required super.cancelText,
      required super.title,
      required super.userName,
      required super.dateTime,
      required super.onCancel,
      required super.onComplete,
      required this.onReply,
      required this.rating,
      required this.ratingSubtitle,
      required this.reviewComment,
      required this.replyText});
}

class NotificationBottomSheet extends StatelessWidget {
  final NotificationData data;
  const NotificationBottomSheet({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextsButton(
                  onPressed: () => data.onCancel(context),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Nunito(
                        text: data.cancelText,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      const Icon(
                        IconlyLight.close_square,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Gilroy(
            text: data.title,
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedAvator(
              radius: 30,
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              backgroundImage: AssetImage(data.avator),
            ),
          ),
          //incomming request
          if (data is IncomingRequestNotificationData) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: DistanceChip(
                label: Nunito(
                  text: (data as IncomingRequestNotificationData).distanceText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Nunito(
                  text: (data as IncomingRequestNotificationData).dateTime,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: CardWithActions(
                  color: Colors.white,
                  actionMainAxisAlignment: MainAxisAlignment.spaceBetween,
                  actions: [
                    PrimaryButton(
                      onPressed: () => (data as IncomingRequestNotificationData)
                          .onAccept(context),
                      child: Nunito(
                          text: (data as IncomingRequestNotificationData)
                              .acceptText),
                    ),
                    SecondaryButton(
                      onPressed: () => (data as IncomingRequestNotificationData)
                          .onDecline(context),
                      child: Nunito(
                          text: (data as IncomingRequestNotificationData)
                              .declineText),
                    )
                  ],
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Nunito(
                              text: (data as IncomingRequestNotificationData)
                                  .serviceTitle,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gordita(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            text:
                                '${(data as IncomingRequestNotificationData).price.toStringAsFixed(2)} Tsh',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          text: (data as IncomingRequestNotificationData)
                              .description),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(IconlyLight.time_circle),
                          Expanded(
                            child: Nunito(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                text: (data as IncomingRequestNotificationData)
                                    .descriptionUnderline),
                          )
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        direction: Axis.horizontal,
                        children: [
                          ...(data as IncomingRequestNotificationData)
                              .extras
                              .map((e) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        IconlyLight.tick_square,
                                        size: 14,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Nunito(
                                          text: e,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
          //payment recieved
          // if (data is PaymentReceivedNotificationData) ...[],
          //review notification
          if (data is ReviewNotificationData) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: StarsRating(
                showCount: false,
                rating: (data as ReviewNotificationData).rating,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Nunito(
                text: (data as ReviewNotificationData).ratingSubtitle,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Nunito(
                  text: (data as ReviewNotificationData).dateTime,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Column(
                    children: [
                      PrimaryCard(
                        color: const Color.fromRGBO(213, 221, 224, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Nunito(
                            text:
                                (data as ReviewNotificationData).reviewComment,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: PrimaryButton(
                          child: Gilroy(
                            text: (data as ReviewNotificationData).replyText,
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ]
        ],
      ),
    );
  }
}

class TimeoutCounterWidget extends StatefulWidget {
  const TimeoutCounterWidget(
      {Key? key, required this.timeout, required this.onTimeout})
      : super(key: key);
  final Duration timeout;
  final VoidCallback onTimeout;
  @override
  State<TimeoutCounterWidget> createState() => _TimeoutCounterWidgetState();
}

class _TimeoutCounterWidgetState extends State<TimeoutCounterWidget> {
  late Timer timer;
  final Stopwatch stopwatch = Stopwatch();
  late Timer periodicTimer;
  @override
  void initState() {
    super.initState();
    stopwatch.start();
    periodicTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {});
    });
    timer = Timer(widget.timeout, () {
      periodicTimer.cancel();
      // call timeout handler
      widget.onTimeout();
    });
  }

  Duration get elapsed => stopwatch.elapsed;
  Duration get total => widget.timeout;
  @override
  void dispose() {
    timer.cancel();
    periodicTimer.cancel();
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMinInteractiveDimension + 16,
      child: Stack(
        children: [
          Positioned.fill(
            child: LinearProgressIndicator(
              value: elapsed.inSeconds / total.inSeconds,
              minHeight: kMinInteractiveDimension,
              backgroundColor: Colors.grey,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Positioned.fill(
              child: Center(
            child: Nunito(
              text:
                  "${elapsed.toString().substring(2, 7)}/${total.toString().substring(2, 7)}",
              color: Colors.white,
            ),
          ))
        ],
      ),
    );
  }
}

@WidgetbookUseCase(name: "Request", type: RequestBottomSheet)
Widget getRequestBottomSheet(BuildContext context) {
  double heightFactor = context.knobs
      .slider(label: "Height Factor", min: 0, max: 1, initialValue: 0.89);
  return Center(
    child: SizedBox(
      height: 50,
      child: PrimaryButton(
        child: const Nunito(text: "Show sheet"),
        onPressed: () async {
          context.showCustomBottomSheet(
              backgroundColor: Colors.white,
              heightFactor: heightFactor,
              elevation: 8,
              builder: (ctx) {
                final success =
                    ctx.knobs.boolean(label: "success", initialValue: false);
                final error =
                    ctx.knobs.boolean(label: "error", initialValue: false);
                return RequestBottomSheet(
                    waitingText: "Please Hold on! We are requesting now",
                    waitingTextSubTitle: "Apologies for your waiting",
                    waitingButtonText: "REQUESTING...",
                    avator: 'assets/images/intro_picture_4.png',
                    displayName: "Elias Bundala",
                    userSubTitle: "Massage therapist",
                    count: 1000,
                    rating: 3.5,
                    success: success,
                    error: error,
                    badgeIcon1: const Icon(IconlyLight.shield_done,
                        color: Colors.green),
                    badgeIcon2:
                        const Icon(IconlyLight.star, color: Colors.orange),
                    badgeIcon3:
                        const Icon(IconlyLight.shield_fail, color: Colors.red),
                    badgeText1: "78.9%",
                    badgeText2: "3.5",
                    badgeText3: "5%",
                    badgeSubText1: "accaptance",
                    badgeSubText2: "rating",
                    badgeSubText3: "cancelation",
                    successButtonText: "CHECK SCHEDULE",
                    successText: "Congratulations",
                    successTextSubTitle:
                        "Please Hold on! We are requesting now",
                    errorButtonText: "Go back",
                    errorText: "Oh Snap!",
                    errorTextSubTitle: "Please Hold on! We are requesting now",
                    onCall: (ctx) {},
                    onCancel: (ctx) {
                      Navigator.of(ctx).pop();
                    },
                    onComplete: (ctx, status) {
                      Navigator.of(ctx).pop();
                    });
              });
        },
      ),
    ),
  );
}

@WidgetbookUseCase(name: "Request", type: NotificationBottomSheet)
Widget getNotificationBottomSheet(BuildContext context) {
  double heightFactor = context.knobs
      .slider(label: "Height Factor", min: 0, max: 1, initialValue: 0.89);
  NotificationData? data;

  bool isPayment =
      context.knobs.boolean(label: "is payment", initialValue: false);
  bool isReview =
      context.knobs.boolean(label: "is Review", initialValue: false);

  if (isPayment) {
    data = PaymentReceivedNotificationData(
      avator: 'assets/images/intro_picture_4.png',
      cancelText: "Cancel",
      title: "Payment Received",
      userName: "John Doe",
      dateTime: "22 jan 2022",
      onCancel: (ctx) {
        Navigator.of(ctx).pop();
      },
      onComplete: (ctx, status) {},
      serviceTitle: "Full body massage",
      price: 34.6,
      description: "This is description here test to view it here ",
      descriptionUnderline: "1 hour with full relaxation",
      extras: ["free", "good ", 'relax'],
      onAccept: (ctx) {},
      onDecline: (ctx) {},
      distanceText: "2km kwa mfipa kibaha",
      declineText: "Decline",
      acceptText: "Accept",
    );
  } else if (isReview) {
    data = ReviewNotificationData(
      avator: 'assets/images/intro_picture_4.png',
      cancelText: "Cancel",
      title: "You have been rated!",
      userName: "John Doe",
      dateTime: "22 jan 2022",
      replyText: "Reply",
      onCancel: (ctx) {
        Navigator.of(ctx).pop();
      },
      onComplete: (ctx, status) {},
      onReply: () {},
      rating: 4.13,
      ratingSubtitle: "good ",
      reviewComment:
          "This is the review comment you have been left by your reviewer",
    );
  } else {
    data = IncomingRequestNotificationData(
        avator: 'assets/images/intro_picture_4.png',
        cancelText: "Cancel",
        title: "Incomming request",
        userName: "John Doe",
        dateTime: "22 jan 2022",
        onCancel: (ctx) {
          Navigator.of(ctx).pop();
        },
        onComplete: (ctx, status) {},
        serviceTitle: "Full body massage",
        price: 34.6,
        description: "This is description here test to view it here ",
        descriptionUnderline: "1 hour with full relaxation",
        extras: ["free", "good ", 'relax'],
        onAccept: (ctx) {},
        onDecline: (ctx) {},
        distanceText: "2km kwa mfipa kibaha",
        declineText: "Dicline",
        acceptText: "Accept");
  }
  return Center(
    child: SizedBox(
      height: 50,
      child: PrimaryButton(
        child: const Nunito(text: "Show sheet"),
        onPressed: () async {
          context.showCustomBottomSheet(
              backgroundColor: Colors.white,
              heightFactor: heightFactor,
              elevation: 8,
              builder: (context) {
                return NotificationBottomSheet(
                  data: data!,
                );
              });
        },
      ),
    ),
  );
}
