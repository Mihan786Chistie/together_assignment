import 'package:flutter/material.dart';

class ThemeClass {
  Color primaryColor = Color.fromARGB(0, 246, 66, 66);
  Color secondaryColor = Color.fromARGB(0, 220, 40, 40);
  Color accentColor = Color(0x0000);
  Color cardColor = Color(0xffF3F3F3);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.primaryColor,
        secondary: _themeClass.secondaryColor),
  );
}

ThemeClass _themeClass = ThemeClass();
