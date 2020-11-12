import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:resume_web_app/developer_section/developer_text.dart';
import 'package:resume_web_app/developer_section/potfolio_subsection.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
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
              SectionTitle(
                icon: Icons.code,
                title: 'Developer',
              ),
              DeveloperText(),
              SizedBox(
                height: 50,
              ),
              Text(
                'Here are my Flutter projects:',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 100,
              ),
              PortfolioSubsection(
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
              SizedBox(height: 100),
              PortfolioSubsection(
                isLeftAligned: false,
                imagePath: 'assets/screenshot_parq.png',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'PAR-Q+',
                      style: titleStyle,
                    ),
                    Linkify(
                      textAlign: TextAlign.end,
                      style: textStyle,
                      text:
                          'A questionnaire made by https://eparmedx.com/ to determine whether you need to consult a medical professional before increasing your physical activity.',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://play.google.com/store/apps/details?id=com.louisdeveseleer.parq'),
                            child: Image.asset('assets/google-play-badge.png'),
                          ),
                        ),
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://apps.apple.com/us/app/par-q/id1538862965'),
                            child: Image.asset('assets/app-store_badge.png'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              PortfolioSubsection(
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
