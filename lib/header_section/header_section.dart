import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HeaderSection extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  HeaderSection({
    @required this.itemPositionsListener,
  });
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 1200), vsync: this)
          ..reset();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    widget.itemPositionsListener.itemPositions.addListener(() {
      if (widget.itemPositionsListener.itemPositions.value.first
                  .itemTrailingEdge <
              1.2 &&
          !_controller.isAnimating) {
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 580,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.5,
                  colors: [
                    Color(0xff43acf4),
                    Color(0xff1452be),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 160,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello there, I am',
                    style: Theme.of(context).accentTextTheme.headline5,
                  ),
                  FittedBox(
                    child: Text(
                      'Louis Deveseleer',
                      style: Theme.of(context).accentTextTheme.headline2,
                    ),
                  ),
                  Text(
                    'and this is my CV',
                    style: Theme.of(context).accentTextTheme.headline5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ScaleTransition(
              scale: _animation,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(32),
                width: 500,
                height: 500,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Theme.of(context).accentColor,
                      width: 5,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/louis.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
