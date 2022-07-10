import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/components/badges.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/spinars.dart';
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
              child: PrimaryButton(
                height: 32,
                width: double.infinity,
                child: Gordita(
                    text: waitingButtonText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
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
  PersistentBottomSheetController<T> showCustomBottomSheet<T>(
      {double heightFactor = 1,
      widthFactor = 1,
      Color? backgroundColor,
      double? elevation,
      required Widget Function(BuildContext) builder}) {
    final size = MediaQuery.of(this).size;
    final constraints = BoxConstraints(
        maxHeight: size.height * heightFactor,
        maxWidth: size.width * widthFactor);
    return showBottomSheet<T>(
        context: this,
        backgroundColor: backgroundColor,
        clipBehavior: Clip.antiAlias,
        constraints: constraints,
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

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

extension NotificationBottomSheetExt on BuildContext {
  Future<T?> showNotificationBottomSheet<T>() {
    return showModalBottomSheet<T>(
        context: this,
        builder: (ctx) {
          return const NotificationBottomSheet();
        });
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
  return Center(
    child: SizedBox(
      height: 50,
      child: PrimaryButton(
        child: const Nunito(text: "Show sheet"),
        onPressed: () async {
          context.showNotificationBottomSheet();
        },
      ),
    ),
  );
}
