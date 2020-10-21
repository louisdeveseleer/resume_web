import 'package:flutter/material.dart';

class AthleteSubSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;

  AthleteSubSection({
    @required this.title,
    @required this.subtitle,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black12,
            Colors.black12,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).accentTextTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subtitle,
                style: Theme.of(context).accentTextTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: Theme.of(context).accentTextTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
