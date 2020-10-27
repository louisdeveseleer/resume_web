import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/header_section/bouncing_profile_pic.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HeaderSection extends StatelessWidget {
  final ItemPositionsListener itemPositionsListener;
  HeaderSection({
    @required this.itemPositionsListener,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 580,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff7a7d6b),
                Color(0xff595e52),
                // Color(0xff43acf4),
                // Color(0xff1452be),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
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
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            isSmall
                ? BouncingProfilePic(
                    itemPositionsListener: itemPositionsListener,
                  )
                : PressableDough(
                    child: BouncingProfilePic(
                      itemPositionsListener: itemPositionsListener,
                    ),
                  ),
            // SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      ],
    );
  }
}
