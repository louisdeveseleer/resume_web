import 'package:flutter/material.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:resume_web_app/widgets/launch_url.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        Theme.of(context).textTheme.bodyMedium.copyWith(color: Colors.white);
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildItem(
                textStyle,
                () => launchURL('https://flutter.dev/'),
                'Created with Flutter',
              ),
              _buildItem(
                textStyle,
                () => launchURL('https://github.com/louisdeveseleer/resume_web'),
                'Source code',
              ),
              _buildItem(
                textStyle,
                () => showAboutDialog(
                  context: context,
                  applicationName: 'Louis Deveseleer CV',
                  applicationIcon:
                      Container(height: 30, child: Image.asset('web/icons/Icon-192.png')),
                ),
                'About',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(TextStyle textStyle, VoidCallback callback, String text) {
    return FittedBox(
      child: ClickRegion(
        onClick: callback,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
