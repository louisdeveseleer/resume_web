import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/developer_section/potfolio_subsection.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PortfolioSection extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  PortfolioSection({
    @required this.itemPositionsListener,
  });

  @override
  _PortfolioSectionState createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection> {
  double scrollingPosition = 0;
  double offset1 = 0;
  double offset2 = 0;
  double offset3 = 0;

  void initState() {
    widget.itemPositionsListener.itemPositions.addListener(() {
      List<ItemPosition> itemPositions =
          widget.itemPositionsListener.itemPositions.value.toList();
      ItemPosition itemPosition = itemPositions
          .singleWhere((element) => element.index == 4, orElse: () => null);
      if (itemPosition != null) {
        double leading = itemPosition.itemLeadingEdge;
        double trailing = itemPosition.itemTrailingEdge;
        scrollingPosition = (leading - 1) / (leading - trailing);
        offset1 = max(0, min((scrollingPosition - 0.2) * 3, 1));
        offset2 = max(0, min((scrollingPosition - 0.4) * 3, 1));
        offset3 = max(0, min((scrollingPosition - 0.8) * 5, 1));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    final TextStyle titleStyle = Theme.of(context)
        .textTheme
        .headline4
        .copyWith(color: Color(0xff595e52));
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: Styles.maxContentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              PortfolioSubsection(
                imageOffset: offset1,
                imagePath: 'assets/screenshot_website.png',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This website',
                      style: titleStyle,
                    ),
                    Text(
                      'A web application.',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 180),
              PortfolioSubsection(
                imageOffset: offset2,
                isLeftAligned: false,
                imagePath: 'assets/screenshot_parq.png',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PAR-Q+',
                      style: titleStyle,
                    ),
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'A questionnaire made by ',
                              style: textStyle),
                          TextSpan(
                            text: 'eparmedx.com',
                            style: textStyle.copyWith(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => launchURL('https://eparmedx.com/'),
                          ),
                          TextSpan(
                              text:
                                  ' to determine whether you need to consult a medical professional before increasing your physical activity.',
                              style: textStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 180),
              PortfolioSubsection(
                imageOffset: offset3,
                imagePath: 'assets/screenshot_calistree1.png',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Calistree',
                      style: titleStyle,
                    ),
                    Text(
                      'A pet project under development. Personalised bodyweight training based on your profile, preferences and objectives. Take control of your own physical development with the help of a powerful AI and a huge exercise library.',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
