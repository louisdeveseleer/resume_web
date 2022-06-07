import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static double maxContentWidth = 1400;

  static ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardTheme(
        elevation: 4.0,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color(0xffb28057),
        primary: Color(0xffb28057),
      ),
      // colorScheme: ColorScheme.fromSwatch(
      //   primarySwatch: Color(0xffb28057),

      //   accentColor: Color(0xffb28057),
      //   primaryColorDark: Color(0xff595362),
      // ),
      textTheme: Typography.blackMountainView.copyWith(
        headlineLarge: GoogleFonts.poppins(),
        headlineMedium: GoogleFonts.poppins(),
        headlineSmall: GoogleFonts.poppins(),
        bodyMedium: GoogleFonts.raleway().copyWith(
            // fontSize: 20,
            ),
        bodyLarge: GoogleFonts.raleway().copyWith(
            // fontSize: 20,
            ),
        bodySmall: GoogleFonts.raleway().copyWith(
            // fontSize: 20,
            ),
      ),
    );
  }
}
