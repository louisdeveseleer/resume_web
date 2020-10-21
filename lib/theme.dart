import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData() {
    Color blueColor = Color(0xff1c65eb);
    Color orangeColor = Color(0xffffb420);
    Color darkGreyColor = Color(0xff3e4254);
    Color lightGreyColor = Color(0xff727f8b);

    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: blueColor,
      cardTheme: CardTheme(
        elevation: 8.0,
      ),
      appBarTheme: AppBarTheme(
        color: blueColor,
        elevation: 4.0,
      ),
      accentColor: orangeColor,
      primarySwatch: Colors.blue,
      textTheme: Typography.blackCupertino,
      accentTextTheme: Typography.whiteCupertino,
    );
  }
}
