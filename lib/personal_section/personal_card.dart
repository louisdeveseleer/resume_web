import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class PersonalCard extends StatefulWidget {
  final String text;
  final ImageProvider image1;
  final Color color1;
  final Color color2;
  final ImageProvider image2;
  PersonalCard({
    @required this.text,
    @required this.image1,
    @required this.color1,
    @required this.color2,
    @required this.image2,
  });

  @override
  _PersonalCardState createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .accentTextTheme
        .headline5
        .copyWith(fontWeight: FontWeight.w500);

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0, end: isFlipped ? 180 : 0),
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isFlipped = true;
            });
          },
          onExit: (_) {
            setState(() {
              isFlipped = false;
            });
          },
          child: RotationY(
            rotationY: value >= 90 ? value - 180 : value,
            child: Container(
              constraints: BoxConstraints(
                minWidth: 250,
                maxWidth: 350,
                minHeight: 300,
                maxHeight: 400,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: value >= 90
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.image2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    widget.color1,
                                    widget.color2,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    widget.text,
                                    style: textStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: widget.image1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RotationY extends StatelessWidget {
  //Degrees to rads constant
  static const double degrees2Radians = pi / 180;

  final Widget child;
  final double rotationY;

  const RotationY({Key key, @required this.child, this.rotationY = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) //These are magic numbers, just use them :)
          ..rotateY(rotationY * degrees2Radians),
        child: child);
  }
}
