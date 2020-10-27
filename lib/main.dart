import 'dart:html';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/home_page.dart';
import 'package:resume_web_app/theme.dart';

void main() {
  querySelector("#loader").remove();
  runApp(MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Louis Deveseleer',
      theme: Styles.themeData(),
      home: HomePage(),
    );
  }
}
