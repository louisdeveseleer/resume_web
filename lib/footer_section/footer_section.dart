import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      color: Colors.blueGrey[300],
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClickRegion(
                onClick: () => _launchURL('https://flutter.dev/'),
                child: Text(
                  'Website created with Flutter',
                ),
              ),
              ClickRegion(
                onClick: () =>
                    _launchURL('https://github.com/louisdeveseleer/resume_web'),
                child: Text(
                  'See source code',
                ),
              ),
              ClickRegion(
                onClick: () => showAboutDialog(
                  context: context,
                  applicationName: 'Louis Deveseleer CV',
                  applicationIcon: Container(
                      height: 30, child: Image.asset('web/icons/Icon-192.png')),
                ),
                child: Text(
                  'About',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
