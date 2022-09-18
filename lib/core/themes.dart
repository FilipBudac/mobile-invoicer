import 'package:flutter/material.dart';

class Casist2Theme {
  static const mainColor = Color(0xff364ea1);
  static const secondaryColor = Color(0xffffffff);
  static const textColor = Color(0xff000000);

  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Ubuntu',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 20.0),
        headline6: TextStyle(fontSize: 20.0),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
      appBarTheme: const AppBarTheme(
        color: mainColor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: mainColor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: mainColor,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      fontFamily: 'Ubuntu',
      appBarTheme: const AppBarTheme(
        color: mainColor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: mainColor,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: mainColor,
    );
  }
}