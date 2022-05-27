import 'package:flutter/material.dart';

class ClickRegion extends StatelessWidget {
  final Function onClick;
  final Widget child;
  ClickRegion({
    @required this.onClick,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: child,
      ),
    );
  }
}
