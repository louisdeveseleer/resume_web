// import 'dart:html';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/home_page.dart';
import 'package:resume_web_app/theme.dart';

void main() async {
  // querySelector("#container").remove();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
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
