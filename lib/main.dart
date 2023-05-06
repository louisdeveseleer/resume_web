import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/home_page.dart';
import 'package:resume_web_app/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
