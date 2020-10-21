import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
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
            icon: Icons.contact_mail,
            title: 'Contact',
          ),
          SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }
}
