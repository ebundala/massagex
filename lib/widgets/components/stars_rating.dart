import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    show WidgetbookUseCase;
import 'package:widgetbook/widgetbook.dart' hide WidgetbookUseCase;

class StarsRating extends StatelessWidget {
  const StarsRating({
    Key? key,
    this.count = 0,
    this.rating = 0,
    this.iconSize = 24,
    this.starCount = 5,
    this.activeColor,
    this.inactiveColor,
  })  : assert(rating <= starCount),
        super(key: key);
  final double rating;
  final int count;
  final double iconSize;
  final Color? activeColor;
  final Color? inactiveColor;
  final int starCount;
  List<Widget> buildIcons(double rating, BuildContext context) {
    List<Widget> icons = [];
    while (icons.length < starCount) {
      if (icons.length < rating.round()) {
        //render active star
        icons.add(getStar(true, context));
      } else {
        //render inactive star
        icons.add(getStar(false, context));
      }
    }
    return icons;
  }

  Icon getStar(active, BuildContext context) {
    Color color;
    if (active) {
      color = activeColor ?? Theme.of(context).colorScheme.secondary;
    } else {
      color = inactiveColor ?? Theme.of(context).disabledColor;
    }

    return Icon(
      IconlyBold.star,
      size: iconSize,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final countStr = "$count";
    final ratingStr = rating.toStringAsFixed(1);
    const textSizeFactor = 0.6;
    final icons = buildIcons(rating, context);
    return SizedBox(
      height: iconSize,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...icons,
          SizedBox(
            width: iconSize / 2 * (ratingStr.length + 2) * textSizeFactor,
            child: Nunito(
              text: '($ratingStr)',
              fontWeight: FontWeight.w600,
              fontSize: iconSize * textSizeFactor,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          SizedBox(
            width: iconSize * countStr.length * textSizeFactor,
            child: Nunito(
              text: countStr,
              fontWeight: FontWeight.w400,
              fontSize: iconSize * textSizeFactor,
              color: const Color.fromRGBO(128, 128, 128, 1),
            ),
          )
        ],
      ),
    );
  }
}

@WidgetbookUseCase(name: "primary", type: StarsRating)
Widget getStarsRating(BuildContext context) {
  double? rating = context.knobs
      .nullableSlider(label: "stars", max: 10, min: 1, divisions: 10);
  double? count = context.knobs
      .nullableSlider(label: "count", max: 1000, min: 1, divisions: 1000);
  return Center(
    child: SizedBox(
        height: 500,
        width: 500,
        child: Row(
          children: [
            Expanded(child: Container()),
            StarsRating(
                starCount: 10,
                rating: rating ?? 0,
                count: (count ?? 0).floor()),
            Expanded(child: Container()),
          ],
        )),
  );
}
