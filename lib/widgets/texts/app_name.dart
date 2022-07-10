import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class AppName extends StatelessWidget {
  final bool isPrimary;

  const AppName({Key? key, this.isPrimary = true, this.fontSize = 24})
      : super(key: key);
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Theme.of(context).colorScheme.secondary);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Massage', style: isPrimary ? null : style),
          TextSpan(
              text: 'X',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary))
        ],
        style: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

@WidgetbookUseCase(name: "Default", type: AppName)
Widget getAppName(BuildContext context) => const Center(child: AppName());

@WidgetbookUseCase(name: "Secondary", type: AppName)
Widget getAppSecondary(BuildContext context) => const Center(
      child: AppName(
        isPrimary: false,
      ),
    );
