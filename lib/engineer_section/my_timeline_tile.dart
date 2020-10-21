import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume_web_app/widgets/image_dialog.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExtraLine {
  String imagePath;
  String text;
  ExtraLine({
    @required this.imagePath,
    @required this.text,
  });
}

class MyTimelineTile extends StatefulWidget {
  const MyTimelineTile({
    Key key,
    @required this.date,
    @required this.title,
    @required this.subtitle,
    this.isFirst: false,
    this.isLast: false,
    @required this.extras,
  }) : super(key: key);

  final String date;
  final String title;
  final String subtitle;
  final bool isLast;
  final bool isFirst;
  final List<ExtraLine> extras;

  @override
  _MyTimelineTileState createState() => _MyTimelineTileState();
}

class _MyTimelineTileState extends State<MyTimelineTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  bool _isExpanded = false;
  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = ResponsiveWidget.isSmallScreen(context);

    LineStyle lineStyle = LineStyle(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      thickness: 2,
    );

    final bool closed = !_isExpanded && _controller.isDismissed;

    final Widget result = Offstage(
      child: TickerMode(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: widget.extras
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => showImageDialog(
                              context: context, imagePath: e.imagePath),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              width: 100,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(e.imagePath),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            e.text,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        enabled: !closed,
      ),
      offstage: closed,
    );

    return TimelineTile(
      beforeLineStyle: lineStyle,
      afterLineStyle: lineStyle,
      isFirst: widget.isFirst,
      isLast: widget.isLast,
      axis: TimelineAxis.vertical,
      alignment: isSmall ? TimelineAlign.start : TimelineAlign.manual,
      lineXY: 0.3,
      indicatorStyle: IndicatorStyle(
        indicator: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
        padding: EdgeInsets.all(8),
      ),
      startChild: isSmall
          ? null
          : Container(
              padding: EdgeInsets.all(24),
              alignment: Alignment.centerRight,
              constraints: BoxConstraints(
                minHeight: 100,
              ),
              child: Text(
                widget.date,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
      endChild: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isSmall
                ? Text(
                    widget.date,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  )
                : Container(),
            AnimatedBuilder(
              animation: _controller.view,
              builder: (context, child) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: _handleTap,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      widget.title,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  Text(
                                    widget.subtitle,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                            RotationTransition(
                              turns: _iconTurns,
                              child: const Icon(Icons.expand_more),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        heightFactor: _heightFactor.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                );
              },
              child: closed ? null : result,
            ),
          ],
        ),
      ),
    );
  }
}
