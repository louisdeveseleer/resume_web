import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/developer_section/potfolio_subsection.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/launch_url.dart';

class PortfolioSection extends StatelessWidget {
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
