import 'package:flutter/material.dart';
import 'package:resume_web_app/developer_section/developer_text.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionTitle(
                icon: Icons.code,
                title: 'Developer',
              ),
              DeveloperText(),
              //TODO Add Flutter portfolio
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
