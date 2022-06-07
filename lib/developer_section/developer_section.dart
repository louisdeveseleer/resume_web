import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:resume_web_app/developer_section/potfolio_subsection.dart';
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
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topRight,
      //     end: Alignment.bottomLeft,
      //     colors: [
      //       Color(0xffe5d5c7),
      //       Color(0xffd2b69d),
      //       // Color(0xfffac62b),
      //       // Color(0xfffd9812),
      //     ],
      //   ),
      // ),
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
              Text(
                'Here are my Flutter projects:',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 100,
              ),
              PortfolioSubsection(
                isLeftAligned: false,
                image: Image.asset('assets/PlayStoreSlide1.png'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Calistree',
                      style: titleStyle,
                    ),
                    Text(
                      'Considered by many as the most advanced calisthenics app available. Building this entirely by myself taught me a lot about how to create, develop and grow an app-based business.',
                      style: textStyle,
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://play.google.com/store/apps/details?id=com.calistree.calistree'),
                            child: Image.asset('assets/google-play-badge.png'),
                          ),
                        ),
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://apps.apple.com/us/app/calistree/id1558561315'),
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
                isLeftAligned: true,
                image: InkWell(
                  onTap: () {
                    launchURL('https://getrella.com/');
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset('assets/rella-screenshot.jpg'),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rella',
                      style: titleStyle,
                    ),
                    Linkify(
                      onOpen: (link) async => launchURL(link.url),
                      textAlign: TextAlign.start,
                      style: textStyle,
                      text:
                          'As the only front-end dev, I helped this wonderful team build the Rella-app from the ground up.',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://play.google.com/store/apps/details?id=com.rellasocial.mobile'),
                            child: Image.asset('assets/google-play-badge.png'),
                          ),
                        ),
                        Expanded(
                          child: ClickRegion(
                            onClick: () => launchURL(
                                'https://apps.apple.com/app/apple-store/id1592004181'),
                            child: Image.asset('assets/app-store_badge.png'),
                          ),
                        ),
                        Expanded(child: ElevatedButton(onPressed: ()=>launchURL('https://app.rellasocial.com/'), child: Text('Web app'),),),
                      ],
                    ),
                  ],
                ),
              ),
                SizedBox(height: 100),
              PortfolioSubsection(
                isLeftAligned: true,
                image: InkWell(
                  onTap: () {
                    launchURL('http://1vision.media/');
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset('assets/1vision.jpg'),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1Vision Media',
                      style: titleStyle,
                    ),
                    Linkify(
                      onOpen: (link) async => launchURL(link.url),
                      textAlign: TextAlign.start,
                      style: textStyle,
                      text:
                          'Suite of apps used to enhance live game experiences in high schools. I helped this team reach their deadlines by working on several of their cross-platform apps.',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              PortfolioSubsection(
                isLeftAligned: true,
                image: InkWell(
                  onTap: () {
                    launchURL('https://youtu.be/dmBs_oGOTCY');
                  },
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset('assets/screenshot_parq.png'),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PAR-Q+',
                      style: titleStyle,
                    ),
                    Linkify(
                      onOpen: (link) async => launchURL(link.url),
                      textAlign: TextAlign.start,
                      style: textStyle,
                      text:
                          'The official PAR-Q+ app, a questionnaire made by https://eparmedx.com to determine whether you need to consult a medical professional before increasing your physical activity.',
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
                isLeftAligned: false,
                image: Image.asset('assets/screenshot_website.png'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                image: InkWell(
                  onTap: () {
                    launchURL('https://youtu.be/VURmTUM20bU');
                  },
                  child: Stack(
                    children: [
                      Center(
                          child:
                              Image.asset('assets/screenshot_calistree1.png')),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Workout log (my first app)',
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
              // SizedBox(height: 50),
              // DeveloperText(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
