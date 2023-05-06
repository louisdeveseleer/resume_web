import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  void _openLinkedin() {
    launchURL('https://www.linkedin.com/in/louisdeveseleer/');
  }

  void _openMedium() {
    launchURL('https://medium.com/@louis.deveseleer');
  }

  Future<void> _copyEmail(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: 'louis.deveseleer@gmail.com'));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Column(
            children: [
              SectionTitle(
                icon: Icons.contact_page,
                title: 'Connect',
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => _copyEmail(context),
                      child: Container(
                        color: Color(0xffccaa8f),
                        child: ContactBlock(
                          label: 'louis.deveseleer@gmail.com',
                          icon: Icon(
                            Icons.email,
                            size: 56,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _openLinkedin,
                      child: Container(
                        color: Color(0xffccaa8f),
                        child: ContactBlock(
                          label: 'LinkedIn',
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 56,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _openMedium,
                      child: Container(
                        color: Color(0xffccaa8f),
                        child: ContactBlock(
                          label: 'Blog (Medium)',
                          icon: FaIcon(
                            FontAwesomeIcons.medium,
                            size: 56,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactBlock extends StatelessWidget {
  final String label;
  final Widget icon;
  ContactBlock({
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isSmall = ResponsiveWidget.isSmallScreen(context);
    return Center(
      child: Container(
        width: 420,
        padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: min(40, max(8, (MediaQuery.of(context).size.height - 600) / 4))),
        child: isSmall
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon,
                  SizedBox(
                    height: 8,
                  ),
                  FittedBox(
                    child: SelectableText(
                      label,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  icon,
                  SizedBox(
                    width: 16,
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: SelectableText(
                          label,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
