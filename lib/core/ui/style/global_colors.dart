import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
  Color get primaryLightColor => theme.primaryColorLight;
  Color get primaryDarkColor => theme.primaryColorDark;
  Color get secondaryHeaderColor => theme.secondaryHeaderColor;
  Color get cardColor => theme.cardColor;
  Color get transparent => const Color(0x00000000);
  Color get white => const Color(0xFFFFFFFF);
  Color get appBarColor => const Color(0xFF47e4c2);
  Color get baseBackgroundColor => const Color(0xFFfafafa);
  Color get white2 => const Color(0xFFF3F3F7);
  Color get black => const Color(0xFF000000);
  Color get blackText => const Color(0xFF464646);
  Color get grey => const Color(0xFF696B71);
  Color get elevationColor => const Color(0xFFD9D9D9);
  Color get lightGrey => const Color(0xFF9a9a9a);
  Color get greyText => const Color(0xFF8c8c8c);
}
