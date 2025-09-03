import 'package:flutter/material.dart';

class AppTheme {
  static const Color yellow = Color(0xffF6BD00);
  static const Color black = Color(0xff121312);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF282A28);
  static const Color red = Color(0xFFE82626);
  static const Color green = Color(0xFF57AA53);
  static const Color transparent = Colors.transparent;
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: yellow,
        fontWeight: FontWeight.w400,
      ),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 36,
        color: white,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: black,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        color: black,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData lightTheme = ThemeData();
}
