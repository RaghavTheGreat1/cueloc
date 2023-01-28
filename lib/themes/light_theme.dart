import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
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
  );
}
