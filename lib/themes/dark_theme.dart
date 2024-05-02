import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme() {
  ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF6B4FA9),
    brightness: Brightness.dark,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.rubikTextTheme().apply(
      bodyColor: colorScheme.onBackground,
      displayColor: colorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorScheme.primaryContainer,
      contentTextStyle: GoogleFonts.rubik(
        color: colorScheme.onPrimaryContainer,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      closeIconColor: colorScheme.onPrimaryContainer,
      insetPadding: const EdgeInsets.all(24),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.onPrimaryContainer,
      foregroundColor: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: colorScheme.onBackground,
      titleTextStyle: GoogleFonts.rubik(
        fontWeight: FontWeight.w600,
        color: colorScheme.onBackground,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(colorScheme.onPrimaryContainer),
        foregroundColor: MaterialStatePropertyAll(colorScheme.primaryContainer),
      ),
    ),
  );
}
