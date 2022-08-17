import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class OutlinedChip extends StatelessWidget {
  final Widget label;

  const OutlinedChip({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        label: label,
        backgroundColor: const Color.fromRGBO(244, 244, 245, 1),
        labelStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromRGBO(22, 10, 49, 1)),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ));
  }
}

class DistanceChip extends StatelessWidget {
  final Widget label;
  final double fontSize;

  final EdgeInsetsGeometry? padding;

  final Color color;

  final EdgeInsetsGeometry? labelPadding;
  const DistanceChip(
      {Key? key,
      required this.label,
      this.fontSize = 20,
      this.padding = const EdgeInsets.all(0),
      this.color = const Color.fromRGBO(237, 36, 132, 1),
      this.labelPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: label,
      padding: padding,
      labelPadding: labelPadding,
      avatar: Icon(
        IconlyLight.location,
        size: fontSize,
        color: color,
      ),
      backgroundColor: const Color.fromRGBO(243, 222, 234, 1),
      labelStyle: GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      // shape: const RoundedRectangleBorder(
      //   side: BorderSide.none,
      //   borderRadius: BorderRadius.all(Radius.circular(6)),
      // ),
    );
  }
}

@WidgetbookUseCase(name: "outlined", type: OutlinedChip)
Widget getChip(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: OutlinedChip(
          label: Nunito(text: "Reduce anxiety"),
        ),
      ),
    );

@WidgetbookUseCase(name: "distance", type: DistanceChip)
Widget getChip1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: DistanceChip(
          label: Nunito(
            text: "3 KM away",
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
