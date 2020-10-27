import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static double maxContentWidth = 1400;

  static ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color(0xff595362),
      cardTheme: CardTheme(
        elevation: 4.0,
      ),
      accentColor: Color(0xffb28057),
      primarySwatch: Colors.indigo,
      textTheme: Typography.blackMountainView.copyWith(
        headline1: GoogleFonts.poppins(),
        headline2: GoogleFonts.poppins(),
        headline3: GoogleFonts.poppins(),
        headline4: GoogleFonts.poppins(),
        headline5: GoogleFonts.poppins(),
        headline6: GoogleFonts.poppins(),
        bodyText1: GoogleFonts.raleway().copyWith(
          fontSize: 20,
        ),
        subtitle1: GoogleFonts.raleway().copyWith(
          fontSize: 20,
        ),
      ),
      accentTextTheme: Typography.whiteMountainView.copyWith(
        headline1: GoogleFonts.poppins(),
        headline2: GoogleFonts.poppins(),
        headline3: GoogleFonts.poppins(),
        headline4: GoogleFonts.poppins(),
        headline5: GoogleFonts.poppins(),
        headline6: GoogleFonts.poppins(),
        bodyText1: GoogleFonts.raleway().copyWith(
          fontSize: 20,
        ),
        subtitle1: GoogleFonts.raleway().copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}
