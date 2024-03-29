import 'package:flutter/material.dart';
import 'package:resume_web_app/athlete_section/athlete_section.dart';
import 'package:resume_web_app/contact_section/contact_section.dart';
import 'package:resume_web_app/developer_section/developer_section.dart';
import 'package:resume_web_app/engineer_section/engineer_section.dart';
import 'package:resume_web_app/footer_section/footer_section.dart';
import 'package:resume_web_app/header_section/header_section.dart';
import 'package:resume_web_app/personal_section/personal_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderSection(),
              PersonalSection(),
              DeveloperSection(),
              EngineerSection(),
              AthleteSection(),
              ContactSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
