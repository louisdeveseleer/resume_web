import 'package:flutter/material.dart';
import 'package:resume_web_app/athlete_section/athlete_gallery.dart';
import 'package:resume_web_app/athlete_section/athlete_sub_section.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/section_title.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AthleteSection extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  AthleteSection({
    @required this.itemPositionsListener,
  });

  @override
  _AthleteSectionState createState() => _AthleteSectionState();
}

class _AthleteSectionState extends State<AthleteSection> {
  @override
  void initState() {
    widget.itemPositionsListener.itemPositions.addListener(() {});
    super.initState();
  }

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
            // Color(0xff43acf4),
            // Color(0xff1452be),
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
          // AthleteSubSection(
          //   title: 'Calisthenics',
          //   subtitle: 'Mastering the body',
          //   text: 'Regular practice since 2017.',
          //   imagePath: 'assets/calisthenics.jpg',
          //   leftAligned: true,
          // ),
          // SizedBox(
          //   height: 64,
          // ),
          // AthleteSubSection(
          //   title: 'Bike touring',
          //   subtitle: 'Seeing the in-betweens',
          //   text:
          //       'Travelling by bike allows me to see regions and meet people otherwise missed with traditional tourism.',
          //   imagePath: 'assets/EuroBikeTrip179.jpg',
          //   leftAligned: false,
          // ),
          // SizedBox(
          //   height: 64,
          // ),
          // AthleteSubSection(
          //   title: 'Hiking',
          //   subtitle: 'Connecting with nature',
          //   text:
          //       'I love hiking/camping trips to take a break from every day life.',
          //   imagePath: 'assets/hiking.jpg',
          //   leftAligned: true,
          // ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
