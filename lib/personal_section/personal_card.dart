import 'package:flutter/material.dart';
import 'dart:math';

class PersonalCard extends StatefulWidget {
  final String text;
  final String imagePath1;
  final String imagePath2;

  PersonalCard({
    required this.text,
    required this.imagePath1,
    required this.imagePath2,
  });

  @override
  _PersonalCardState createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  bool isFlipped = false;
  late final Image image1;
  late final Image image2;
  TextStyle? textStyle;
  late final double width;

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
    textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20);
    width = min(MediaQuery.of(context).size.width - 64, 300);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
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
            builder: (context, double value, child) {
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
                        clipBehavior: Clip.antiAlias,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
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

  const RotationY({super.key, required this.child, this.rotationY = 0});

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
