import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade100,

    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.black,
      onSecondary: Colors.white,
      surface: Colors.grey.shade300,
      onSurface: Colors.black,
    ),

    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade100,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    cardColor: Colors.white, 
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.grey.shade200,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,

    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey.shade800,
      onSecondary: Colors.white,
      surface: Colors.grey.shade600,
      onSurface: Colors.black,
    ),

    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: Colors.grey.shade800,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.grey.shade800,
    ),
  );
}
