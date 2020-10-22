import 'package:flutter/material.dart';

class DeveloperText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle = Theme.of(context).textTheme.headline6;
    final TextStyle _accentTextStyle = _textStyle.copyWith(
      color: Colors.green[700],
      fontWeight: FontWeight.w600,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'At university, I used ', style: _textStyle),
                TextSpan(text: 'Matlab', style: _accentTextStyle),
                TextSpan(text: ' in numerous projects.', style: _textStyle),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
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
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'In 2020, I got a passion for ', style: _textStyle),
                TextSpan(text: 'Flutter (dart)', style: _accentTextStyle),
                TextSpan(
                    text:
                        ', which allows to write applications for iOs, Android, Web and desktop with the same code base.',
                    style: _textStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future _showExtraInfo(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Text('Matlab'),
      );
    },
  );
}
