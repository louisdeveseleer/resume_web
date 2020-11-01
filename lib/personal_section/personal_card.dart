import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class PersonalCard extends StatefulWidget {
  final String text;
  final String imagePath1;
  final String imagePath2;
  PersonalCard({
    @required this.text,
    @required this.imagePath1,
    @required this.imagePath2,
  });

  @override
  _PersonalCardState createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  bool isFlipped = false;
  Image image1;
  Image image2;

  @override
  void initState() {
    image1 = Image.asset(widget.imagePath1, fit: BoxFit.cover);
    image2 = Image.asset(widget.imagePath2, fit: BoxFit.cover);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20);
    final double width = min(MediaQuery.of(context).size.width - 64, 300);

    return Container(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: textStyle,
          ),
          SizedBox(
            height: 8,
          ),
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOut,
            tween: Tween<double>(begin: 0, end: isFlipped ? 180 : 0),
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isFlipped = !isFlipped;
                  });
                },
                child: MouseRegion(
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
                      width: width,
                      height: width,
                      child: Card(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2,
                          ),
                        ),
                        child: value >= 90 ? image2 : image1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
