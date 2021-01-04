import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/header_section/bouncing_profile_pic.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'dart:html' as html;

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 530,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff7a7d6b),
                Color(0xff595e52),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      'Louis Deveseleer',
                      style: Theme.of(context).accentTextTheme.headline2,
                    ),
                  ),
                  Text(
                    'Welcome to my CV',
                    style: Theme.of(context).accentTextTheme.headline5,
                  ),
                  ClickRegion(
                    onClick: () => html.window.open(
                      'https://firebasestorage.googleapis.com/v0/b/louisdeveseleerresume.appspot.com/o/CV.pdf?alt=media&token=58c78cb8-caa1-44d9-8bf4-addbde21d5ca',
                      'CV Louis Deveseleer',
                    ),
                    child: Text(
                      'pdf version',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            isSmall
                ? BouncingProfilePic()
                : PressableDough(
                    child: BouncingProfilePic(),
                  ),
          ],
        ),
      ],
    );
  }
}
