import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryBadge extends StatelessWidget {
  final String subText;

  final String text;
  final Widget icon;
  final double width;
  const PrimaryBadge(
      {Key? key,
      required this.subText,
      required this.text,
      required this.icon,
      this.width = 97})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 110 / 97 * width,
      child: Card(
        color: const Color.fromRGBO(244, 244, 245, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
        child: Column(
          children: [
            Container(
              width: 44 / 97 * width,
              height: 48 / 97 * width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: icon,
              ),
            ),
            const Spacer(),
            SizedBox(
              //  width: 30,
              height: 18 / 97 * width,
              child: Gilroy(
                fontWeight: FontWeight.w700,
                text: text,
                fontSize: 17 / 97 * width,
                // height: 1,
                color: const Color.fromRGBO(53, 54, 79, 1),
              ),
            ),
            const Spacer(),
            SizedBox(
              // width: 31,
              height: 10 / 97 * width,
              child: Gordita(
                fontWeight: FontWeight.w400,
                text: subText,
                fontSize: 9 / 97 * width,
                // height: 1,
                color: const Color.fromRGBO(108, 108, 108, 1),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SecondaryBadge extends StatelessWidget {
  final String subText;

  final String text;
  final Widget icon;
  final double width;
  const SecondaryBadge(
      {Key? key,
      required this.subText,
      required this.text,
      required this.icon,
      this.width = 97})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 104 / 97 * width,
      child: Column(
        children: [
          Container(
            width: 44 / 97 * width,
            height: 48 / 97 * width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(244, 244, 245, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: icon,
            ),
          ),
          const Spacer(),
          SizedBox(
            //  width: 30,
            height: 15 / 97 * width,
            child: Gilroy(
              fontWeight: FontWeight.w700,
              text: text,
              fontSize: 17 / 97 * width,
              // height: 1,
              color: const Color.fromRGBO(53, 54, 79, 1),
            ),
          ),
          const Spacer(),
          SizedBox(
            // width: 31,
            height: 9 / 97 * width,
            child: Gordita(
              fontWeight: FontWeight.w400,
              text: subText,
              fontSize: 9 / 97 * width,
              //  height: 1,
              color: const Color.fromRGBO(108, 108, 108, 1),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryBadge)
Widget getBadge(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: PrimaryBadge(
          text: "8 Years",
          subText: 'Experience',
          icon: Icon(
            IconlyLight.shield_done,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );

@WidgetbookUseCase(name: "secondary", type: SecondaryBadge)
Widget getBadge1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: SecondaryBadge(
          text: "4.6",
          subText: 'Rating',
          icon: Icon(
            IconlyLight.star,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
