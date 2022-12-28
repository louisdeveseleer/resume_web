import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/translate_on_hover.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return TranslateOnHover(
        child: _content(context),
      );
    else
      return _content(context);
  }

  Widget _content(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: Colors.black87,
        );
    return Row(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        SizedBox(width: 8),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: textStyle?.color,
        ),
      ],
    );
  }
}
