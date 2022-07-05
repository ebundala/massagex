// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

final mainTheme = ThemeData(
  //useMaterial3: true,
  // primaryColor: const Color.fromRGBO(136, 9, 174, 1),
  // primaryColorLight: const Color.fromRGBO(136, 9, 174, 1),
  // primaryColorDark: const Color.fromRGBO(33, 3, 43, 1),
  colorScheme: const ColorScheme(
      // seedColor: const Color(0x8809ae),
      brightness: Brightness.light,
      primary: Color.fromRGBO(136, 9, 174, 1),
      onPrimary: Colors.white,
      secondary: Color.fromRGBO(255, 155, 37, 1),
      onSecondary: Colors.white,
      error: Colors.redAccent,
      onError: Colors.white,
      background: Color.fromRGBO(229, 229, 229, 1),
      onBackground: Color.fromRGBO(22, 10, 49, 1),
      surface: Color.fromRGBO(255, 255, 255, 1),
      onSurface: Color.fromRGBO(22, 10, 49, 1)),
  // focusColor
  // hoverColor
  // shadowColor
  canvasColor: const Color.fromRGBO(229, 229, 229, 1),
  scaffoldBackgroundColor: const Color.fromRGBO(229, 229, 229, 1),
  // bottomAppBarColor
  cardColor: const Color.fromRGBO(229, 229, 229, 1),
  // dividerColor:
  // highlightColor
  // splashColor
  // selectedRowColor
  // unselectedWidgetColor
  disabledColor: const Color.fromRGBO(196, 196, 196, 0.72),
  // secondaryHeaderColor
  backgroundColor: const Color(0xE5E5E5),
  // dialogBackgroundColor
  // indicatorColor
  // hintColor
  // errorColor
  // toggleableActiveColor
  // String? fontFamily
  // Typography typography
  //textTheme:TextTheme(titleLarge: )
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      //textStyle: MaterialStateProperty.all(TextStyle(al)),
      // alignment: Alignment.center,
      // minimumSize: MaterialStateProperty.all(const Size(80, 50)),
      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)))),
      //padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
      backgroundColor: MaterialStateProperty.all(
        const Color.fromRGBO(136, 9, 174, 1),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      //borderSide: BorderSide(color: ),
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  ),
);

@WidgetbookTheme(name: 'Dark', isDefault: true)
ThemeData getDarkTheme() => mainTheme.copyWith(brightness: Brightness.dark);

@WidgetbookTheme(name: 'light', isDefault: true)
ThemeData getLightTheme() => mainTheme;
