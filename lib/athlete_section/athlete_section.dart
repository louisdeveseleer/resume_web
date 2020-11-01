import 'package:flutter/material.dart';
import 'package:resume_web_app/athlete_section/athlete_gallery.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class AthleteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff595362),
            Color(0xff4f4b58),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: Styles.maxContentWidth,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SectionTitle(
                    icon: Icons.fitness_center,
                    title: 'Athlete',
                    darkTheme: true,
                  ),
                  Text(
                    '❝ In order for man to succeed in life, God provided him with two means, education and physical activity. Not separately, one for the soul and the other for the body, but for the two together. With these two means, man can attain perfection. ❞',
                    style: Theme.of(context).accentTextTheme.bodyText1,
                  ),
                  Text(
                    '- Plato -',
                    style: Theme.of(context).accentTextTheme.headline6,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 128,
                  ),
                ],
              ),
            ),
          ),
          AthleteGallery(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
