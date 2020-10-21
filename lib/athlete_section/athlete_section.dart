import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_web_app/athlete_section/athlete_sub_section.dart';
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
      child: Column(
        children: [
          SectionTitle(
            icon: FontAwesomeIcons.heartbeat,
            title: 'Athlete',
          ),
          Text(
            '"Inspirational quote"',
            style: Theme.of(context).accentTextTheme.headline5.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          SizedBox(
            height: 64,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: AthleteSubSection(
                    title: 'Calisthenics',
                    subtitle: 'Mastering the body',
                    text:
                        'Regular practice since 2017. It improves various physical and cognitive functions, it is fun and it helps me relaxing and feeling good.',
                  ),
                ),
                Expanded(
                  child: AthleteSubSection(
                      title: 'Bike touring',
                      subtitle: 'Seeing the in-betweens',
                      text:
                          'Travelling by bike is an intense experience in many ways. It allows me to see regions and meet people otherwise missed with traditional tourism.'),
                ),
                Expanded(
                  child: AthleteSubSection(
                      title: 'Hiking',
                      subtitle: 'Connecting with nature',
                      text:
                          'I love hiking/camping trips to get away from everyday life and reconnect with nature and my simple human needs.'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
