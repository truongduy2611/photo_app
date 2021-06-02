import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      secondary: Colors.pink,
      surface: Colors.grey[200]!,
      error: Colors.red,
      background: Colors.grey[200]!,
      primaryVariant: Colors.grey[800]!,
      secondaryVariant: Colors.pink[600]!,
      onSurface: Colors.grey[800]!,
      onBackground: Colors.grey[800]!,
      onError: Colors.white,
      onPrimary: Colors.grey[200]!,
      onSecondary: Colors.white,
    ),
  ).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[200]!,
      iconTheme: const IconThemeData(color: Colors.black),
      actionsIconTheme: const IconThemeData(color: Colors.black),
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      headline4: GoogleFonts.comfortaaTextTheme()
          .headline4!
          .copyWith(color: Colors.black),
      button: const TextStyle(
        fontWeight: FontWeight.bold,
        height: 1.2,
        wordSpacing: 0.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(width: 2.2, color: Colors.black),
      ),
      isDense: true,
    ),
  );
}

ThemeData buildDarkTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.black,
      secondary: Colors.pink[400]!,
      surface: Colors.grey[800]!,
      error: Colors.red[400]!,
      background: Colors.grey[700]!,
      primaryVariant: Colors.black,
      secondaryVariant: Colors.pink,
      onSurface: Colors.grey[100]!,
      onBackground: Colors.grey[100]!,
      onError: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
    ),
  ).copyWith(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
      backgroundColor: Colors.grey[700]!,
      foregroundColor: Colors.white,
    ),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      headline4: GoogleFonts.comfortaaTextTheme()
          .headline4!
          .copyWith(color: Colors.white),
      button: const TextStyle(
        fontWeight: FontWeight.bold,
        height: 1.2,
        wordSpacing: 0.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(width: 2.2, color: Colors.white),
      ),
      isDense: true,
    ),
  );
}
