import 'package:flutter/material.dart';

class AthleteSubSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final String imagePath;
  final bool leftAligned;

  AthleteSubSection({
    @required this.title,
    @required this.subtitle,
    @required this.text,
    @required this.imagePath,
    this.leftAligned: true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment:
            leftAligned ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          leftAligned ? _buildPicture() : _buildText(context),
          SizedBox(
            width: 64,
          ),
          leftAligned ? _buildText(context) : _buildPicture(),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Container(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).accentTextTheme.headline4,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subtitle,
              style: Theme.of(context).accentTextTheme.headline5,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).accentTextTheme.headline6,
              textAlign: leftAligned ? TextAlign.start : TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicture() {
    return Container(
      height: 350,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
