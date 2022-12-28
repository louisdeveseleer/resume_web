import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume_web_app/theme.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class AthleteSubSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final String imagePath;
  final bool leftAligned;

  AthleteSubSection({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.imagePath,
    this.leftAligned: true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    double maxWidth = min(MediaQuery.of(context).size.width, Styles.maxContentWidth);
    if (!isSmall) maxWidth /= 2;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isSmall
          ? Column(
              children: [
                _buildPicture(maxWidth: maxWidth),
                SizedBox(
                  height: 32,
                ),
                _buildText(context: context, maxWidth: maxWidth, isSmall: isSmall),
              ],
            )
          : Row(
              mainAxisAlignment: leftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                leftAligned
                    ? _buildPicture(maxWidth: maxWidth)
                    : _buildText(context: context, maxWidth: maxWidth, isSmall: isSmall),
                SizedBox(
                  width: 64,
                ),
                leftAligned
                    ? _buildText(context: context, maxWidth: maxWidth, isSmall: isSmall)
                    : _buildPicture(maxWidth: maxWidth),
              ],
            ),
    );
  }

  Widget _buildText(
      {required BuildContext context, required double maxWidth, required bool isSmall}) {
    return Container(
      width: 600,
      constraints: BoxConstraints(maxWidth: maxWidth - 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicture({required double maxWidth}) {
    return Container(
      height: 350,
      constraints: BoxConstraints(
        maxWidth: min(maxWidth - 80, 600),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
