import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColor =
      MaterialColor(_primaryColorPrimaryValue, <int, Color>{
    50: Color(0xFFFEEBED),
    100: Color(0xFFFDCED2),
    200: Color(0xFFFCAEB4),
    300: Color(0xFFFA8D95),
    400: Color(0xFFF9747F),
    500: Color(_primaryColorPrimaryValue),
    600: Color(0xFFF75460),
    700: Color(0xFFF64A55),
    800: Color(0xFFF5414B),
    900: Color(0xFFF3303A),
  });
  static const int _primaryColorPrimaryValue = 0xFFF85C68;

  static const MaterialColor primaryColorAccent =
      MaterialColor(_primarycolorAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_primarycolorAccentValue),
    400: Color(0xFFFFCFD1),
    700: Color(0xFFFFB6B9),
  });
  static const int _primarycolorAccentValue = 0xFFFFFFFF;
}
