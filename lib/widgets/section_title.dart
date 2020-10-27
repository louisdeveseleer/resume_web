import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    @required this.icon,
    @required this.title,
    this.darkTheme = false,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool darkTheme;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = darkTheme
        ? Theme.of(context).accentTextTheme
        : Theme.of(context).textTheme;
    final isSmall = ResponsiveWidget.isSmallScreen(context);
    final TextStyle textStyle =
        isSmall ? textTheme.headline4 : textTheme.headline3;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isSmall ? 70 : 100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textStyle.color,
            size: textStyle.fontSize,
          ),
          SizedBox(width: isSmall ? 32 : 64),
          Text(
            title,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
