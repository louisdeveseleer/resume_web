import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    @required this.icon,
    @required this.title,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline3;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textStyle.color,
            size: textStyle.fontSize,
          ),
          SizedBox(width: 64),
          Text(
            title,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
