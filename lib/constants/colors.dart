import 'package:flutter/material.dart';

class ThemeColors {
  // Base Color
  static const Color black = Color(0xFF11151C);

  static const Color white = Color(0xFFFDFDFD);
  // static const ColorBase base = ColorBase(
  //   _black,
  //   <String, Color>{
  //     "white": Color(0xFFFDFDFD),
  //     "black": Color(_black),
  //   },
  // );

  static const int _gray = 0xFFC0C0C0;

  static const MaterialColor gray = MaterialColor(
    _gray,
    <int, Color>{
      50: Color(0xFFF9F9F9),
      100: Color(0xFFF2F2F2),
      200: Color(0xFFE6E6E6),
      300: Color(0xFFD9D9D9),
      400: Color(0xFFCDCDCD),
      500: Color(_gray),
      600: Color(0xFF909090),
      700: Color(0xFF606060),
      800: Color(0xFF303030),
      900: Color(0xFF131313),
    },
  );

  static const int _primary = 0xFF1C1A29;

  static const MaterialColor primary = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFE9E9EA),
      100: Color(0xFFD2D1D4),
      200: Color(0xFFA4A3A9),
      300: Color(0xFF77767F),
      400: Color(0xFF494854),
      500: Color(_primary),
      600: Color(0xFF15141F),
      700: Color(0xFF0E0D15),
      800: Color(0xFF07070A),
      900: Color(0xFF030304),
    },
  );
}

class ColorBase extends ColorSwatch<String> {
  const ColorBase(super.primary, super.swatch);

  Color get white => this['white']!;

  Color get black => this['black']!;
}
