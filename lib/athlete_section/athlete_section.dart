import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_web_app/athlete_section/athlete_sub_section.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class AthleteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff43acf4),
            Color(0xff1452be),
          ],
        ),
      ),
      child: Center(
        child: Container(
          width: Styles.maxContentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionTitle(
                icon: FontAwesomeIcons.heartbeat,
                title: 'Athlete',
              ),
              Text(
                '"In order for man to succeed in life, God provided him with two means, education and physical activity. Not separately, one for the soul and the other for the body, but for the two together. With these two means, man can attain perfection."',
                style: Theme.of(context).accentTextTheme.headline5.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              Text(
                '- Plato -',
                style: Theme.of(context).accentTextTheme.headline6,
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 128,
              ),
              //TODO Animated entry (fadein, slidetransition)
              AthleteSubSection(
                title: 'Calisthenics',
                subtitle: 'Mastering the body',
                text:
                    'Regular practice since 2017. It improves various physical and cognitive functions, it is fun and it helps me relaxing and feeling good.',
                imagePath: 'assets/calisthenics.jpg',
                leftAligned: true,
              ),
              SizedBox(
                height: 64,
              ),
              AthleteSubSection(
                title: 'Bike touring',
                subtitle: 'Seeing the in-betweens',
                text:
                    'Travelling by bike is an intense experience in many ways. It allows me to see regions and meet people otherwise missed with traditional tourism.',
                imagePath: 'assets/EuroBikeTrip179.jpg',
                leftAligned: false,
              ),
              SizedBox(
                height: 64,
              ),
              AthleteSubSection(
                title: 'Hiking',
                subtitle: 'Connecting with nature',
                text:
                    'I love hiking/camping trips to get away from everyday life and reconnect with nature and my simple human needs.',
                imagePath: 'assets/HikingSwitzerland.jpg',
                leftAligned: true,
              ),
              SizedBox(
                height: 64,
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
