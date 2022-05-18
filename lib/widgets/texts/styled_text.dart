import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

// Nunuto font
class Nunito extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const Nunito(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.textAlign,
      this.strutStyle,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GoogleFonts.nunito(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

// playfair display
class PlayfairDisplay extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  const PlayfairDisplay(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GoogleFonts.playfairDisplay(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

//gordita font

class Gordita extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  const Gordita(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        fontFamily: "Gordita",
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

// Gilroy font

class NunitoSans extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const NunitoSans(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GoogleFonts.nunitoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

//manrope font
class Manrope extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  const Manrope(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: GoogleFonts.manrope(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

//Gilroy font
class Gilroy extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? letterSpacing;
  final Color? backgroundColor;
  final FontStyle? fontStyle;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? foreground;
  final Paint? background;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThicknes;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  const Gilroy(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.height,
      this.letterSpacing,
      this.backgroundColor,
      this.fontStyle,
      this.wordSpacing,
      this.textBaseline,
      this.locale,
      this.foreground,
      this.background,
      this.shadows,
      this.fontFeatures,
      this.decoration,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThicknes,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.softWrap,
      this.overflow,
      this.textScaleFactor,
      this.maxLines,
      this.semanticsLabel,
      this.textWidthBasis,
      this.textHeightBehavior})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        // decorationThicknes: decorationThicknes,
      ),
      child: Text(
        text,
        textAlign: textAlign,
        strutStyle: strutStyle,
        textDirection: textDirection,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      ),
    );
  }
}

@WidgetbookUseCase(name: "Nunito", type: Nunito)
Widget getFont(BuildContext context) => const Center(
      child: Nunito(text: "Nunito"),
    );
@WidgetbookUseCase(name: "Gordita", type: Gordita)
Widget getFont1(BuildContext context) => const Center(
      child: Gordita(
        text: "Gordita",
        fontWeight: FontWeight.w500,
      ),
    );
@WidgetbookUseCase(name: "manrope", type: Manrope)
Widget getFont2(BuildContext context) => const Center(
      child: Manrope(
        text: "manrope",
        fontWeight: FontWeight.w500,
      ),
    );
@WidgetbookUseCase(name: "nunito sans", type: NunitoSans)
Widget getFont3(BuildContext context) => const Center(
      child: NunitoSans(text: "nunito sans"),
    );
@WidgetbookUseCase(name: "Gilroy 400", type: Gilroy)
Widget getFont4(BuildContext context) => const Center(
      child: Gilroy(
        text: "Gilroy 400",
        fontWeight: FontWeight.w400,
      ),
    );
@WidgetbookUseCase(name: "Gilroy 500", type: Gilroy)
Widget getFont5(BuildContext context) => const Center(
      child: Gilroy(
        text: "Gilroy 500",
        fontWeight: FontWeight.w500,
      ),
    );
@WidgetbookUseCase(name: "Gilroy 600", type: Gilroy)
Widget getFont6(BuildContext context) => const Center(
      child: Gilroy(
        text: "Gilroy 600",
        fontWeight: FontWeight.w600,
      ),
    );

@WidgetbookUseCase(name: "Gilroy 700", type: Gilroy)
Widget getFont7(BuildContext context) => const Center(
      child: Gilroy(
        text: "Gilroy 700",
        fontWeight: FontWeight.w700,
      ),
    );
