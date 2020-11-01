import 'package:flutter/material.dart';
import 'package:resume_web_app/developer_section/developer_text.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: Styles.maxContentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionTitle(
                icon: Icons.code,
                title: 'Developer',
              ),
              DeveloperText(),
              SizedBox(
                height: 50,
              ),
              Text(
                'Here are my Flutter projects:',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
