import 'package:flutter/material.dart';
import 'package:resume_web_app/home_page.dart';
import 'package:resume_web_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Louis Deveseleer',
      theme: Styles.themeData(),
      home: HomePage(),
    );
  }
}

//TODO check which files should NOT go to github
