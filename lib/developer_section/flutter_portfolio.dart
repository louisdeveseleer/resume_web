import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/launch_url.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class FlutterPortfolio extends StatefulWidget {
  @override
  _FlutterPortfolioState createState() => _FlutterPortfolioState();
}

class _FlutterPortfolioState extends State<FlutterPortfolio> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    final TextStyle titleStyle = Theme.of(context)
        .textTheme
        .headline4
        .copyWith(color: Color(0xff595e52));

    return Column(
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
        SizedBox(height: 120),
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
                        text: 'A questionnaire made by ', style: textStyle),
                    TextSpan(
                      text: 'eparmedx.com',
                      style: textStyle.copyWith(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchURL('https://eparmedx.com/'),
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
        SizedBox(height: 120),
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
    );
  }
}

class PortfolioSubsection extends StatelessWidget {
  PortfolioSubsection({
    @required this.imagePath,
    @required this.content,
    this.isLeftAligned: true,
  });

  final String imagePath;
  final Widget content;
  final isLeftAligned;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      verticalDirection:
          isLeftAligned ? VerticalDirection.up : VerticalDirection.down,
      spacing: 100,
      runSpacing: 50,
      children: [
        isLeftAligned ? _buildImage() : _buildContent(),
        isLeftAligned ? _buildContent() : _buildImage(),
      ],
    );
  }

  Container _buildContent() {
    return Container(
      width: 500,
      child: content,
    );
  }

  Container _buildImage() {
    return Container(
      width: 400,
      constraints: BoxConstraints(maxHeight: 600),
      child: Image.asset(imagePath),
    );
  }
}
