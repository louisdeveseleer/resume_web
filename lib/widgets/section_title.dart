import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.icon,
    required this.title,
    this.darkTheme = false,
    super.key,
  });

  final IconData icon;
  final String title;
  final bool darkTheme;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final color = darkTheme ? Colors.white60 : Colors.black54;
    final isSmall = ResponsiveWidget.isSmallScreen(context);
    final textStyle = isSmall
        ? textTheme.headline4?.copyWith(color: color)
        : textTheme.headline3?.copyWith(color: color);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: min(100, max(0, MediaQuery.of(context).size.height / 10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textStyle?.color,
            size: textStyle?.fontSize,
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
