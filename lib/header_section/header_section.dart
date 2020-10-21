import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_web_app/header_section/profile_pic.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HeaderSection extends StatelessWidget {
  final ItemPositionsListener itemPositionsListener;
  HeaderSection({
    @required this.itemPositionsListener,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 580,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 1.5,
              colors: [
                Color(0xff43acf4),
                Color(0xff1452be),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 160,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello there, I am',
                    style: Theme.of(context).accentTextTheme.headline5,
                  ),
                  FittedBox(
                    child: Text(
                      'Louis Deveseleer',
                      style: Theme.of(context).accentTextTheme.headline2,
                    ),
                  ),
                  Text(
                    'and this is my CV',
                    style: Theme.of(context).accentTextTheme.headline5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ProfilePic(
              itemPositionsListener: itemPositionsListener,
            ),
          ],
        ),
      ],
    );
  }
}
