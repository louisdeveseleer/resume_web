import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class DeveloperText extends StatelessWidget {
  final double padding = 32;

  @override
  Widget build(BuildContext context) {
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final double padding = isSmall ? 16 : 32;
    final TextStyle _textStyle = Theme.of(context).textTheme.bodyText1;
    final TextStyle _accentTextStyle = _textStyle.copyWith(
      color: Color(0xff748A4D),
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Color(0xffECECE9),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(padding),
          topRight: Radius.circular(padding),
          bottomRight: Radius.circular(padding),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text:
                        'I\'ve had a passion for programming since I was a teenager. At 16, I learned the basics of ',
                    style: _textStyle),
                TextSpan(
                  text: 'C.',
                  style: _accentTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'At 17, I wrote several programs in my calculator (',
                    style: _textStyle),
                TextSpan(text: 'Casio-BASIC', style: _accentTextStyle),
                TextSpan(
                    text:
                        ') that were the most advanced my teacher had seen so far.',
                    style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'At university, I used ', style: _textStyle),
                TextSpan(text: 'Matlab', style: _accentTextStyle),
                TextSpan(text: ' in numerous projects.', style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'During a research intern job, I used ',
                    style: _textStyle),
                TextSpan(text: 'C++', style: _accentTextStyle),
                TextSpan(text: ' and ', style: _textStyle),
                TextSpan(text: 'image recognition', style: _accentTextStyle),
                TextSpan(text: ' to analyse X-rays.', style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'My thesis work made heavy use of ',
                    style: _textStyle),
                TextSpan(text: 'ROS (C++)', style: _accentTextStyle),
                TextSpan(
                    text: ' to control 4-wheeled robots.', style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'During another project, I used ', style: _textStyle),
                TextSpan(text: 'C#', style: _accentTextStyle),
                TextSpan(
                    text:
                        ' to control a Kinect Camera to calibrate a robotic arm.',
                    style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'I also programmed ', style: _textStyle),
                TextSpan(text: 'microcontrollers', style: _accentTextStyle),
                TextSpan(
                    text: ' (Arduino) to control pneumatic valves and robots.',
                    style: _textStyle),
              ],
            ),
          ),
          SizedBox(height: padding),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'In 2020, I got into ', style: _textStyle),
                TextSpan(text: 'Flutter (dart)', style: _accentTextStyle),
                TextSpan(
                    text:
                        ', which allows to write applications for iOs, Android, Web and desktop with the same code base.',
                    style: _textStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
