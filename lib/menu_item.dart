import 'package:flutter/material.dart';
import 'package:resume_web_app/widgets/translate_on_hover.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    @required this.text,
  }) : super(key: key);

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
    TextStyle textStyle = Theme.of(context).accentTextTheme.headline5.copyWith(
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
          color: textStyle.color,
        ),
      ],
    );
  }
}
