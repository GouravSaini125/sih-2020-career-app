import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color bgColorLight = Colors.white;
  static final Color textColorLight = Colors.black;
  static final Color primaryColorLight = Colors.red;
  static final Color secondaryColorLight = Colors.green;
  static final Color accentColorLight = Colors.blueAccent;

  static final Color bgColorDark = Colors.black;
  static final Color textColorDark = Colors.white;
  static final Color primaryColorDark = Colors.green;
  static final Color secondaryColorDark = Colors.red;
  static final Color accentColorDark = Colors.blueAccent;

  static final ThemeData lightTheme = ThemeData(
    accentColor: primaryColorLight,
    scaffoldBackgroundColor: bgColorLight,
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: textColorLight,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: primaryColorLight,
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColorLight,
      secondary: secondaryColorLight,
    ),
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(
        primary: primaryColorLight,
        secondary: secondaryColorLight,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    accentColor: primaryColorDark,
    scaffoldBackgroundColor: bgColorDark,
    textTheme: TextTheme(
     bodyText1: TextStyle(
        color: textColorDark,
     ),
     headline5: TextStyle(
        color: textColorDark,
     ),
     bodyText2: TextStyle(
        color: textColorDark,
     ),
    ),
    appBarTheme: AppBarTheme(
      color: primaryColorDark,
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.dark(
          primary: primaryColorDark,
          secondary: secondaryColorDark,
        ),
    ),
  );
}
