import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryBadge extends StatelessWidget {
  final String subText;

  final String text;
  final Widget icon;
  const PrimaryBadge(
      {Key? key, required this.subText, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 97,
      height: 104,
      child: Card(
        color: const Color.fromRGBO(244, 244, 245, 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8),
        )),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 48,
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
              height: 15,
              child: Gilroy(
                fontWeight: FontWeight.w700,
                text: text,
                fontSize: 17,
                height: 1,
                color: const Color.fromRGBO(53, 54, 79, 1),
              ),
            ),
            const Spacer(),
            SizedBox(
              // width: 31,
              height: 9,
              child: Gordita(
                fontWeight: FontWeight.w400,
                text: subText,
                fontSize: 9,
                height: 1,
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
  const SecondaryBadge(
      {Key? key, required this.subText, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 97,
      height: 104,
      child: Column(
        children: [
          Container(
            width: 44,
            height: 48,
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
            height: 15,
            child: Gilroy(
              fontWeight: FontWeight.w700,
              text: text,
              fontSize: 17,
              height: 1,
              color: const Color.fromRGBO(53, 54, 79, 1),
            ),
          ),
          const Spacer(),
          SizedBox(
            // width: 31,
            height: 9,
            child: Gordita(
              fontWeight: FontWeight.w400,
              text: subText,
              fontSize: 9,
              height: 1,
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
