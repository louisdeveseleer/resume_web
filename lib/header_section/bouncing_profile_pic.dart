import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BouncingProfilePic extends StatefulWidget {
  final ItemPositionsListener itemPositionsListener;
  BouncingProfilePic({
    @required this.itemPositionsListener,
  });

  @override
  _BouncingProfilePicState createState() => _BouncingProfilePicState();
}

class _BouncingProfilePicState extends State<BouncingProfilePic>
    with SingleTickerProviderStateMixin {
  Animation<double> _appearanceAnimation;
  AnimationController _appearanceController;
  bool animationDone = false;
  Image louis;
  bool louisIsLoaded = false;

  @override
  void initState() {
    louis = Image.asset('assets/louis.jpg');
    _appearanceController =
        AnimationController(duration: Duration(milliseconds: 1200), vsync: this)
          ..reset();
    _appearanceAnimation = CurvedAnimation(
        parent: _appearanceController, curve: Curves.elasticOut);
    widget.itemPositionsListener.itemPositions.addListener(() {
      double trailingEdge = widget.itemPositionsListener.itemPositions.value
          .toList()[0]
          .itemTrailingEdge;
      if (trailingEdge < 1.2 &&
          !_appearanceController.isAnimating &&
          louisIsLoaded &&
          !animationDone) {
        print('forward');
        _appearanceController.forward();
        animationDone = true;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _appearanceController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(louis.image, context)
        .whenComplete(() => louisIsLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: _appearanceAnimation,
      child: Container(
        width: 400,
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(16),
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
                  image: louis.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
