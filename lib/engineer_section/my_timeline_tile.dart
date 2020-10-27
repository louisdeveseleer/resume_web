import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resume_web_app/widgets/image_dialog.dart';
import 'package:resume_web_app/widgets/responsive_widget.dart';
import 'package:transparent_image/transparent_image.dart';

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
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  bool _isHovering = false;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));
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
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool closed = !_isExpanded && _controller.isDismissed;

    final Widget details = Offstage(
      child: TickerMode(
        child: Column(
          children: widget.extras
              .map(
                (e) => IntrinsicHeight(
                  child: Row(
                    children: [
                      SizedBox(
                        width: isSmall ? 0 : 200,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 2,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          ),
                          Container(
                            width: 16,
                            height: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: isSmall ? 16 : 32,
                      ),
                      Expanded(
                        child: isSmall
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _contentChildren(context, e),
                              )
                            : Row(
                                children: _contentChildren(context, e),
                              ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        enabled: !closed,
      ),
      offstage: closed,
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  !isSmall
                      ? Container(
                          width: 200,
                          padding: EdgeInsets.only(right: 32),
                          child: Text(
                            widget.date,
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                            textAlign: TextAlign.end,
                          ),
                        )
                      : Container(),
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 2,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: isSmall ? 8 : 16,
                  ),
                  Expanded(
                    child: Tooltip(
                      message: 'Clip to expand',
                      waitDuration: Duration(milliseconds: 300),
                      preferBelow: true,
                      child: InkWell(
                        onTap: _handleTap,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            setState(() {
                              _isHovering = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              _isHovering = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: _isHovering
                                  ? Colors.white12
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: isSmall ? 8 : 16,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50.0, bottom: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        isSmall
                                            ? Text(
                                                widget.date,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                              )
                                            : Container(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Text(
                                            widget.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                        ),
                                        Text(
                                          widget.subtitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RotationTransition(
                                    turns: _iconTurns,
                                    child: const Icon(
                                      Icons.expand_more,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            ),
          ],
        );
      },
      child: closed ? null : details,
    );
  }

  List<Widget> _contentChildren(BuildContext context, ExtraLine e) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () =>
              showImageDialog(context: context, imagePath: e.imagePath),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: FadeInImage(
              fit: BoxFit.cover,
              width: 100,
              height: 65,
              fadeInDuration: Duration(milliseconds: 200),
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(e.imagePath),
            ),
          ),
        ),
      ),
      SizedBox(width: 16),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            e.text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    ];
  }
}
