import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    // backgroundColor: Colors.white,
    // accentColor: Colors.blue,
    // accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.black12,
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    // backgroundColor: Colors.black,
    // accentColor: Colors.white,
    // accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.white24,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
