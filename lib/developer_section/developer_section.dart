import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:resume_web_app/developer_section/developer_text.dart';
import 'package:resume_web_app/developer_section/potfolio_subsection.dart';
import 'package:resume_web_app/developer_section/video_widget.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/click_region.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:resume_web_app/widgets/section_title.dart';

class DeveloperSection extends StatelessWidget {
  final String bullet = '\u2022';

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
                image: Image.asset('assets/screenshot_website.png'),
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
                image: VideoWidget('https://youtu.be/dmBs_oGOTCY'),
                // image: Image.asset('assets/screenshot_parq.png'),
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
                          'The official PAR-Q+ app, a questionnaire made by https://eparmedx.com/ to determine whether you need to consult a medical professional before increasing your physical activity.',
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
                // image: Image.asset('assets/screenshot_calistree1.png'),
                image: VideoWidget('https://youtu.be/VURmTUM20bU'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Workout log',
                      style: titleStyle,
                    ),
                    Text(
                      '$bullet Create workouts, log your progress ang gain experience points.',
                      style: textStyle,
                    ),
                    Text(
                      '$bullet Filter exercises according to difficulty, type of exercise, equipment needed, ...',
                      style: textStyle,
                    ),
                    Text(
                      '$bullet Authentication with Firebase.',
                      style: textStyle,
                    ),
                    Text(
                      '$bullet Synchronization of local and remote databases.',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              PortfolioSubsection(
                isLeftAligned: false,
                image: EasyWebView(
                    src: 'https://calistree.app/#/',
                    onLoaded: () {
                      print('loaded webview');
                    }),
                // image: Image.asset('assets/screenshot_parq.png'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Calistree',
                      style: titleStyle,
                    ),
                    Text(
                      'Project to create the most complete library of calisthenics exercises.',
                      style: textStyle,
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'Try it out! 🡒',
                      style: textStyle,
                      textAlign: TextAlign.end,
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
