import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: const Color(0xFF6B4FA9));
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.rubikTextTheme(),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: Colors.black,
      titleTextStyle: GoogleFonts.rubik(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(colorScheme.onPrimaryContainer),
        foregroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
      ),
    ),
  );
}
