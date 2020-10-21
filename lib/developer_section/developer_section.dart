import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          SectionTitle(
            icon: Icons.code,
            title: 'Developer',
          ),
          SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
